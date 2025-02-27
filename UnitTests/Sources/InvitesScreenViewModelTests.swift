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
import XCTest

@MainActor
class InvitesScreenViewModelTests: XCTestCase {
    var viewModel: InvitesScreenViewModelProtocol!
    var clientProxy: ClientProxyMock!
    var userSession: MockUserSession!
    var mockNotificationCenter: NotificationCenterMock!
    
    var context: InvitesScreenViewModelType.Context {
        viewModel.context
    }
    
    override func setUpWithError() throws {
        clientProxy = ClientProxyMock(.init(userID: "@a:b.com"))
        userSession = MockUserSession(clientProxy: clientProxy,
                                      mediaProvider: MockMediaProvider(),
                                      voiceMessageMediaManager: VoiceMessageMediaManagerMock())
        mockNotificationCenter = NotificationCenterMock()
    }

    func testEmptyState() async throws {
        setupViewModel()
        _ = await context.$viewState.values.first()
        let invites = try XCTUnwrap(context.viewState.invites)
        XCTAssertTrue(invites.isEmpty)
    }
    
    func testListState() async throws {
        setupViewModel(roomSummaries: .mockInvites)
        _ = await context.$viewState.values.first(where: { !$0.invites.isEmpty })
        let invites = try XCTUnwrap(context.viewState.invites)
        XCTAssertEqual(invites.count, 2)
    }
    
    func testAcceptInvite() async throws {
        let invites: [RoomSummary] = .mockInvites
        guard case .filled(let details) = invites.first else {
            XCTFail("No invite found")
            return
        }
        setupViewModel(roomSummaries: invites)
        
        let deferred = deferFulfillment(viewModel.actions) { action in
            switch action {
            case .openRoom:
                return true
            }
        }
        
        context.send(viewAction: .accept(.init(roomDetails: details, isUnread: false)))
        let action = try await deferred.fulfill()

        guard case .openRoom(let roomID) = action else {
            XCTFail("Wrong view model action")
            return
        }
        XCTAssertEqual(details.id, roomID)
    }
    
    func testDeclineInvite() async throws {
        let invites: [RoomSummary] = .mockInvites
        guard case .filled(let details) = invites.first else {
            XCTFail("No invite found")
            return
        }
        setupViewModel(roomSummaries: invites)
        context.send(viewAction: .decline(.init(roomDetails: details, isUnread: false)))
        XCTAssertNotNil(context.alertInfo)
    }
    
    // MARK: - Private
    
    private func setupViewModel(roomSummaries: [RoomSummary]? = nil) {
        if let roomSummaries {
            let summaryProvider = RoomSummaryProviderMock(.init(state: .loaded(roomSummaries)))
            clientProxy.inviteSummaryProvider = summaryProvider
            clientProxy.roomSummaryProvider = summaryProvider
        }
        
        viewModel = InvitesScreenViewModel(userSession: userSession,
                                           appSettings: ServiceLocator.shared.settings,
                                           analytics: ServiceLocator.shared.analytics,
                                           userIndicatorController: ServiceLocator.shared.userIndicatorController,
                                           notificationCenterProtocol: mockNotificationCenter)
    }
}
