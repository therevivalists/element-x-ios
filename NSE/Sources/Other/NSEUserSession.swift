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

import Foundation
import MatrixRustSDK

final class NSEUserSession {
    private let baseClient: Client
    private let notificationClient: NotificationClient
    private let userID: String
    private(set) lazy var mediaProvider: MediaProviderProtocol = MediaProvider(mediaLoader: MediaLoader(client: baseClient),
                                                                               imageCache: .onlyOnDisk)
    private let delegateHandle: TaskHandle?

    init(credentials: KeychainCredentials, clientSessionDelegate: ClientSessionDelegate) async throws {
        userID = credentials.userID
        if credentials.restorationToken.passphrase != nil {
            MXLog.info("Restoring client with encrypted store.")
        }
        
        let homeserverURL = credentials.restorationToken.session.homeserverUrl
        var clientBuilder = ClientBuilder()
            .basePath(path: URL.sessionsBaseDirectory.path)
            .username(username: credentials.userID)
            .homeserverUrl(url: homeserverURL)
            .passphrase(passphrase: credentials.restorationToken.passphrase)
            .userAgent(userAgent: UserAgentBuilder.makeASCIIUserAgent())
            .enableCrossProcessRefreshLock(processId: InfoPlistReader.main.bundleIdentifier,
                                           sessionDelegate: clientSessionDelegate)
        
        if let homeserverURL = URL(string: homeserverURL),
           let proxy = homeserverURL.globalProxy {
            clientBuilder = clientBuilder.proxy(url: proxy)
        }
        
        baseClient = try await clientBuilder.build()
        delegateHandle = baseClient.setDelegate(delegate: ClientDelegateWrapper())
        try baseClient.restoreSession(session: credentials.restorationToken.session)
        
        notificationClient = try baseClient
            .notificationClient(processSetup: .multipleProcesses)
            .filterByPushRules()
            .finish()
    }
    
    func notificationItemProxy(roomID: String, eventID: String) async -> NotificationItemProxyProtocol? {
        await Task.dispatch(on: .global()) {
            do {
                let notification = try self.notificationClient.getNotification(roomId: roomID, eventId: eventID)
                
                guard let notification else {
                    return nil
                }
                return NotificationItemProxy(notificationItem: notification,
                                             eventID: eventID,
                                             receiverID: self.userID,
                                             roomID: roomID)
            } catch {
                MXLog.error("NSE: Could not get notification's content creating an empty notification instead, error: \(error)")
                return EmptyNotificationItemProxy(eventID: eventID, roomID: roomID, receiverID: self.userID)
            }
        }
    }
    
    deinit {
        delegateHandle?.cancel()
    }
}

private class ClientDelegateWrapper: ClientDelegate {
    // MARK: - ClientDelegate

    func didReceiveAuthError(isSoftLogout: Bool) {
        MXLog.error("Received authentication error, the NSE can't handle this.")
    }
    
    func didRefreshTokens() {
        MXLog.info("Delegating session updates to the ClientSessionDelegate.")
    }
}
