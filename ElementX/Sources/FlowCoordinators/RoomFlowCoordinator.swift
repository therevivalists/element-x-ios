//
// Copyright 2023 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Combine
import SwiftState
import SwiftUI
import UserNotifications

// swiftlint:disable file_length
enum RoomFlowCoordinatorAction: Equatable {
    case presentRoom(roomID: String)
    case presentCallScreen(roomProxy: RoomProxyProtocol)
    case finished
    
    static func == (lhs: RoomFlowCoordinatorAction, rhs: RoomFlowCoordinatorAction) -> Bool {
        switch (lhs, rhs) {
        case (.presentRoom(let lhsRoomID), .presentRoom(let rhsRoomID)):
            lhsRoomID == rhsRoomID
        case (.presentCallScreen(let lhsRoomProxy), .presentCallScreen(let rhsRoomProxy)):
            lhsRoomProxy.id == rhsRoomProxy.id
        case (.finished, .finished):
            true
        default:
            false
        }
    }
}

/// A value that represents where the room flow will be started.
enum RoomFlowCoordinatorEntryPoint: Hashable {
    /// The flow will start by showing the room directly.
    case room
    /// The flow will start by showing the room, focussing on the supplied event ID.
    case eventID(String)
    /// The flow will start by showing the room's details.
    case roomDetails
}

// swiftlint:disable:next type_body_length
class RoomFlowCoordinator: FlowCoordinatorProtocol {
    private let roomID: String
    private let userSession: UserSessionProtocol
    private let isChildFlow: Bool
    private let roomTimelineControllerFactory: RoomTimelineControllerFactoryProtocol
    private let navigationStackCoordinator: NavigationStackCoordinator
    private let emojiProvider: EmojiProviderProtocol
    private let appMediator: AppMediatorProtocol
    private let appSettings: AppSettings
    private let analytics: AnalyticsService
    private let userIndicatorController: UserIndicatorControllerProtocol
    
    private var roomProxy: RoomProxyProtocol!
    
    private var roomScreenCoordinator: RoomScreenCoordinator?
    private weak var joinRoomScreenCoordinator: JoinRoomScreenCoordinator?
    
    // periphery:ignore - used to avoid deallocation
    private var rolesAndPermissionsFlowCoordinator: RoomRolesAndPermissionsFlowCoordinator?
    // periphery:ignore - used to avoid deallocation
    private var childRoomFlowCoordinator: RoomFlowCoordinator?
    
    private let stateMachine: StateMachine<State, Event> = .init(state: .initial)
    
    private var cancellables = Set<AnyCancellable>()
    
    private let actionsSubject: PassthroughSubject<RoomFlowCoordinatorAction, Never> = .init()
    var actions: AnyPublisher<RoomFlowCoordinatorAction, Never> {
        actionsSubject.eraseToAnyPublisher()
    }
    
    private var timelineController: RoomTimelineControllerProtocol?
    
    init(roomID: String,
         userSession: UserSessionProtocol,
         isChildFlow: Bool,
         roomTimelineControllerFactory: RoomTimelineControllerFactoryProtocol,
         navigationStackCoordinator: NavigationStackCoordinator,
         emojiProvider: EmojiProviderProtocol,
         appMediator: AppMediatorProtocol,
         appSettings: AppSettings,
         analytics: AnalyticsService,
         userIndicatorController: UserIndicatorControllerProtocol) async {
        self.roomID = roomID
        self.userSession = userSession
        self.isChildFlow = isChildFlow
        self.roomTimelineControllerFactory = roomTimelineControllerFactory
        self.navigationStackCoordinator = navigationStackCoordinator
        self.emojiProvider = emojiProvider
        self.appMediator = appMediator
        self.appSettings = appSettings
        self.analytics = analytics
        self.userIndicatorController = userIndicatorController
        
        setupStateMachine()
        
        analytics.signpost.beginRoomFlow(roomID)
    }
        
    // MARK: - FlowCoordinatorProtocol
    
    func start() {
        fatalError("This flow coordinator expect a route")
    }
    
    func handleAppRoute(_ appRoute: AppRoute, animated: Bool) {
        guard stateMachine.state != .complete else {
            fatalError("This flow coordinator is `finished` ☠️")
        }
        
        switch appRoute {
        case .room(let roomID):
            Task {
                await handleRoomRoute(roomID: roomID, animated: animated)
            }
        case .childRoom(let roomID):
            if case .presentingChild = stateMachine.state, let childRoomFlowCoordinator {
                childRoomFlowCoordinator.handleAppRoute(appRoute, animated: animated)
            } else if roomID != roomProxy.id {
                stateMachine.tryEvent(.startChildFlow(roomID: roomID, entryPoint: .room), userInfo: EventUserInfo(animated: animated))
            } else {
                MXLog.info("Ignoring presentation of the same room as a child of this one.")
            }
        case .roomDetails(let roomID):
            guard roomID == self.roomID else { fatalError("Navigation route doesn't belong to this room flow.") }
            
            Task {
                if roomProxy == nil {
                    guard let roomProxy = await userSession.clientProxy.roomForIdentifier(roomID) else {
                        return
                    }
                    
                    await storeAndSubscribeToRoomProxy(roomProxy)
                }
                
                stateMachine.tryEvent(.presentRoomDetails, userInfo: EventUserInfo(animated: animated))
            }
        case .roomMemberDetails(let userID):
            // Always assume this will be presented on the child, external permalinks to a user aren't for a room member.
            if case .presentingChild = stateMachine.state, let childRoomFlowCoordinator {
                childRoomFlowCoordinator.handleAppRoute(appRoute, animated: animated)
            } else {
                stateMachine.tryEvent(.presentRoomMemberDetails(userID: userID), userInfo: EventUserInfo(animated: animated))
            }
        case .event(let roomID, let eventID):
            Task { await handleRoomRoute(roomID: roomID, focussedEventID: eventID, animated: animated) }
        case .childEvent(let roomID, let eventID):
            if case .presentingChild = stateMachine.state, let childRoomFlowCoordinator {
                childRoomFlowCoordinator.handleAppRoute(appRoute, animated: animated)
            } else if roomID != roomProxy.id {
                stateMachine.tryEvent(.startChildFlow(roomID: roomID, entryPoint: .eventID(eventID)), userInfo: EventUserInfo(animated: animated))
            } else {
                roomScreenCoordinator?.focusOnEvent(eventID: eventID)
            }
        case .roomAlias, .childRoomAlias, .eventOnRoomAlias, .childEventOnRoomAlias:
            break // These are converted to a room ID route one level above.
        case .roomList, .userProfile, .genericCallLink, .oidcCallback, .settings, .chatBackupSettings:
            break // These routes can't be handled.
        }
    }
    
    private func handleRoomRoute(roomID: String, focussedEventID: String? = nil, animated: Bool) async {
        guard roomID == self.roomID else { fatalError("Navigation route doesn't belong to this room flow.") }
        
        guard let roomProxy = await userSession.clientProxy.roomForIdentifier(roomID) else {
            stateMachine.tryEvent(.presentJoinRoomScreen, userInfo: EventUserInfo(animated: animated))
            return
        }
        
        switch roomProxy.membership {
        case .joined:
            await storeAndSubscribeToRoomProxy(roomProxy)
            stateMachine.tryEvent(.presentRoom(focussedEventID: focussedEventID), userInfo: EventUserInfo(animated: animated))
        default:
            stateMachine.tryEvent(.presentJoinRoomScreen, userInfo: EventUserInfo(animated: animated))
        }
    }

    func clearRoute(animated: Bool) {
        guard stateMachine.state != .initial else {
            return
        }
        
        stateMachine.tryEvent(.dismissFlow, userInfo: EventUserInfo(animated: animated))
    }
    
    // MARK: - Private
    
    private func storeAndSubscribeToRoomProxy(_ roomProxy: RoomProxyProtocol) async {
        if let oldRoomProxy = self.roomProxy {
            if oldRoomProxy.id != roomProxy.id {
                fatalError("Trying to create different room proxies for the same flow coordinator")
            }
            
            return
        }
        
        guard roomProxy.membership == .joined else {
            fatalError("Requesting room details for an unjoined room")
        }
        
        self.roomProxy = roomProxy
        
        await roomProxy.subscribeForUpdates()
    }
    
    // swiftlint:disable:next function_body_length
    private func setupStateMachine() {
        stateMachine.addRouteMapping { event, fromState, _ in
            switch (fromState, event) {
            case (_, .presentJoinRoomScreen):
                return .joinRoomScreen
            case (_, .dismissJoinRoomScreen):
                return .complete
                
            case (_, .presentRoom):
                return .room
            case (_, .dismissFlow):
                return .complete
                
            case (.initial, .presentRoomDetails):
                return .roomDetails(isRoot: true)
            case (.room, .presentRoomDetails):
                return .roomDetails(isRoot: false)
            case (.roomDetails, .dismissRoomDetails):
                return .room
                
            case (.roomDetails, .presentRoomDetailsEditScreen):
                return .roomDetailsEditScreen
            case (.roomDetailsEditScreen, .dismissRoomDetailsEditScreen):
                return .roomDetails(isRoot: false)
                
            case (.roomDetails, .presentNotificationSettingsScreen):
                return .notificationSettings
            case (.notificationSettings, .dismissNotificationSettingsScreen):
                return .roomDetails(isRoot: false)
                
            case (.notificationSettings, .presentGlobalNotificationSettingsScreen):
                return .globalNotificationSettings
            case (.globalNotificationSettings, .dismissGlobalNotificationSettingsScreen):
                return .notificationSettings
                
            case (.roomDetails, .presentRoomMembersList):
                return .roomMembersList
            case (.roomMembersList, .dismissRoomMembersList):
                return .roomDetails(isRoot: false)

            case (.room, .presentRoomMemberDetails(userID: let userID)):
                return .roomMemberDetails(userID: userID, fromRoomMembersList: false)
            case (.roomMembersList, .presentRoomMemberDetails(userID: let userID)):
                return .roomMemberDetails(userID: userID, fromRoomMembersList: true)
            case (.roomMemberDetails(_, let fromRoomMembersList), .dismissRoomMemberDetails):
                return fromRoomMembersList ? .roomMembersList : .room
            
            case (.roomMemberDetails(_, fromRoomMembersList: false), .presentUserProfile(let userID)):
                return .userProfile(userID: userID)
            case (.userProfile, .dismissUserProfile):
                return .room
                
            case (.roomDetails, .presentInviteUsersScreen):
                return .inviteUsersScreen(fromRoomMembersList: false)
            case (.roomMembersList, .presentInviteUsersScreen):
                return .inviteUsersScreen(fromRoomMembersList: true)
            case (.inviteUsersScreen(let fromRoomMembersList), .dismissInviteUsersScreen):
                return fromRoomMembersList ? .roomMembersList : .roomDetails(isRoot: false)
                
            case (.room, .presentReportContent(let itemID, let senderID)):
                return .reportContent(itemID: itemID, senderID: senderID)
            case (.reportContent, .dismissReportContent):
                return .room
                
            case (.room, .presentMediaUploadPicker(let source)):
                return .mediaUploadPicker(source: source)
            case (.mediaUploadPicker, .dismissMediaUploadPicker):
                return .room
                
            case (.mediaUploadPicker, .presentMediaUploadPreview(let fileURL)):
                return .mediaUploadPreview(fileURL: fileURL)
            case (.room, .presentMediaUploadPreview(let fileURL)):
                return .mediaUploadPreview(fileURL: fileURL)
            case (.mediaUploadPreview, .dismissMediaUploadPreview):
                return .room
                
            case (.room, .presentEmojiPicker(let itemID, let selectedEmoji)):
                return .emojiPicker(itemID: itemID, selectedEmojis: selectedEmoji)
            case (.emojiPicker, .dismissEmojiPicker):
                return .room

            case (.room, .presentMessageForwarding(let itemID)):
                return .messageForwarding(itemID: itemID)
            case (.messageForwarding, .dismissMessageForwarding):
                return .room

            case (.room, .presentMapNavigator):
                return .mapNavigator
            case (.mapNavigator, .dismissMapNavigator):
                return .room
            
            case (.room, .presentPollForm):
                return .pollForm
            case (.pollForm, .dismissPollForm):
                return .room
            
            case (.roomDetails, .presentPollsHistory):
                return .pollsHistory
            case (.pollsHistory, .dismissPollsHistory):
                return .roomDetails(isRoot: false)
            
            case (.pollsHistory, .presentPollForm):
                return .pollsHistoryForm
            case (.pollsHistoryForm, .dismissPollForm):
                return .pollsHistory
            
            case (.roomDetails, .presentRolesAndPermissionsScreen):
                return .rolesAndPermissions
            case (.rolesAndPermissions, .dismissRolesAndPermissionsScreen):
                return .roomDetails(isRoot: false)
            
            // Child flow
            
            case (_, .startChildFlow(let roomID, _)):
                return .presentingChild(childRoomID: roomID, previousState: fromState)
            case (.presentingChild(_, let previousState), .dismissChildFlow):
                return previousState
            
            default:
                return nil
            }
        }
        
        stateMachine.addAnyHandler(.any => .any) { [weak self] context in
            guard let self else { return }
            
            let animated = (context.userInfo as? EventUserInfo)?.animated ?? true
            
            switch (context.fromState, context.event, context.toState) {
            case (_, .presentJoinRoomScreen, .joinRoomScreen):
                presentJoinRoomScreen(animated: true)
            case (_, .dismissJoinRoomScreen, .complete):
                dismissFlow(animated: animated)
            
            case (_, .presentRoom(let focussedEventID), .room):
                Task { await self.presentRoom(fromState: context.fromState, focussedEventID: focussedEventID, animated: animated) }
            case (_, .dismissFlow, .complete):
                dismissFlow(animated: animated)
            
            case (.initial, .presentRoomDetails, .roomDetails(let isRoot)),
                 (.room, .presentRoomDetails, .roomDetails(let isRoot)),
                 (.roomDetails, .presentRoomDetails, .roomDetails(let isRoot)):
                Task { await self.presentRoomDetails(isRoot: isRoot, animated: animated) }
            case (.roomDetails, .dismissRoomDetails, .room):
                break
                
            case (.roomDetails, .presentRoomDetailsEditScreen, .roomDetailsEditScreen):
                presentRoomDetailsEditScreen()
            case (.roomDetailsEditScreen, .dismissRoomDetailsEditScreen, .roomDetails):
                break
                
            case (.roomDetails, .presentNotificationSettingsScreen, .notificationSettings):
                presentNotificationSettingsScreen()
            case (.notificationSettings, .dismissNotificationSettingsScreen, .roomDetails):
                break
                
            case (.notificationSettings, .presentGlobalNotificationSettingsScreen, .globalNotificationSettings):
                presentGlobalNotificationSettingsScreen()
            case (.globalNotificationSettings, .dismissGlobalNotificationSettingsScreen, .notificationSettings):
                break
                
            case (.roomDetails, .presentRoomMembersList, .roomMembersList):
                presentRoomMembersList()
            case (.roomMembersList, .dismissRoomMembersList, .roomDetails):
                break
                
            case (.room, .presentRoomMemberDetails, .roomMemberDetails(let userID, _)):
                presentRoomMemberDetails(userID: userID)
            case (.roomMemberDetails, .dismissRoomMemberDetails, .room):
                break
                
            case (.roomMembersList, .presentRoomMemberDetails, .roomMemberDetails(let userID, _)):
                presentRoomMemberDetails(userID: userID)
            case (.roomMemberDetails, .dismissRoomMemberDetails, .roomMembersList):
                break
            
            case (.roomMemberDetails, .presentUserProfile(let userID), .userProfile):
                replaceRoomMemberDetailsWithUserProfile(userID: userID)
            case (.userProfile, .dismissUserProfile, .room):
                break
                
            case (.roomDetails, .presentInviteUsersScreen, .inviteUsersScreen):
                presentInviteUsersScreen()
            case (.inviteUsersScreen, .dismissInviteUsersScreen, .roomDetails):
                break
                
            case (.roomMembersList, .presentInviteUsersScreen, .inviteUsersScreen):
                presentInviteUsersScreen()
            case (.inviteUsersScreen, .dismissInviteUsersScreen, .roomMembersList):
                break
                
            case (.room, .presentReportContent, .reportContent(let itemID, let senderID)):
                presentReportContent(for: itemID, from: senderID)
            case (.reportContent, .dismissReportContent, .room):
                break
                
            case (.room, .presentMediaUploadPicker, .mediaUploadPicker(let source)):
                presentMediaUploadPickerWithSource(source)
            case (.mediaUploadPicker, .dismissMediaUploadPicker, .room):
                break
                
            case (.mediaUploadPicker, .presentMediaUploadPreview, .mediaUploadPreview(let fileURL)):
                presentMediaUploadPreviewScreen(for: fileURL)
            case (.room, .presentMediaUploadPreview, .mediaUploadPreview(let fileURL)):
                presentMediaUploadPreviewScreen(for: fileURL)
            case (.mediaUploadPreview, .dismissMediaUploadPreview, .room):
                break
                
            case (.room, .presentEmojiPicker, .emojiPicker(let itemID, let selectedEmoji)):
                presentEmojiPicker(for: itemID, selectedEmoji: selectedEmoji)
            case (.emojiPicker, .dismissEmojiPicker, .room):
                break
                
            case (.room, .presentMessageForwarding(let itemID), .messageForwarding):
                presentMessageForwarding(for: itemID)
            case (.messageForwarding, .dismissMessageForwarding, .room):
                break

            case (.room, .presentMapNavigator(let mode), .mapNavigator):
                presentMapNavigator(interactionMode: mode)
            case (.mapNavigator, .dismissMapNavigator, .room):
                break

            case (.room, .presentPollForm(let mode), .pollForm):
                presentPollForm(mode: mode)
            case (.pollForm, .dismissPollForm, .room):
                break

            case (.roomDetails, .presentPollsHistory, .pollsHistory):
                presentPollsHistory()
            case (.pollsHistory, .dismissPollsHistory, .roomDetails):
                break
        
            case (.pollsHistory, .presentPollForm(let mode), .pollsHistoryForm):
                presentPollForm(mode: mode)
            case (.pollsHistoryForm, .dismissPollForm, .pollsHistory):
                break
            
            case (.roomDetails, .presentRolesAndPermissionsScreen, .rolesAndPermissions):
                presentRolesAndPermissionsScreen()
            case (.rolesAndPermissions, .dismissRolesAndPermissionsScreen, .roomDetails):
                rolesAndPermissionsFlowCoordinator = nil
            
            // Child flow
            case (_, .startChildFlow(let roomID, let entryPoint), .presentingChild):
                Task { await self.startChildFlow(for: roomID, entryPoint: entryPoint) }
            case (.presentingChild, .dismissChildFlow, _):
                childRoomFlowCoordinator = nil
            
            default:
                fatalError("Unknown transition: \(context)")
            }
        }
        
        stateMachine.addAnyHandler(.any => .any) { context in
            if let event = context.event {
                MXLog.info("Transitioning from `\(context.fromState)` to `\(context.toState)` with event `\(event)`")
            } else {
                MXLog.info("Transitioning from \(context.fromState)` to `\(context.toState)`")
            }
        }
        
        stateMachine.addErrorHandler { context in
            if context.fromState == context.toState {
                MXLog.error("Failed transition from equal states: \(context.fromState)")
            } else {
                fatalError("Failed transition with context: \(context)")
            }
        }
    }
    
    /// Updates the navigation stack so it displays the timeline for the given room
    /// - Parameters:
    ///   - fromState: The state that asked for the room presentation.
    ///   - focussedEventID: An (optional) event ID that the timeline should be focussed around.
    ///   - animated: whether it should animate the transition
    private func presentRoom(fromState: State, focussedEventID: String? = nil, animated: Bool) async {
        // If any sheets are presented dismiss them, rely on their dismissal callbacks to transition the state machine
        // through the correct states before presenting the room
        navigationStackCoordinator.setSheetCoordinator(nil)
        
        // Handle selecting the same room again
        if !isChildFlow {
            // First unwind the navigation stack
            navigationStackCoordinator.popToRoot(animated: animated)
            
            // And then decide if the room actually needs to be presented again
            switch fromState {
            case .initial, .roomDetails(isRoot: true), .joinRoomScreen:
                break
            default:
                return // The room is already on the stack, no need to present it again
            }
        }
        
        Task {
            // Flag the room as read on entering, the timeline will take care of the read receipts
            await roomProxy.flagAsUnread(false)
        }
        
        let userID = userSession.clientProxy.userID
        
        let timelineItemFactory = RoomTimelineItemFactory(userID: userID,
                                                          attributedStringBuilder: AttributedStringBuilder(mentionBuilder: MentionBuilder()),
                                                          stateEventStringBuilder: RoomStateEventStringBuilder(userID: userID))
                
        let timelineController = roomTimelineControllerFactory.buildRoomTimelineController(roomProxy: roomProxy,
                                                                                           timelineItemFactory: timelineItemFactory)
        self.timelineController = timelineController
        
        analytics.trackViewRoom(isDM: roomProxy.isDirect, isSpace: roomProxy.isSpace)
        
        let completionSuggestionService = CompletionSuggestionService(roomProxy: roomProxy)
        
        let parameters = RoomScreenCoordinatorParameters(roomProxy: roomProxy,
                                                         focussedEventID: focussedEventID,
                                                         timelineController: timelineController,
                                                         mediaProvider: userSession.mediaProvider,
                                                         mediaPlayerProvider: MediaPlayerProvider(),
                                                         voiceMessageMediaManager: userSession.voiceMessageMediaManager,
                                                         emojiProvider: emojiProvider,
                                                         completionSuggestionService: completionSuggestionService,
                                                         appMediator: appMediator,
                                                         appSettings: appSettings)
        
        let coordinator = RoomScreenCoordinator(parameters: parameters)
        coordinator.actions
            .sink { [weak self] action in
                guard let self else { return }
                
                switch action {
                case .presentRoomDetails:
                    stateMachine.tryEvent(.presentRoomDetails)
                case .presentReportContent(let itemID, let senderID):
                    stateMachine.tryEvent(.presentReportContent(itemID: itemID, senderID: senderID))
                case .presentMediaUploadPicker(let source):
                    stateMachine.tryEvent(.presentMediaUploadPicker(source: source))
                case .presentMediaUploadPreviewScreen(let url):
                    stateMachine.tryEvent(.presentMediaUploadPreview(fileURL: url))
                case .presentEmojiPicker(let itemID, let selectedEmojis):
                    stateMachine.tryEvent(.presentEmojiPicker(itemID: itemID, selectedEmojis: selectedEmojis))
                case .presentLocationPicker:
                    stateMachine.tryEvent(.presentMapNavigator(interactionMode: .picker))
                case .presentPollForm(let mode):
                    stateMachine.tryEvent(.presentPollForm(mode: mode))
                case .presentLocationViewer(_, let geoURI, let description):
                    stateMachine.tryEvent(.presentMapNavigator(interactionMode: .viewOnly(geoURI: geoURI, description: description)))
                case .presentRoomMemberDetails(userID: let userID):
                    stateMachine.tryEvent(.presentRoomMemberDetails(userID: userID))
                case .presentMessageForwarding(let itemID):
                    stateMachine.tryEvent(.presentMessageForwarding(itemID: itemID))
                case .presentCallScreen:
                    actionsSubject.send(.presentCallScreen(roomProxy: roomProxy))
                }
            }
            .store(in: &cancellables)
        
        roomScreenCoordinator = coordinator
        if !isChildFlow {
            let animated = UIDevice.current.userInterfaceIdiom == .phone ? animated : false
            navigationStackCoordinator.setRootCoordinator(coordinator, animated: animated) { [weak self] in
                self?.stateMachine.tryEvent(.dismissFlow)
            }
        } else {
            if joinRoomScreenCoordinator != nil {
                navigationStackCoordinator.pop()
            }
            
            navigationStackCoordinator.push(coordinator, animated: animated) { [weak self] in
                self?.stateMachine.tryEvent(.dismissFlow)
            }
        }
    }
    
    private func presentJoinRoomScreen(animated: Bool) {
        let coordinator = JoinRoomScreenCoordinator(parameters: .init(roomID: roomID,
                                                                      clientProxy: userSession.clientProxy,
                                                                      mediaProvider: userSession.mediaProvider,
                                                                      userIndicatorController: userIndicatorController))
        
        joinRoomScreenCoordinator = coordinator
        
        coordinator.actionsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] action in
                guard let self else { return }
                
                switch action {
                case .joined:
                    Task { [weak self] in
                        guard let self else { return }
                        
                        if let roomProxy = await userSession.clientProxy.roomForIdentifier(roomID) {
                            await storeAndSubscribeToRoomProxy(roomProxy)
                            stateMachine.tryEvent(.presentRoom(focussedEventID: nil), userInfo: EventUserInfo(animated: animated))
                            
                            analytics.trackJoinedRoom(isDM: roomProxy.isDirect, isSpace: roomProxy.isSpace, activeMemberCount: UInt(roomProxy.activeMembersCount))
                        } else {
                            stateMachine.tryEvent(.dismissFlow, userInfo: EventUserInfo(animated: animated))
                        }
                    }
                case .cancelled:
                    stateMachine.tryEvent(.dismissJoinRoomScreen)
                }
            }
            .store(in: &cancellables)
        
        if !isChildFlow {
            navigationStackCoordinator.setRootCoordinator(coordinator, animated: animated) { [weak self] in
                if self?.stateMachine.state == .joinRoomScreen {
                    self?.stateMachine.tryEvent(.dismissJoinRoomScreen)
                }
            }
        } else {
            navigationStackCoordinator.push(coordinator, animated: animated) { [weak self] in
                if self?.stateMachine.state == .joinRoomScreen {
                    self?.stateMachine.tryEvent(.dismissJoinRoomScreen)
                }
            }
        }
    }
    
    private func dismissFlow(animated: Bool) {
        childRoomFlowCoordinator?.clearRoute(animated: animated)
        
        if isChildFlow {
            // We don't support dismissing a child flow by itself, only the entire chain.
            MXLog.info("Leaving the rest of the navigation clean-up to the parent flow.")
            
            if joinRoomScreenCoordinator != nil {
                navigationStackCoordinator.pop()
            }
        } else {
            navigationStackCoordinator.popToRoot(animated: false)
            navigationStackCoordinator.setRootCoordinator(nil, animated: false)
        }
        
        roomProxy?.unsubscribeFromUpdates()
        
        timelineController = nil
        
        actionsSubject.send(.finished)
        analytics.signpost.endRoomFlow()
    }
    
    private func presentRoomDetails(isRoot: Bool, animated: Bool) async {
        let params = RoomDetailsScreenCoordinatorParameters(roomProxy: roomProxy,
                                                            clientProxy: userSession.clientProxy,
                                                            mediaProvider: userSession.mediaProvider,
                                                            analyticsService: analytics,
                                                            userIndicatorController: userIndicatorController,
                                                            notificationSettings: userSession.clientProxy.notificationSettings,
                                                            attributedStringBuilder: AttributedStringBuilder(mentionBuilder: MentionBuilder()))
        let coordinator = RoomDetailsScreenCoordinator(parameters: params)
        coordinator.actions.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case .leftRoom:
                stateMachine.tryEvent(.dismissFlow)
            case .presentRoomMembersList:
                stateMachine.tryEvent(.presentRoomMembersList)
            case .presentRoomDetailsEditScreen:
                stateMachine.tryEvent(.presentRoomDetailsEditScreen)
            case .presentNotificationSettingsScreen:
                stateMachine.tryEvent(.presentNotificationSettingsScreen)
            case .presentInviteUsersScreen:
                stateMachine.tryEvent(.presentInviteUsersScreen)
            case .presentPollsHistory:
                stateMachine.tryEvent(.presentPollsHistory)
            case .presentRolesAndPermissionsScreen:
                stateMachine.tryEvent(.presentRolesAndPermissionsScreen)
            }
        }
        .store(in: &cancellables)
        
        if isRoot {
            navigationStackCoordinator.setRootCoordinator(coordinator, animated: animated) { [weak self] in
                guard let self else { return }
                if stateMachine.state != .room { // The root has been replaced by a room
                    stateMachine.tryEvent(.dismissFlow)
                }
            }
        } else {
            navigationStackCoordinator.push(coordinator, animated: animated) { [weak self] in
                guard let self else { return }
                if case .roomDetails = stateMachine.state {
                    stateMachine.tryEvent(.dismissRoomDetails)
                }
            }
        }
    }
    
    private func presentRoomMembersList() {
        let parameters = RoomMembersListScreenCoordinatorParameters(mediaProvider: userSession.mediaProvider,
                                                                    roomProxy: roomProxy,
                                                                    userIndicatorController: userIndicatorController,
                                                                    analytics: analytics)
        let coordinator = RoomMembersListScreenCoordinator(parameters: parameters)
        
        coordinator.actions
            .sink { [weak self] action in
                guard let self else { return }
                
                switch action {
                case .invite:
                    stateMachine.tryEvent(.presentInviteUsersScreen)
                case .selectedMember(let member):
                    stateMachine.tryEvent(.presentRoomMemberDetails(userID: member.userID))
                }
            }
            .store(in: &cancellables)
        
        navigationStackCoordinator.push(coordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissRoomMembersList)
        }
    }
    
    private func presentRoomDetailsEditScreen() {
        let stackCoordinator = NavigationStackCoordinator()
        
        let roomDetailsEditParameters = RoomDetailsEditScreenCoordinatorParameters(roomProxy: roomProxy,
                                                                                   mediaProvider: userSession.mediaProvider,
                                                                                   navigationStackCoordinator: stackCoordinator,
                                                                                   userIndicatorController: userIndicatorController,
                                                                                   orientationManager: appMediator.windowManager)
        let roomDetailsEditCoordinator = RoomDetailsEditScreenCoordinator(parameters: roomDetailsEditParameters)
        
        roomDetailsEditCoordinator.actions.sink { [weak self] action in
            switch action {
            case .dismiss:
                self?.navigationStackCoordinator.setSheetCoordinator(nil)
            }
        }
        .store(in: &cancellables)
        
        stackCoordinator.setRootCoordinator(roomDetailsEditCoordinator)
        
        navigationStackCoordinator.setSheetCoordinator(stackCoordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissRoomDetailsEditScreen)
        }
    }
    
    private func presentReportContent(for itemID: TimelineItemIdentifier, from senderID: String) {
        guard let eventID = itemID.eventID else {
            fatalError()
        }
        
        let stackCoordinator = NavigationStackCoordinator()
        let parameters = ReportContentScreenCoordinatorParameters(eventID: eventID,
                                                                  senderID: senderID,
                                                                  roomProxy: roomProxy,
                                                                  clientProxy: userSession.clientProxy,
                                                                  userIndicatorController: userIndicatorController)
        let coordinator = ReportContentScreenCoordinator(parameters: parameters)
        
        coordinator.actions
            .sink { [weak self] action in
                guard let self else { return }
                
                navigationStackCoordinator.setSheetCoordinator(nil)
                
                switch action {
                case .cancel:
                    break
                case .finish:
                    userIndicatorController.submitIndicator(UserIndicator(title: L10n.commonReportSubmitted, iconName: "checkmark"))
                }
            }
            .store(in: &cancellables)
        
        stackCoordinator.setRootCoordinator(coordinator)
        navigationStackCoordinator.setSheetCoordinator(stackCoordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissReportContent)
        }
    }
    
    private func presentMediaUploadPickerWithSource(_ source: MediaPickerScreenSource) {
        let stackCoordinator = NavigationStackCoordinator()

        let mediaPickerCoordinator = MediaPickerScreenCoordinator(userIndicatorController: userIndicatorController,
                                                                  source: source,
                                                                  orientationManager: appMediator.windowManager) { [weak self] action in
            guard let self else {
                return
            }
            switch action {
            case .cancel:
                navigationStackCoordinator.setSheetCoordinator(nil)
            case .selectMediaAtURL(let url):
                stateMachine.tryEvent(.presentMediaUploadPreview(fileURL: url))
            }
        }

        stackCoordinator.setRootCoordinator(mediaPickerCoordinator)

        navigationStackCoordinator.setSheetCoordinator(stackCoordinator) { [weak self] in
            if case .mediaUploadPicker = self?.stateMachine.state {
                self?.stateMachine.tryEvent(.dismissMediaUploadPicker)
            }
        }
    }

    private func presentMediaUploadPreviewScreen(for url: URL) {
        let stackCoordinator = NavigationStackCoordinator()

        let parameters = MediaUploadPreviewScreenCoordinatorParameters(userIndicatorController: userIndicatorController,
                                                                       roomProxy: roomProxy,
                                                                       mediaUploadingPreprocessor: MediaUploadingPreprocessor(),
                                                                       title: url.lastPathComponent,
                                                                       url: url)

        let mediaUploadPreviewScreenCoordinator = MediaUploadPreviewScreenCoordinator(parameters: parameters)
        
        mediaUploadPreviewScreenCoordinator.actions
            .sink { [weak self] action in
                guard let self else { return }
                
                switch action {
                case .dismiss:
                    navigationStackCoordinator.setSheetCoordinator(nil)
                }
            }
            .store(in: &cancellables)

        stackCoordinator.setRootCoordinator(mediaUploadPreviewScreenCoordinator)
        
        navigationStackCoordinator.setSheetCoordinator(stackCoordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissMediaUploadPreview)
        }
    }
    
    private func presentEmojiPicker(for itemID: TimelineItemIdentifier, selectedEmoji: Set<String>) {
        let params = EmojiPickerScreenCoordinatorParameters(emojiProvider: emojiProvider,
                                                            itemID: itemID, selectedEmojis: selectedEmoji)
        let coordinator = EmojiPickerScreenCoordinator(parameters: params)
        
        coordinator.actions.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case let .emojiSelected(emoji: emoji, itemID: itemID):
                MXLog.debug("Selected \(emoji) for \(itemID)")
                navigationStackCoordinator.setSheetCoordinator(nil)
                Task {
                    await self.timelineController?.toggleReaction(emoji, to: itemID)
                }
            case .dismiss:
                navigationStackCoordinator.setSheetCoordinator(nil)
            }
        }
        .store(in: &cancellables)
        
        navigationStackCoordinator.setSheetCoordinator(coordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissEmojiPicker)
        }
    }

    private func presentMapNavigator(interactionMode: StaticLocationInteractionMode) {
        let stackCoordinator = NavigationStackCoordinator()
        
        let params = StaticLocationScreenCoordinatorParameters(interactionMode: interactionMode, appMediator: appMediator)
        let coordinator = StaticLocationScreenCoordinator(parameters: params)
        
        coordinator.actions.sink { [weak self] action in
            guard let self else { return }
            switch action {
            case .selectedLocation(let geoURI, let isUserLocation):
                Task {
                    _ = await self.roomProxy.timeline.sendLocation(body: geoURI.bodyMessage,
                                                                   geoURI: geoURI,
                                                                   description: nil,
                                                                   zoomLevel: 15,
                                                                   assetType: isUserLocation ? .sender : .pin)
                    self.navigationStackCoordinator.setSheetCoordinator(nil)
                }
                
                self.analytics.trackComposer(inThread: false,
                                             isEditing: false,
                                             isReply: false,
                                             messageType: isUserLocation ? .LocationUser : .LocationPin,
                                             startsThread: nil)
            case .close:
                self.navigationStackCoordinator.setSheetCoordinator(nil)
            }
        }
        .store(in: &cancellables)
        
        stackCoordinator.setRootCoordinator(coordinator)
        
        navigationStackCoordinator.setSheetCoordinator(stackCoordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissMapNavigator)
        }
    }

    private func presentPollForm(mode: PollFormMode) {
        let stackCoordinator = NavigationStackCoordinator()
        let coordinator = PollFormScreenCoordinator(parameters: .init(mode: mode))
        stackCoordinator.setRootCoordinator(coordinator)

        coordinator.actions
            .sink { [weak self] action in
                guard let self else {
                    return
                }

                self.navigationStackCoordinator.setSheetCoordinator(nil)

                switch action {
                case .cancel:
                    break
                case .delete:
                    deletePoll(mode: mode)
                case let .submit(question, options, pollKind):
                    switch mode {
                    case .new:
                        createPoll(question: question, options: options, pollKind: pollKind)
                    case .edit(let eventID, _):
                        editPoll(pollStartID: eventID, question: question, options: options, pollKind: pollKind)
                    }
                }
            }
            .store(in: &cancellables)

        navigationStackCoordinator.setSheetCoordinator(stackCoordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissPollForm)
        }
    }
    
    private func createPoll(question: String, options: [String], pollKind: Poll.Kind) {
        Task {
            let result = await roomProxy.timeline.createPoll(question: question, answers: options, pollKind: pollKind)

            self.analytics.trackComposer(inThread: false,
                                         isEditing: false,
                                         isReply: false,
                                         messageType: .Poll,
                                         startsThread: nil)

            self.analytics.trackPollCreated(isUndisclosed: pollKind == .undisclosed, numberOfAnswers: options.count)
            
            switch result {
            case .success:
                break
            case .failure:
                self.userIndicatorController.submitIndicator(UserIndicator(title: L10n.errorUnknown))
            }
        }
    }
    
    private func editPoll(pollStartID: String, question: String, options: [String], pollKind: Poll.Kind) {
        Task {
            let result = await roomProxy.timeline.editPoll(original: pollStartID, question: question, answers: options, pollKind: pollKind)
            
            switch result {
            case .success:
                break
            case .failure:
                self.userIndicatorController.submitIndicator(UserIndicator(title: L10n.errorUnknown))
            }
        }
    }
    
    private func deletePoll(mode: PollFormMode) {
        Task {
            guard case .edit(let pollStartID, _) = mode else {
                self.userIndicatorController.submitIndicator(UserIndicator(title: L10n.errorUnknown))
                return
            }
            
            let result = await roomProxy.redact(pollStartID)
            
            switch result {
            case .success:
                break
            case .failure:
                self.userIndicatorController.submitIndicator(UserIndicator(title: L10n.errorUnknown))
            }
        }
    }
    
    private func presentPollsHistory() {
        Task {
            await asyncPresentRoomPollsHistory()
        }
    }
    
    private func asyncPresentRoomPollsHistory() async {
        let userID = userSession.clientProxy.userID
        
        let timelineItemFactory = RoomTimelineItemFactory(userID: userID,
                                                          attributedStringBuilder: AttributedStringBuilder(mentionBuilder: MentionBuilder()),
                                                          stateEventStringBuilder: RoomStateEventStringBuilder(userID: userID))
                
        let roomTimelineController = roomTimelineControllerFactory.buildRoomTimelineController(roomProxy: roomProxy,
                                                                                               timelineItemFactory: timelineItemFactory)
        
        let parameters = RoomPollsHistoryScreenCoordinatorParameters(roomProxy: roomProxy,
                                                                     pollInteractionHandler: PollInteractionHandler(analyticsService: analytics, roomProxy: roomProxy),
                                                                     roomTimelineController: roomTimelineController)
        let coordinator = RoomPollsHistoryScreenCoordinator(parameters: parameters)
        coordinator.actions
            .sink { [weak self] action in
                guard let self else { return }
                
                switch action {
                case .editPoll(let pollStartID, let poll):
                    stateMachine.tryEvent(.presentPollForm(mode: .edit(eventID: pollStartID, poll: poll)))
                }
            }
            .store(in: &cancellables)
        
        navigationStackCoordinator.push(coordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissPollsHistory)
        }
    }
    
    private func presentRoomMemberDetails(userID: String) {
        let params = RoomMemberDetailsScreenCoordinatorParameters(userID: userID,
                                                                  roomProxy: roomProxy,
                                                                  clientProxy: userSession.clientProxy,
                                                                  mediaProvider: userSession.mediaProvider,
                                                                  userIndicatorController: userIndicatorController,
                                                                  analytics: analytics)
        let coordinator = RoomMemberDetailsScreenCoordinator(parameters: params)
        
        coordinator.actions.sink { [weak self] action in
            guard let self else { return }
            switch action {
            case .openUserProfile:
                stateMachine.tryEvent(.presentUserProfile(userID: userID))
            case .openDirectChat(let roomID):
                stateMachine.tryEvent(.startChildFlow(roomID: roomID, entryPoint: .room))
            }
        }
        .store(in: &cancellables)

        navigationStackCoordinator.push(coordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissRoomMemberDetails)
        }
    }
    
    private func replaceRoomMemberDetailsWithUserProfile(userID: String) {
        let parameters = UserProfileScreenCoordinatorParameters(userID: userID,
                                                                isPresentedModally: false,
                                                                clientProxy: userSession.clientProxy,
                                                                mediaProvider: userSession.mediaProvider,
                                                                userIndicatorController: userIndicatorController,
                                                                analytics: analytics)
        let coordinator = UserProfileScreenCoordinator(parameters: parameters)
        coordinator.actionsPublisher.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case .openDirectChat(let roomID):
                stateMachine.tryEvent(.startChildFlow(roomID: roomID, entryPoint: .room))
            case .dismiss:
                break // Not supported when pushed.
            }
        }
        .store(in: &cancellables)
        
        // Replace the RoomMemberDetailsScreen without any animation.
        navigationStackCoordinator.pop(animated: false)
        navigationStackCoordinator.push(coordinator, animated: false) { [weak self] in
            self?.stateMachine.tryEvent(.dismissUserProfile)
        }
    }
    
    private func presentMessageForwarding(for itemID: TimelineItemIdentifier) {
        guard let roomSummaryProvider = userSession.clientProxy.alternateRoomSummaryProvider, let eventID = itemID.eventID else {
            fatalError()
        }
        
        let stackCoordinator = NavigationStackCoordinator()
        
        let parameters = MessageForwardingScreenCoordinatorParameters(roomSummaryProvider: roomSummaryProvider,
                                                                      mediaProvider: userSession.mediaProvider,
                                                                      sourceRoomID: roomProxy.id)
        let coordinator = MessageForwardingScreenCoordinator(parameters: parameters)
        
        coordinator.actions.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case .dismiss:
                navigationStackCoordinator.setSheetCoordinator(nil)
            case .send(let roomID):
                navigationStackCoordinator.setSheetCoordinator(nil)
                
                Task {
                    await self.forward(eventID: eventID, toRoomID: roomID)
                }
            }
        }
        .store(in: &cancellables)
        
        stackCoordinator.setRootCoordinator(coordinator)

        navigationStackCoordinator.setSheetCoordinator(stackCoordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissMessageForwarding)
        }
    }
    
    private func forward(eventID: String, toRoomID roomID: String) async {
        guard let messageEventContent = roomProxy.timeline.messageEventContent(for: eventID) else {
            MXLog.error("Failed retrieving forwarded message event content for eventID: \(eventID)")
            userIndicatorController.submitIndicator(UserIndicator(title: L10n.errorUnknown))
            return
        }
        
        guard let targetRoomProxy = await userSession.clientProxy.roomForIdentifier(roomID) else {
            MXLog.error("Failed retrieving room to forward to with id: \(roomID)")
            userIndicatorController.submitIndicator(UserIndicator(title: L10n.errorUnknown))
            return
        }
        
        if case .failure(let error) = await targetRoomProxy.timeline.sendMessageEventContent(messageEventContent) {
            MXLog.error("Failed forwarding message with error: \(error)")
            userIndicatorController.submitIndicator(UserIndicator(title: L10n.errorUnknown))
            return
        }
        
        // We don't need to worry about passing in the room proxy as timelines are
        // cached. The local echo will be visible when fetching the room by its ID.
        stateMachine.tryEvent(.startChildFlow(roomID: roomID, entryPoint: .room))
    }
    
    private func presentNotificationSettingsScreen() {
        let parameters = RoomNotificationSettingsScreenCoordinatorParameters(notificationSettingsProxy: userSession.clientProxy.notificationSettings,
                                                                             roomProxy: roomProxy,
                                                                             displayAsUserDefinedRoomSettings: false)
        
        let coordinator = RoomNotificationSettingsScreenCoordinator(parameters: parameters)
        coordinator.actions.sink { [weak self] actions in
            switch actions {
            case .presentGlobalNotificationSettingsScreen:
                self?.stateMachine.tryEvent(.presentGlobalNotificationSettingsScreen)
            }
        }
        .store(in: &cancellables)
        
        navigationStackCoordinator.push(coordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissNotificationSettingsScreen)
        }
    }
    
    private func presentGlobalNotificationSettingsScreen() {
        let stackCoordinator = NavigationStackCoordinator()
        let parameters = NotificationSettingsScreenCoordinatorParameters(navigationStackCoordinator: stackCoordinator,
                                                                         userSession: userSession,
                                                                         userNotificationCenter: UNUserNotificationCenter.current(),
                                                                         notificationSettings: userSession.clientProxy.notificationSettings,
                                                                         isModallyPresented: true)
        let coordinator = NotificationSettingsScreenCoordinator(parameters: parameters)
        coordinator.actions.sink { [weak self] action in
            switch action {
            case .close:
                self?.navigationStackCoordinator.setSheetCoordinator(nil)
            }
        }
        .store(in: &cancellables)
        
        stackCoordinator.setRootCoordinator(coordinator)
        navigationStackCoordinator.setSheetCoordinator(stackCoordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissGlobalNotificationSettingsScreen)
        }
    }
    
    private func presentInviteUsersScreen() {
        let selectedUsersSubject: CurrentValueSubject<[UserProfileProxy], Never> = .init([])
        
        let stackCoordinator = NavigationStackCoordinator()
        let inviteParameters = InviteUsersScreenCoordinatorParameters(clientProxy: userSession.clientProxy,
                                                                      selectedUsers: .init(selectedUsersSubject),
                                                                      roomType: .room(roomProxy: roomProxy),
                                                                      mediaProvider: userSession.mediaProvider,
                                                                      userDiscoveryService: UserDiscoveryService(clientProxy: userSession.clientProxy),
                                                                      userIndicatorController: userIndicatorController)
        
        let coordinator = InviteUsersScreenCoordinator(parameters: inviteParameters)
        stackCoordinator.setRootCoordinator(coordinator)
        
        coordinator.actions.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case .cancel:
                navigationStackCoordinator.setSheetCoordinator(nil)
            case .proceed:
                break
            case .invite(let users):
                self.inviteUsers(users, in: roomProxy)
            case .toggleUser(let user):
                var selectedUsers = selectedUsersSubject.value
                
                if let index = selectedUsers.firstIndex(where: { $0.userID == user.userID }) {
                    selectedUsers.remove(at: index)
                } else {
                    selectedUsers.append(user)
                }
                
                selectedUsersSubject.send(selectedUsers)
            }
        }
        .store(in: &cancellables)
        
        navigationStackCoordinator.setSheetCoordinator(stackCoordinator) { [weak self] in
            self?.stateMachine.tryEvent(.dismissInviteUsersScreen)
        }
    }
    
    private func inviteUsers(_ users: [String], in room: RoomProxyProtocol) {
        navigationStackCoordinator.setSheetCoordinator(nil)
        
        Task {
            let result: Result<Void, RoomProxyError> = await withTaskGroup(of: Result<Void, RoomProxyError>.self) { group in
                for user in users {
                    group.addTask {
                        await room.invite(userID: user)
                    }
                }
                
                return await group.first { inviteResult in
                    inviteResult.isFailure
                } ?? .success(())
            }
            
            guard case .failure = result else {
                return
            }
            
            userIndicatorController.alertInfo = .init(id: .init(),
                                                      title: L10n.commonUnableToInviteTitle,
                                                      message: L10n.commonUnableToInviteMessage)
        }
    }
    
    private func presentRolesAndPermissionsScreen() {
        let parameters = RoomRolesAndPermissionsFlowCoordinatorParameters(roomProxy: roomProxy,
                                                                          mediaProvider: userSession.mediaProvider,
                                                                          navigationStackCoordinator: navigationStackCoordinator,
                                                                          userIndicatorController: userIndicatorController,
                                                                          analytics: analytics)
        let coordinator = RoomRolesAndPermissionsFlowCoordinator(parameters: parameters)
        coordinator.actionsPublisher.sink { [weak self] action in
            switch action {
            case .complete:
                self?.stateMachine.tryEvent(.dismissRolesAndPermissionsScreen)
            }
        }
        .store(in: &cancellables)
        
        rolesAndPermissionsFlowCoordinator = coordinator
        coordinator.start()
    }
    
    // MARK: - Child Flow
    
    private func startChildFlow(for roomID: String, entryPoint: RoomFlowCoordinatorEntryPoint) async {
        let coordinator = await RoomFlowCoordinator(roomID: roomID,
                                                    userSession: userSession,
                                                    isChildFlow: true,
                                                    roomTimelineControllerFactory: roomTimelineControllerFactory,
                                                    navigationStackCoordinator: navigationStackCoordinator,
                                                    emojiProvider: emojiProvider,
                                                    appMediator: appMediator,
                                                    appSettings: appSettings,
                                                    analytics: analytics,
                                                    userIndicatorController: userIndicatorController)
        coordinator.actions.sink { [weak self] action in
            guard let self else { return }
            
            switch action {
            case .presentRoom(let roomID):
                actionsSubject.send(.presentRoom(roomID: roomID))
            case .presentCallScreen(let roomProxy):
                actionsSubject.send(.presentCallScreen(roomProxy: roomProxy))
            case .finished:
                stateMachine.tryEvent(.dismissChildFlow)
            }
        }
        .store(in: &cancellables)
        
        childRoomFlowCoordinator = coordinator
        switch entryPoint {
        case .room:
            coordinator.handleAppRoute(.room(roomID: roomID), animated: true)
        case .eventID(let eventID):
            coordinator.handleAppRoute(.event(roomID: roomID, eventID: eventID), animated: true)
        case .roomDetails:
            coordinator.handleAppRoute(.roomDetails(roomID: roomID), animated: true)
        }
    }
}

private extension RoomFlowCoordinator {
    struct HashableRoomMemberWrapper: Hashable {
        let value: RoomMemberProxyProtocol

        static func == (lhs: HashableRoomMemberWrapper, rhs: HashableRoomMemberWrapper) -> Bool {
            lhs.value.userID == rhs.value.userID
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(value.userID)
        }
    }

    indirect enum State: StateType {
        case initial
        case joinRoomScreen
        case room
        case roomDetails(isRoot: Bool)
        case roomDetailsEditScreen
        case notificationSettings
        case globalNotificationSettings
        case roomMembersList
        case roomMemberDetails(userID: String, fromRoomMembersList: Bool)
        case userProfile(userID: String)
        case inviteUsersScreen(fromRoomMembersList: Bool)
        case mediaUploadPicker(source: MediaPickerScreenSource)
        case mediaUploadPreview(fileURL: URL)
        case emojiPicker(itemID: TimelineItemIdentifier, selectedEmojis: Set<String>)
        case mapNavigator
        case messageForwarding(itemID: TimelineItemIdentifier)
        case reportContent(itemID: TimelineItemIdentifier, senderID: String)
        case pollForm
        case pollsHistory
        case pollsHistoryForm
        case rolesAndPermissions
        
        /// A child flow is in progress.
        case presentingChild(childRoomID: String, previousState: State)
        /// The flow is complete and is handing control of the stack back to its parent.
        case complete
    }
    
    struct EventUserInfo {
        let animated: Bool
    }

    enum Event: EventType {
        case presentJoinRoomScreen
        case dismissJoinRoomScreen
        
        case presentRoom(focussedEventID: String?)
        case dismissFlow
        
        case presentReportContent(itemID: TimelineItemIdentifier, senderID: String)
        case dismissReportContent
        
        case presentRoomDetails
        case dismissRoomDetails
        
        case presentRoomDetailsEditScreen
        case dismissRoomDetailsEditScreen
        
        case presentNotificationSettingsScreen
        case dismissNotificationSettingsScreen
        
        case presentGlobalNotificationSettingsScreen
        case dismissGlobalNotificationSettingsScreen
        
        case presentRoomMembersList
        case dismissRoomMembersList
        
        case presentRoomMemberDetails(userID: String)
        case dismissRoomMemberDetails
        
        case presentUserProfile(userID: String)
        case dismissUserProfile
        
        case presentInviteUsersScreen
        case dismissInviteUsersScreen
                
        case presentMediaUploadPicker(source: MediaPickerScreenSource)
        case dismissMediaUploadPicker
        
        case presentMediaUploadPreview(fileURL: URL)
        case dismissMediaUploadPreview
        
        case presentEmojiPicker(itemID: TimelineItemIdentifier, selectedEmojis: Set<String>)
        case dismissEmojiPicker

        case presentMapNavigator(interactionMode: StaticLocationInteractionMode)
        case dismissMapNavigator
        
        case presentMessageForwarding(itemID: TimelineItemIdentifier)
        case dismissMessageForwarding

        case presentPollForm(mode: PollFormMode)
        case dismissPollForm
        
        case presentPollsHistory
        case dismissPollsHistory
        
        case presentRolesAndPermissionsScreen
        case dismissRolesAndPermissionsScreen
        
        // Child room flow events
        case startChildFlow(roomID: String, entryPoint: RoomFlowCoordinatorEntryPoint)
        case dismissChildFlow
    }
}

private extension GeoURI {
    var bodyMessage: String {
        "Location was shared at \(string)"
    }
}

private extension Result {
    var isFailure: Bool {
        switch self {
        case .success:
            return false
        case .failure:
            return true
        }
    }
}
