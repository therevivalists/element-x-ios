//
// Copyright 2022 New Vector Ltd
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
import MatrixRustSDK
import SwiftUI
import UIKit

class UITestsAppCoordinator: AppCoordinatorProtocol, SecureWindowManagerDelegate {
    private let navigationRootCoordinator: NavigationRootCoordinator
    
    // periphery:ignore - retaining purpose
    private var mockScreen: MockScreen?
    
    // periphery:ignore - retaining purpose
    private var alternateWindowMockScreen: MockScreen?
    
    let windowManager: SecureWindowManagerProtocol
    
    init(appDelegate: AppDelegate) {
        windowManager = WindowManager(appDelegate: appDelegate)
        // disabling View animations
        UIView.setAnimationsEnabled(false)
        
        navigationRootCoordinator = NavigationRootCoordinator()
        
        windowManager.delegate = self
        
        ServiceLocator.shared.register(userIndicatorController: UserIndicatorController())
        
        AppSettings.configureWithSuiteName("io.element.elementx.uitests")
        AppSettings.resetAllSettings()
        ServiceLocator.shared.register(appSettings: AppSettings())
        ServiceLocator.shared.register(bugReportService: BugReportServiceMock())
        ServiceLocator.shared.register(analytics: AnalyticsService(client: AnalyticsClientMock(),
                                                                   appSettings: ServiceLocator.shared.settings,
                                                                   bugReportService: ServiceLocator.shared.bugReportService))
    }
    
    func start() {
        guard let screenID = ProcessInfo.testScreenID else { fatalError("Unable to launch with unknown screen.") }
        
        let mockScreen = MockScreen(id: screenID, windowManager: windowManager, navigationRootCoordinator: navigationRootCoordinator)
        
        if let coordinator = mockScreen.coordinator {
            navigationRootCoordinator.setRootCoordinator(coordinator)
        }
        
        self.mockScreen = mockScreen
    }
    
    func toPresentable() -> AnyView {
        navigationRootCoordinator.toPresentable()
    }
    
    func handleDeepLink(_ url: URL, isExternalURL: Bool) -> Bool {
        fatalError("Not implemented.")
    }
    
    func windowManagerDidConfigureWindows(_ windowManager: SecureWindowManagerProtocol) {
        ServiceLocator.shared.userIndicatorController.window = windowManager.overlayWindow
        
        // Set up the alternate window for the App Lock flow coordinator tests.
        guard let screenID = ProcessInfo.testScreenID, screenID == .appLockFlow || screenID == .appLockFlowDisabled else { return }
        let screen = MockScreen(id: screenID == .appLockFlow ? .appLockFlowAlternateWindow : .appLockFlowDisabledAlternateWindow,
                                windowManager: windowManager,
                                navigationRootCoordinator: navigationRootCoordinator)
        
        guard let coordinator = screen.coordinator else {
            fatalError()
        }
        
        windowManager.alternateWindow.rootViewController = UIHostingController(rootView: coordinator.toPresentable().statusBarHidden())
        
        alternateWindowMockScreen = screen
    }
}

@MainActor
class MockScreen: Identifiable {
    let id: UITestsScreenIdentifier
    let windowManager: SecureWindowManagerProtocol
    let navigationRootCoordinator: NavigationRootCoordinator
    
    private var client: UITestsSignalling.Client?
    
    private var retainedState = [Any]()
    private var cancellables = Set<AnyCancellable>()
    
    init(id: UITestsScreenIdentifier,
         windowManager: SecureWindowManagerProtocol,
         navigationRootCoordinator: NavigationRootCoordinator) {
        self.id = id
        self.windowManager = windowManager
        self.navigationRootCoordinator = navigationRootCoordinator
    }
    
    lazy var coordinator: CoordinatorProtocol? = {
        switch id {
        case .login:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let coordinator = LoginScreenCoordinator(parameters: .init(authenticationService: MockAuthenticationServiceProxy(),
                                                                       analytics: ServiceLocator.shared.analytics,
                                                                       userIndicatorController: ServiceLocator.shared.userIndicatorController))
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .serverSelection:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let coordinator = ServerSelectionScreenCoordinator(parameters: .init(authenticationService: MockAuthenticationServiceProxy(),
                                                                                 userIndicatorController: ServiceLocator.shared.userIndicatorController,
                                                                                 isModallyPresented: true))
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .authenticationFlow:
            let flowCoordinator = AuthenticationFlowCoordinator(authenticationService: MockAuthenticationServiceProxy(),
                                                                bugReportService: BugReportServiceMock(),
                                                                navigationRootCoordinator: navigationRootCoordinator,
                                                                appMediator: AppMediatorMock.default,
                                                                appSettings: ServiceLocator.shared.settings,
                                                                analytics: ServiceLocator.shared.analytics,
                                                                userIndicatorController: ServiceLocator.shared.userIndicatorController)
            flowCoordinator.start()
            retainedState.append(flowCoordinator)
            return nil
        case .templateScreen:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let coordinator = TemplateScreenCoordinator(parameters: .init())
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .appLockFlow, .appLockFlowDisabled:
            // The tested coordinator is setup below in the alternate window.
            // Here we just return a blank screen to snapshot as the unlocked app.
            return BlankFormCoordinator()
        case .appLockFlowAlternateWindow, .appLockFlowDisabledAlternateWindow:
            let navigationCoordinator = NavigationRootCoordinator()
            
            let keychainController = KeychainController(service: .tests, accessGroup: InfoPlistReader.main.keychainAccessGroupIdentifier)
            keychainController.resetSecrets()
            
            let context = LAContextMock()
            context.biometryTypeValue = UIDevice.current.isPhone ? .faceID : .touchID // (iPhone 14 & iPad 9th gen)
            context.evaluatePolicyReturnValue = true
            context.evaluatedPolicyDomainStateValue = "😎".data(using: .utf8)
            
            let appLockService = AppLockService(keychainController: keychainController,
                                                appSettings: ServiceLocator.shared.settings,
                                                context: context)
            
            if id == .appLockFlowAlternateWindow {
                let pinCode = "2023"
                guard case .success = appLockService.setupPINCode(pinCode),
                      appLockService.unlock(with: pinCode) else {
                    fatalError("Failed to preset the PIN code.")
                }
            }
            
            let notificationCenter = UITestsNotificationCenter()
            do {
                try notificationCenter.startListening()
            } catch {
                fatalError("Failed to start listening for notifications.")
            }
            
            let flowCoordinator = AppLockFlowCoordinator(initialState: .unlocked,
                                                         appLockService: appLockService,
                                                         navigationCoordinator: navigationCoordinator,
                                                         notificationCenter: notificationCenter)
            
            flowCoordinator.actions
                .sink { [weak self] action in
                    guard let self else { return }
                    
                    switch action {
                    case .lockApp:
                        windowManager.switchToAlternate()
                    case .unlockApp:
                        windowManager.switchToMain()
                    case .forceLogout:
                        break
                    }
                }
                .store(in: &cancellables)
            
            retainedState.append(flowCoordinator)
            
            return navigationCoordinator
        case .appLockSetupFlow, .appLockSetupFlowUnlock, .appLockSetupFlowMandatory:
            let navigationStackCoordinator = NavigationStackCoordinator()
            // The flow expects an existing root coordinator, use a blank form as a placeholder.
            navigationStackCoordinator.setRootCoordinator(BlankFormCoordinator())
            
            let keychainController = KeychainController(service: .tests, accessGroup: InfoPlistReader.main.keychainAccessGroupIdentifier)
            keychainController.resetSecrets()
            
            let context = LAContextMock()
            context.biometryTypeValue = UIDevice.current.isPhone ? .faceID : .touchID // (iPhone 14 & iPad 9th gen)
            context.evaluatePolicyReturnValue = true
            context.evaluatedPolicyDomainStateValue = "😎".data(using: .utf8)
            
            let appLockService = AppLockService(keychainController: keychainController,
                                                appSettings: ServiceLocator.shared.settings,
                                                context: context)
            if id == .appLockSetupFlowUnlock, case .failure = appLockService.setupPINCode("2023") {
                fatalError("Failed to pre-set the PIN code")
            }
            
            let flow: AppLockSetupFlowCoordinator.PresentationFlow = id == .appLockSetupFlowMandatory ? .onboarding : .settings
            let flowCoordinator = AppLockSetupFlowCoordinator(presentingFlow: flow,
                                                              appLockService: appLockService,
                                                              navigationStackCoordinator: navigationStackCoordinator)
            flowCoordinator.start()
            
            retainedState.append(flowCoordinator)
            
            return navigationStackCoordinator
        case .bugReport:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let coordinator = BugReportScreenCoordinator(parameters: .init(bugReportService: BugReportServiceMock(),
                                                                           userID: "@mock:client.com",
                                                                           deviceID: nil,
                                                                           userIndicatorController: nil,
                                                                           screenshot: nil,
                                                                           isModallyPresented: true))
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomPlainNoAvatar:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "Some room name", avatarURL: nil)),
                                                             timelineController: MockRoomTimelineController(),
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomSmallTimeline:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let timelineController = MockRoomTimelineController()
            timelineController.timelineItems = RoomTimelineItemFixtures.smallChunk
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "New room", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomSmallTimelineWithReactions:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let timelineController = MockRoomTimelineController()
            timelineController.timelineItems = RoomTimelineItemFixtures.default
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "New room", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomSmallTimelineWithReadReceipts:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let timelineController = MockRoomTimelineController()
            timelineController.timelineItems = RoomTimelineItemFixtures.smallChunkWithReadReceipts
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "New room", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomSmallTimelineIncomingAndSmallPagination:
            let navigationStackCoordinator = NavigationStackCoordinator()
            
            let timelineController = MockRoomTimelineController(listenForSignals: true)
            timelineController.timelineItems = RoomTimelineItemFixtures.smallChunk
            timelineController.backPaginationResponses = [RoomTimelineItemFixtures.singleMessageChunk]
            timelineController.incomingItems = [RoomTimelineItemFixtures.incomingMessage]
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "Small timeline", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)
            
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomSmallTimelineLargePagination:
            let navigationStackCoordinator = NavigationStackCoordinator()
            
            let timelineController = MockRoomTimelineController(listenForSignals: true)
            timelineController.timelineItems = RoomTimelineItemFixtures.smallChunk
            timelineController.backPaginationResponses = [RoomTimelineItemFixtures.largeChunk]
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "Small timeline, paginating", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)
            
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomLayoutTop:
            let navigationStackCoordinator = NavigationStackCoordinator()
            
            let timelineController = MockRoomTimelineController(listenForSignals: true)
            timelineController.timelineItems = RoomTimelineItemFixtures.largeChunk
            timelineController.backPaginationResponses = [RoomTimelineItemFixtures.largeChunk]
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "Large timeline", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)

            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomLayoutMiddle:
            let navigationStackCoordinator = NavigationStackCoordinator()
            
            let timelineController = MockRoomTimelineController(listenForSignals: true)
            timelineController.timelineItems = RoomTimelineItemFixtures.largeChunk
            timelineController.backPaginationResponses = [RoomTimelineItemFixtures.largeChunk]
            timelineController.incomingItems = [RoomTimelineItemFixtures.incomingMessage]
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "Large timeline", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)
            
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomLayoutBottom:
            let navigationStackCoordinator = NavigationStackCoordinator()
            
            let timelineController = MockRoomTimelineController(listenForSignals: true)
            timelineController.timelineItems = RoomTimelineItemFixtures.largeChunk
            timelineController.incomingItems = [RoomTimelineItemFixtures.incomingMessage]
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "Large timeline", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)
            
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomLayoutHighlight:
            let navigationStackCoordinator = NavigationStackCoordinator()
            
            let timelineController = MockRoomTimelineController()
            timelineController.timelineItems = RoomTimelineItemFixtures.permalinkChunk
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "Timeline highlight", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)
            navigationStackCoordinator.setRootCoordinator(coordinator)
            
            do {
                let client = try UITestsSignalling.Client(mode: .app)
                client.signals.sink { [weak self] signal in
                    guard case .timeline(.focusOnEvent(let eventID)) = signal else { return }
                    coordinator.focusOnEvent(eventID: eventID)
                    try? client.send(.success)
                }
                .store(in: &cancellables)
            } catch {
                fatalError("Failure setting up signalling: \(error)")
            }
            
            self.client = client
            return navigationStackCoordinator
        case .roomWithDisclosedPolls:
            let navigationStackCoordinator = NavigationStackCoordinator()

            let timelineController = MockRoomTimelineController()
            timelineController.timelineItems = RoomTimelineItemFixtures.disclosedPolls
            timelineController.incomingItems = []
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "Polls timeline", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)

            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomWithUndisclosedPolls:
            let navigationStackCoordinator = NavigationStackCoordinator()

            let timelineController = MockRoomTimelineController()
            timelineController.timelineItems = RoomTimelineItemFixtures.undisclosedPolls
            timelineController.incomingItems = []
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "Polls timeline", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)

            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomWithOutgoingPolls:
            let navigationStackCoordinator = NavigationStackCoordinator()

            let timelineController = MockRoomTimelineController()
            timelineController.timelineItems = RoomTimelineItemFixtures.outgoingPolls
            timelineController.incomingItems = []
            let parameters = RoomScreenCoordinatorParameters(roomProxy: RoomProxyMock(with: .init(name: "Polls timeline", avatarURL: URL.picturesDirectory)),
                                                             timelineController: timelineController,
                                                             mediaProvider: MockMediaProvider(),
                                                             mediaPlayerProvider: MediaPlayerProviderMock(),
                                                             voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                                             emojiProvider: EmojiProvider(),
                                                             completionSuggestionService: CompletionSuggestionServiceMock(configuration: .init()),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: ServiceLocator.shared.settings)
            let coordinator = RoomScreenCoordinator(parameters: parameters)

            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .sessionVerification:
            var sessionVerificationControllerProxy = SessionVerificationControllerProxyMock.configureMock(requestDelay: .seconds(5))
            let parameters = SessionVerificationScreenCoordinatorParameters(sessionVerificationControllerProxy: sessionVerificationControllerProxy)
            return SessionVerificationScreenCoordinator(parameters: parameters)
        case .userSessionScreen, .userSessionScreenReply, .userSessionScreenRTE:
            let appSettings: AppSettings = ServiceLocator.shared.settings
            appSettings.richTextEditorEnabled = id == .userSessionScreenRTE
            appSettings.hasRunIdentityConfirmationOnboarding = true
            appSettings.hasRunNotificationPermissionsOnboarding = true
            appSettings.analyticsConsentState = .optedOut
            let navigationSplitCoordinator = NavigationSplitCoordinator(placeholderCoordinator: PlaceholderScreenCoordinator())
            
            let clientProxy = ClientProxyMock(.init(userID: "@mock:client.com", roomSummaryProvider: RoomSummaryProviderMock(.init(state: .loaded(.mockRooms)))))
            ServiceLocator.shared.settings.migratedAccounts[clientProxy.userID] = true
            
            let flowCoordinator = UserSessionFlowCoordinator(userSession: MockUserSession(clientProxy: clientProxy, mediaProvider: MockMediaProvider(), voiceMessageMediaManager: VoiceMessageMediaManagerMock()),
                                                             navigationRootCoordinator: navigationRootCoordinator,
                                                             appLockService: AppLockService(keychainController: KeychainControllerMock(),
                                                                                            appSettings: ServiceLocator.shared.settings),
                                                             bugReportService: BugReportServiceMock(),
                                                             roomTimelineControllerFactory: MockRoomTimelineControllerFactory(),
                                                             appMediator: AppMediatorMock.default,
                                                             appSettings: appSettings,
                                                             analytics: ServiceLocator.shared.analytics,
                                                             notificationManager: NotificationManagerMock(),
                                                             isNewLogin: false)
            
            flowCoordinator.start()
            
            retainedState.append(flowCoordinator)
            
            return nil
        case .roomMembersListScreenPendingInvites:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let members: [RoomMemberProxyMock] = [.mockInvitedAlice, .mockBob, .mockCharlie]
            let coordinator = RoomMembersListScreenCoordinator(parameters: .init(mediaProvider: MockMediaProvider(),
                                                                                 roomProxy: RoomProxyMock(with: .init(name: "test", members: members)),
                                                                                 userIndicatorController: ServiceLocator.shared.userIndicatorController,
                                                                                 analytics: ServiceLocator.shared.analytics))
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .roomRolesAndPermissionsFlow:
            let navigationStackCoordinator = NavigationStackCoordinator()
            navigationStackCoordinator.setRootCoordinator(BlankFormCoordinator())
            let coordinator = RoomRolesAndPermissionsFlowCoordinator(parameters: .init(roomProxy: RoomProxyMock(with: .init(members: .allMembersAsAdmin)),
                                                                                       mediaProvider: MockMediaProvider(),
                                                                                       navigationStackCoordinator: navigationStackCoordinator,
                                                                                       userIndicatorController: ServiceLocator.shared.userIndicatorController,
                                                                                       analytics: ServiceLocator.shared.analytics))
            retainedState.append(coordinator)
            coordinator.start()
            return navigationStackCoordinator
        case .startChat:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let userDiscoveryMock = UserDiscoveryServiceMock()
            userDiscoveryMock.searchProfilesWithReturnValue = .success([])
            let userSession = MockUserSession(clientProxy: ClientProxyMock(.init(userID: "@mock:client.com")),
                                              mediaProvider: MockMediaProvider(),
                                              voiceMessageMediaManager: VoiceMessageMediaManagerMock())
            let parameters: StartChatScreenCoordinatorParameters = .init(orientationManager: OrientationManagerMock(),
                                                                         userSession: userSession,
                                                                         userIndicatorController: UserIndicatorControllerMock(),
                                                                         navigationStackCoordinator: navigationStackCoordinator,
                                                                         userDiscoveryService: userDiscoveryMock)
            let coordinator = StartChatScreenCoordinator(parameters: parameters)
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .startChatWithSearchResults:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let clientProxy = ClientProxyMock(.init(userID: "@mock:client.com"))
            let userDiscoveryMock = UserDiscoveryServiceMock()
            userDiscoveryMock.searchProfilesWithReturnValue = .success([.mockBob, .mockBobby])
            let userSession = MockUserSession(clientProxy: clientProxy, mediaProvider: MockMediaProvider(), voiceMessageMediaManager: VoiceMessageMediaManagerMock())
            let coordinator = StartChatScreenCoordinator(parameters: .init(orientationManager: OrientationManagerMock(),
                                                                           userSession: userSession,
                                                                           userIndicatorController: UserIndicatorControllerMock(),
                                                                           navigationStackCoordinator: navigationStackCoordinator,
                                                                           userDiscoveryService: userDiscoveryMock))
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .invites:
            ServiceLocator.shared.settings.seenInvites = Set([RoomSummary].mockInvites.compactMap(\.id))
            let navigationStackCoordinator = NavigationStackCoordinator()
            let clientProxy = ClientProxyMock(.init(userID: "@mock:client.com"))

            clientProxy.roomForIdentifierClosure = { identifier in
                switch identifier {
                case "someAwesomeRoomId1":
                    return RoomProxyMock(with: .init(name: "First room"))
                case "someAwesomeRoomId2":
                    return RoomProxyMock(with: .init(name: "Second room"))
                default:
                    return nil
                }
            }
            
            let summaryProvider = RoomSummaryProviderMock(.init(state: .loaded(.mockInvites)))
            clientProxy.inviteSummaryProvider = summaryProvider
            
            let coordinator = InvitesScreenCoordinator(parameters: .init(userSession: MockUserSession(clientProxy: clientProxy, mediaProvider: MockMediaProvider(), voiceMessageMediaManager: VoiceMessageMediaManagerMock())))
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .createRoom:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let clientProxy = ClientProxyMock(.init(userID: "@mock:client.com"))
            let mockUserSession = MockUserSession(clientProxy: clientProxy, mediaProvider: MockMediaProvider(), voiceMessageMediaManager: VoiceMessageMediaManagerMock())
            let createRoomParameters = CreateRoomFlowParameters()
            let selectedUsers: [UserProfileProxy] = [.mockAlice, .mockBob, .mockCharlie]
            let parameters = CreateRoomCoordinatorParameters(userSession: mockUserSession,
                                                             userIndicatorController: UserIndicatorControllerMock(),
                                                             createRoomParameters: .init(createRoomParameters),
                                                             selectedUsers: .init(selectedUsers))
            let coordinator = CreateRoomCoordinator(parameters: parameters)
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .createRoomNoUsers:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let clientProxy = ClientProxyMock(.init(userID: "@mock:client.com"))
            let mockUserSession = MockUserSession(clientProxy: clientProxy,
                                                  mediaProvider: MockMediaProvider(),
                                                  voiceMessageMediaManager: VoiceMessageMediaManagerMock())
            let createRoomParameters = CreateRoomFlowParameters()
            let parameters = CreateRoomCoordinatorParameters(userSession: mockUserSession,
                                                             userIndicatorController: UserIndicatorControllerMock(),
                                                             createRoomParameters: .init(createRoomParameters),
                                                             selectedUsers: .init([]))
            let coordinator = CreateRoomCoordinator(parameters: parameters)
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        case .createPoll:
            let navigationStackCoordinator = NavigationStackCoordinator()
            let coordinator = PollFormScreenCoordinator(parameters: .init(mode: .new))
            navigationStackCoordinator.setRootCoordinator(coordinator)
            return navigationStackCoordinator
        }
    }()
}
