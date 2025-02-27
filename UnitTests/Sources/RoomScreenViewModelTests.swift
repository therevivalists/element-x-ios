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

@testable import ElementX

import Combine
import XCTest

@MainActor
class RoomScreenViewModelTests: XCTestCase {
    var userIndicatorControllerMock: UserIndicatorControllerMock!
    var cancellables = Set<AnyCancellable>()

    override func setUp() async throws {
        AppSettings.resetAllSettings()
        cancellables.removeAll()
        userIndicatorControllerMock = UserIndicatorControllerMock.default
    }

    override func tearDown() async throws {
        userIndicatorControllerMock = nil
    }
    
    // MARK: - Message Grouping

    func testMessageGrouping() {
        // Given 3 messages from Bob.
        let items = [
            TextRoomTimelineItem(text: "Message 1",
                                 sender: "bob"),
            TextRoomTimelineItem(text: "Message 2",
                                 sender: "bob"),
            TextRoomTimelineItem(text: "Message 3",
                                 sender: "bob")
        ]
        
        // When showing them in a timeline.
        let timelineController = MockRoomTimelineController()
        timelineController.timelineItems = items
        let viewModel = makeViewModel(timelineController: timelineController)
        
        // Then the messages should be grouped together.
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[0].groupStyle, .first, "Nothing should prevent the first message from being grouped.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[1].groupStyle, .middle, "Nothing should prevent the middle message from being grouped.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[2].groupStyle, .last, "Nothing should prevent the last message from being grouped.")
    }
    
    func testMessageGroupingMultipleSenders() {
        // Given some interleaved messages from Bob and Alice.
        let items = [
            TextRoomTimelineItem(text: "Message 1",
                                 sender: "alice"),
            TextRoomTimelineItem(text: "Message 2",
                                 sender: "bob"),
            TextRoomTimelineItem(text: "Message 3",
                                 sender: "alice"),
            TextRoomTimelineItem(text: "Message 4",
                                 sender: "alice"),
            TextRoomTimelineItem(text: "Message 5",
                                 sender: "bob"),
            TextRoomTimelineItem(text: "Message 6",
                                 sender: "bob")
        ]
        
        // When showing them in a timeline.
        let timelineController = MockRoomTimelineController()
        timelineController.timelineItems = items
        let viewModel = makeViewModel(timelineController: timelineController)
        
        // Then the messages should be grouped by sender.
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[0].groupStyle, .single, "A message should not be grouped when the sender changes.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[1].groupStyle, .single, "A message should not be grouped when the sender changes.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[2].groupStyle, .first, "A group should start with a new sender if there are more messages from that sender.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[3].groupStyle, .last, "A group should be ended when the sender changes in the next message.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[4].groupStyle, .first, "A group should start with a new sender if there are more messages from that sender.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[5].groupStyle, .last, "A group should be ended when the sender changes in the next message.")
    }
    
    func testMessageGroupingWithLeadingReactions() {
        // Given 3 messages from Bob where the first message has a reaction.
        let items = [
            TextRoomTimelineItem(text: "Message 1",
                                 sender: "bob",
                                 addReactions: true),
            TextRoomTimelineItem(text: "Message 2",
                                 sender: "bob"),
            TextRoomTimelineItem(text: "Message 3",
                                 sender: "bob")
        ]
        
        // When showing them in a timeline.
        let timelineController = MockRoomTimelineController()
        timelineController.timelineItems = items
        let viewModel = makeViewModel(timelineController: timelineController)
        
        // Then the first message should not be grouped but the other two should.
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[0].groupStyle, .single, "When the first message has reactions it should not be grouped.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[1].groupStyle, .first, "A new group should be made when the preceding message has reactions.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[2].groupStyle, .last, "Nothing should prevent the last message from being grouped.")
    }
    
    func testMessageGroupingWithInnerReactions() {
        // Given 3 messages from Bob where the middle message has a reaction.
        let items = [
            TextRoomTimelineItem(text: "Message 1",
                                 sender: "bob"),
            TextRoomTimelineItem(text: "Message 2",
                                 sender: "bob",
                                 addReactions: true),
            TextRoomTimelineItem(text: "Message 3",
                                 sender: "bob")
        ]
        
        // When showing them in a timeline.
        let timelineController = MockRoomTimelineController()
        timelineController.timelineItems = items
        let viewModel = makeViewModel(timelineController: timelineController)
        
        // Then the first and second messages should be grouped and the last one should not.
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[0].groupStyle, .first, "Nothing should prevent the first message from being grouped.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[1].groupStyle, .last, "When the message has reactions, the group should end here.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[2].groupStyle, .single, "The last message should not be grouped when the preceding message has reactions.")
    }
    
    func testMessageGroupingWithTrailingReactions() {
        // Given 3 messages from Bob where the last message has a reaction.
        let items = [
            TextRoomTimelineItem(text: "Message 1",
                                 sender: "bob"),
            TextRoomTimelineItem(text: "Message 2",
                                 sender: "bob"),
            TextRoomTimelineItem(text: "Message 3",
                                 sender: "bob",
                                 addReactions: true)
        ]
        
        // When showing them in a timeline.
        let timelineController = MockRoomTimelineController()
        timelineController.timelineItems = items
        let viewModel = makeViewModel(timelineController: timelineController)
        
        // Then the messages should be grouped together.
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[0].groupStyle, .first, "Nothing should prevent the first message from being grouped.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[1].groupStyle, .middle, "Nothing should prevent the second message from being grouped.")
        XCTAssertEqual(viewModel.state.timelineViewState.itemViewStates[2].groupStyle, .last, "Reactions on the last message should not prevent it from being grouped.")
    }
    
    // MARK: - Focussing
    
    func testFocusItem() async throws {
        // Given a room with 3 items loaded in a live timeline.
        let items = [TextRoomTimelineItem(eventID: "t1"),
                     TextRoomTimelineItem(eventID: "t2"),
                     TextRoomTimelineItem(eventID: "t3")]
        let timelineController = MockRoomTimelineController()
        timelineController.timelineItems = items
        
        let viewModel = makeViewModel(timelineController: timelineController)
        XCTAssertEqual(timelineController.focusOnEventCallCount, 0)
        XCTAssertTrue(viewModel.context.viewState.timelineViewState.isLive)
        XCTAssertNil(viewModel.context.viewState.timelineViewState.focussedEventID)
        
        // When focussing on an item that isn't loaded.
        let deferred = deferFulfillment(viewModel.context.$viewState) { !$0.timelineViewState.isLive }
        await viewModel.focusOnEvent(eventID: "t4")
        try await deferred.fulfill()
        
        // Then a new timeline should be loaded and the room focussed on that event.
        XCTAssertEqual(timelineController.focusOnEventCallCount, 1)
        XCTAssertFalse(viewModel.context.viewState.timelineViewState.isLive)
        XCTAssertEqual(viewModel.context.viewState.timelineViewState.focussedEventID, "t4")
    }
    
    func testFocusLoadedItem() async throws {
        // Given a room with 3 items loaded in a live timeline.
        let items = [TextRoomTimelineItem(eventID: "t1"),
                     TextRoomTimelineItem(eventID: "t2"),
                     TextRoomTimelineItem(eventID: "t3")]
        let timelineController = MockRoomTimelineController()
        timelineController.timelineItems = items
        
        let viewModel = makeViewModel(timelineController: timelineController)
        XCTAssertEqual(timelineController.focusOnEventCallCount, 0)
        XCTAssertTrue(viewModel.context.viewState.timelineViewState.isLive)
        XCTAssertNil(viewModel.context.viewState.timelineViewState.focussedEventID)
        
        // When focussing on a loaded item.
        let deferred = deferFailure(viewModel.context.$viewState, timeout: 1) { !$0.timelineViewState.isLive }
        await viewModel.focusOnEvent(eventID: "t1")
        try await deferred.fulfill()
        
        // Then the timeline should remain live and the item should be focussed.
        XCTAssertEqual(timelineController.focusOnEventCallCount, 0)
        XCTAssertTrue(viewModel.context.viewState.timelineViewState.isLive)
        XCTAssertEqual(viewModel.context.viewState.timelineViewState.focussedEventID, "t1")
    }
    
    func testFocusLive() async throws {
        // Given a room with a non-live timeline focussed on a particular event.
        let items = [TextRoomTimelineItem(eventID: "t1"),
                     TextRoomTimelineItem(eventID: "t2"),
                     TextRoomTimelineItem(eventID: "t3")]
        let timelineController = MockRoomTimelineController()
        timelineController.timelineItems = items
        
        let viewModel = makeViewModel(timelineController: timelineController)
        
        var deferred = deferFulfillment(viewModel.context.$viewState) { !$0.timelineViewState.isLive }
        await viewModel.focusOnEvent(eventID: "t4")
        try await deferred.fulfill()
        
        XCTAssertEqual(timelineController.focusLiveCallCount, 0)
        XCTAssertFalse(viewModel.context.viewState.timelineViewState.isLive)
        XCTAssertEqual(viewModel.context.viewState.timelineViewState.focussedEventID, "t4")
        
        // When switching back to a live timeline.
        deferred = deferFulfillment(viewModel.context.$viewState) { $0.timelineViewState.isLive }
        viewModel.context.send(viewAction: .focusLive)
        try await deferred.fulfill()
        
        // Then the timeline should switch back to being live and the event focus should be removed.
        XCTAssertEqual(timelineController.focusLiveCallCount, 1)
        XCTAssertTrue(viewModel.context.viewState.timelineViewState.isLive)
        XCTAssertNil(viewModel.context.viewState.timelineViewState.focussedEventID)
    }
    
    // MARK: - Sending

    func testRetrySend() async throws {
        let timelineController = MockRoomTimelineController()
        let roomProxy = RoomProxyMock(with: .init(name: ""))
        
        let timelineProxy = TimelineProxyMock()
        timelineProxy.underlyingActions = Empty(completeImmediately: false).eraseToAnyPublisher()
        
        roomProxy.underlyingTimeline = timelineProxy
        timelineController.roomProxy = roomProxy

        let viewModel = makeViewModel(roomProxy: roomProxy, timelineController: timelineController)

        viewModel.context.send(viewAction: .retrySend(itemID: .init(timelineID: UUID().uuidString, transactionID: "test retry send id")))
        
        try? await Task.sleep(for: .milliseconds(100))
        
        XCTAssert(timelineProxy.retrySendTransactionIDCallsCount == 1)
        XCTAssert(timelineProxy.retrySendTransactionIDReceivedInvocations == ["test retry send id"])
    }

    func testRetrySendNoTransactionID() async {
        let timelineController = MockRoomTimelineController()
        let roomProxy = RoomProxyMock(with: .init(name: ""))
        
        let timelineProxy = TimelineProxyMock()
        timelineProxy.underlyingActions = Empty(completeImmediately: false).eraseToAnyPublisher()
        
        roomProxy.underlyingTimeline = timelineProxy

        let viewModel = makeViewModel(roomProxy: roomProxy, timelineController: timelineController)

        viewModel.context.send(viewAction: .retrySend(itemID: .random))
        
        try? await Task.sleep(for: .milliseconds(100))
        
        XCTAssert(timelineProxy.retrySendTransactionIDCallsCount == 0)
    }

    func testCancelSend() async {
        let timelineController = MockRoomTimelineController()
        let roomProxy = RoomProxyMock(with: .init(name: ""))
        
        let timelineProxy = TimelineProxyMock()
        timelineProxy.underlyingActions = Empty(completeImmediately: false).eraseToAnyPublisher()
        
        roomProxy.underlyingTimeline = timelineProxy
        timelineController.roomProxy = roomProxy

        let viewModel = makeViewModel(roomProxy: roomProxy, timelineController: timelineController)

        viewModel.context.send(viewAction: .cancelSend(itemID: .init(timelineID: UUID().uuidString, transactionID: "test cancel send id")))
        
        try? await Task.sleep(for: .milliseconds(100))
        
        XCTAssert(timelineProxy.cancelSendTransactionIDCallsCount == 1)
        XCTAssert(timelineProxy.cancelSendTransactionIDReceivedInvocations == ["test cancel send id"])
    }

    func testCancelSendNoTransactionID() async {
        let timelineController = MockRoomTimelineController()
        let roomProxy = RoomProxyMock(with: .init(name: ""))
        
        let timelineProxy = TimelineProxyMock()
        timelineProxy.underlyingActions = Empty(completeImmediately: false).eraseToAnyPublisher()
        
        roomProxy.underlyingTimeline = timelineProxy

        let viewModel = makeViewModel(roomProxy: roomProxy, timelineController: timelineController)

        viewModel.context.send(viewAction: .cancelSend(itemID: .random))

        try? await Task.sleep(for: .milliseconds(100))
        
        XCTAssert(timelineProxy.cancelSendTransactionIDCallsCount == 0)
    }
    
    // MARK: - Read Receipts
    
    // swiftlint:disable force_unwrapping
    func testSendReadReceipt() async throws {
        // Given a room with only text items in the timeline
        let items = [TextRoomTimelineItem(eventID: "t1"),
                     TextRoomTimelineItem(eventID: "t2"),
                     TextRoomTimelineItem(eventID: "t3")]
        let (viewModel, _, timelineProxy, _, _) = readReceiptsConfiguration(with: items)
        
        // When sending a read receipt for the last item.
        viewModel.context.send(viewAction: .sendReadReceiptIfNeeded(items.last!.id))
        try await Task.sleep(for: .milliseconds(100))
        
        // Then the receipt should be sent.
        XCTAssertEqual(timelineProxy.sendReadReceiptForTypeCalled, true)
        let arguments = timelineProxy.sendReadReceiptForTypeReceivedArguments
        XCTAssertEqual(arguments?.eventID, "t3")
        XCTAssertEqual(arguments?.type, .read)
    }
    
    func testSendMoreReadReceipts() async throws {
        // Given a room with only text items in the timeline that are all read.
        let items = [TextRoomTimelineItem(eventID: "t1"),
                     TextRoomTimelineItem(eventID: "t2"),
                     TextRoomTimelineItem(eventID: "t3")]
        let (viewModel, _, timelineProxy, timelineController, _) = readReceiptsConfiguration(with: items)
        viewModel.context.send(viewAction: .sendReadReceiptIfNeeded(items.last!.id))
        try await Task.sleep(for: .milliseconds(100))
        XCTAssertEqual(timelineProxy.sendReadReceiptForTypeCallsCount, 1)
        var arguments = timelineProxy.sendReadReceiptForTypeReceivedArguments
        XCTAssertEqual(arguments?.eventID, "t3")
        XCTAssertEqual(arguments?.type, .read)
        
        // When sending a receipt for the first item in the timeline.
        viewModel.context.send(viewAction: .sendReadReceiptIfNeeded(items.first!.id))
        try await Task.sleep(for: .milliseconds(100))
        
        // When a new message is received and marked as read.
        let newMessage = TextRoomTimelineItem(eventID: "t4")
        timelineController.timelineItems.append(newMessage)
        timelineController.callbacks.send(.updatedTimelineItems)
        try await Task.sleep(for: .milliseconds(100))
        
        viewModel.context.send(viewAction: .sendReadReceiptIfNeeded(newMessage.id))
        try await Task.sleep(for: .milliseconds(100))
        
        // Then the request should be made.
        XCTAssertEqual(timelineProxy.sendReadReceiptForTypeCallsCount, 3)
        arguments = timelineProxy.sendReadReceiptForTypeReceivedArguments
        XCTAssertEqual(arguments?.eventID, "t4")
        XCTAssertEqual(arguments?.type, .read)
    }
    
    func testSendReadReceiptWithoutEvents() async throws {
        // Given a room with only virtual items.
        let items = [SeparatorRoomTimelineItem(timelineID: "v1"),
                     SeparatorRoomTimelineItem(timelineID: "v2"),
                     SeparatorRoomTimelineItem(timelineID: "v3")]
        let (viewModel, _, timelineProxy, _, _) = readReceiptsConfiguration(with: items)
        
        // When sending a read receipt for the last item.
        viewModel.context.send(viewAction: .sendReadReceiptIfNeeded(items.last!.id))
        try await Task.sleep(for: .milliseconds(100))
        
        // Then nothing should be sent.
        XCTAssertEqual(timelineProxy.sendReadReceiptForTypeCalled, false)
    }
    
    func testSendReadReceiptVirtualLast() async throws {
        // Given a room where the last event is a virtual item.
        let items: [RoomTimelineItemProtocol] = [TextRoomTimelineItem(eventID: "t1"),
                                                 TextRoomTimelineItem(eventID: "t2"),
                                                 SeparatorRoomTimelineItem(timelineID: "v3")]
        let (viewModel, _, _, _, _) = readReceiptsConfiguration(with: items)
        
        // When sending a read receipt for the last item.
        viewModel.context.send(viewAction: .sendReadReceiptIfNeeded(items.last!.id))
        try await Task.sleep(for: .milliseconds(100))
    }
    
    // swiftlint:enable force_unwrapping
    // swiftlint:disable:next large_tuple
    private func readReceiptsConfiguration(with items: [RoomTimelineItemProtocol]) -> (RoomScreenViewModel,
                                                                                       RoomProxyMock,
                                                                                       TimelineProxyMock,
                                                                                       MockRoomTimelineController,
                                                                                       NotificationCenterMock) {
        let notificationCenter = NotificationCenterMock()
        let roomProxy = RoomProxyMock(with: .init(name: ""))
        
        let timelineProxy = TimelineProxyMock()
        timelineProxy.underlyingActions = Empty(completeImmediately: false).eraseToAnyPublisher()
        
        roomProxy.timeline = timelineProxy
        let timelineController = MockRoomTimelineController()
        
        timelineProxy.sendReadReceiptForTypeReturnValue = .success(())
        
        timelineController.timelineItems = items
        timelineController.roomProxy = roomProxy

        let viewModel = RoomScreenViewModel(roomProxy: roomProxy,
                                            timelineController: timelineController,
                                            mediaProvider: MockMediaProvider(),
                                            mediaPlayerProvider: MediaPlayerProviderMock(),
                                            voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                            userIndicatorController: userIndicatorControllerMock,
                                            appMediator: AppMediatorMock.default,
                                            appSettings: ServiceLocator.shared.settings,
                                            analyticsService: ServiceLocator.shared.analytics,
                                            notificationCenter: notificationCenter)
        return (viewModel, roomProxy, timelineProxy, timelineController, notificationCenter)
    }
    
    func testShowReadReceipts() async throws {
        let receipts: [ReadReceipt] = [.init(userID: "@alice:matrix.org", formattedTimestamp: "12:00"),
                                       .init(userID: "@charlie:matrix.org", formattedTimestamp: "11:00")]
        // Given 3 messages from Bob where the middle message has a reaction.
        let message = TextRoomTimelineItem(text: "Test",
                                           sender: "bob",
                                           addReadReceipts: receipts)
        let id = message.id
        
        // When showing them in a timeline.
        let timelineController = MockRoomTimelineController()
        timelineController.timelineItems = [message]
        let viewModel = RoomScreenViewModel(roomProxy: RoomProxyMock(with: .init(name: "",
                                                                                 members: [RoomMemberProxyMock.mockAlice, RoomMemberProxyMock.mockCharlie])),
                                            timelineController: timelineController,
                                            mediaProvider: MockMediaProvider(),
                                            mediaPlayerProvider: MediaPlayerProviderMock(),
                                            voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                                            userIndicatorController: userIndicatorControllerMock,
                                            appMediator: AppMediatorMock.default,
                                            appSettings: ServiceLocator.shared.settings,
                                            analyticsService: ServiceLocator.shared.analytics,
                                            notificationCenter: NotificationCenterMock())
        
        let deferred = deferFulfillment(viewModel.context.$viewState) { value in
            value.bindings.readReceiptsSummaryInfo?.orderedReceipts == receipts
        }
        
        viewModel.context.send(viewAction: .showReadReceipts(itemID: id))
        try await deferred.fulfill()
    }
    
    // MARK: - Helpers
    
    private func makeViewModel(roomProxy: RoomProxyProtocol? = nil, timelineController: RoomTimelineControllerProtocol) -> RoomScreenViewModel {
        RoomScreenViewModel(roomProxy: roomProxy ?? RoomProxyMock(with: .init(name: "")),
                            timelineController: timelineController,
                            mediaProvider: MockMediaProvider(),
                            mediaPlayerProvider: MediaPlayerProviderMock(),
                            voiceMessageMediaManager: VoiceMessageMediaManagerMock(),
                            userIndicatorController: userIndicatorControllerMock,
                            appMediator: AppMediatorMock.default,
                            appSettings: ServiceLocator.shared.settings,
                            analyticsService: ServiceLocator.shared.analytics,
                            notificationCenter: NotificationCenterMock())
    }
}

private extension TextRoomTimelineItem {
    init(text: String, sender: String, addReactions: Bool = false, addReadReceipts: [ReadReceipt] = []) {
        let reactions = addReactions ? [AggregatedReaction(accountOwnerID: "bob", key: "🦄", senders: [ReactionSender(id: sender, timestamp: Date())])] : []
        self.init(id: .random,
                  timestamp: "10:47 am",
                  isOutgoing: sender == "bob",
                  isEditable: sender == "bob",
                  canBeRepliedTo: true,
                  isThreaded: false,
                  sender: .init(id: "@\(sender):server.com", displayName: sender),
                  content: .init(body: text),
                  properties: RoomTimelineItemProperties(reactions: reactions, orderedReadReceipts: addReadReceipts))
    }
}

private extension SeparatorRoomTimelineItem {
    init(timelineID: String) {
        self.init(id: .init(timelineID: timelineID), text: "")
    }
}

private extension TextRoomTimelineItem {
    init(eventID: String) {
        self.init(id: .init(timelineID: UUID().uuidString, eventID: eventID),
                  timestamp: "",
                  isOutgoing: false,
                  isEditable: false,
                  canBeRepliedTo: true,
                  isThreaded: false,
                  sender: .init(id: ""),
                  content: .init(body: "Hello, World!"))
    }
}
