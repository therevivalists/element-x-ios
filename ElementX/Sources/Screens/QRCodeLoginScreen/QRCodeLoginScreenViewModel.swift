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

import AVFoundation
import Combine
import SwiftUI

typealias QRCodeLoginScreenViewModelType = StateStoreViewModel<QRCodeLoginScreenViewState, QRCodeLoginScreenViewAction>

class QRCodeLoginScreenViewModel: QRCodeLoginScreenViewModelType, QRCodeLoginScreenViewModelProtocol {
    private let qrCodeLoginService: QRCodeLoginServiceProtocol
    private let appMediator: AppMediatorProtocol
    
    private let actionsSubject: PassthroughSubject<QRCodeLoginScreenViewModelAction, Never> = .init()
    var actionsPublisher: AnyPublisher<QRCodeLoginScreenViewModelAction, Never> {
        actionsSubject.eraseToAnyPublisher()
    }
    
    private var scanTask: Task<Void, Never>?

    init(qrCodeLoginService: QRCodeLoginServiceProtocol,
         appMediator: AppMediatorProtocol) {
        self.qrCodeLoginService = qrCodeLoginService
        self.appMediator = appMediator
        super.init(initialViewState: QRCodeLoginScreenViewState())
        setupSubscriptions()
    }
    
    // MARK: - Public
    
    override func process(viewAction: QRCodeLoginScreenViewAction) {
        switch viewAction {
        case .cancel:
            actionsSubject.send(.cancel)
        case .startScan:
            Task { await startScanIfPossible() }
        case .openSettings:
            appMediator.openAppSettings()
        }
    }
    
    // MARK: - Private
    
    private func setupSubscriptions() {
        context.$viewState
            // not using compactMap before remove duplicates because if there is an error, and the same code needs to be rescanned the transition to nil to clean the state would get ignored.
            .map(\.bindings.qrResult)
            .removeDuplicates()
            .compactMap { $0 }
            // this needs to be received on the main actor or the state change for connecting won't work properly
            .receive(on: DispatchQueue.main)
            .sink { [weak self] qrData in
                self?.handleScan(qrData: qrData)
            }
            .store(in: &cancellables)
        
        qrCodeLoginService.qrLoginProgressPublisher
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] progress in
                MXLog.info("QR Login Progress changed to: \(progress)")

                guard let self,
                      // Let's not advance the state if the current state is already invalid
                      state.state != .scan(.invalid) else {
                    return
                }
                
                switch progress {
                case .establishingSecureChannel(_, let stringCode):
                    state.state = .displayCode(.deviceCode(stringCode))
                case .waitingForToken(let code):
                    state.state = .displayCode(.verificationCode(code))
                default:
                    break
                }
            }
            .store(in: &cancellables)
    }
    
    private func startScanIfPossible() async {
        state.bindings.qrResult = nil
        state.state = await qrCodeLoginService.requestAuthorizationIfNeeded() ? .scan(.scanning) : .error(.noCameraPermission)
    }
    
    private func handleScan(qrData: Data) {
        guard scanTask == nil else {
            return
        }
        
        state.state = .scan(.connecting)
        
        scanTask = Task { [weak self] in
            guard let self else {
                return
            }
            
            defer {
                scanTask = nil
            }
            
            MXLog.info("Scanning QR code: \(qrData)")
            switch await qrCodeLoginService.loginWithQRCode(data: qrData) {
            case let .success(session):
                MXLog.info("QR Login completed")
                actionsSubject.send(.done(userSession: session))
            case .failure(let error):
                // TODO: The error are flattened now, but here we should return all the possible errors not only the decode error ones, but also the connection related ones.
                MXLog.error("Failed to scan the QR code:\(error)")
                state.state = .scan(.invalid)
            }
        }
    }
        
    /// Only for mocking initial states
    fileprivate init(state: QRCodeLoginState) {
        qrCodeLoginService = QRCodeLoginServiceMock(configuration: .init())
        appMediator = AppMediatorMock.default
        super.init(initialViewState: .init(state: state))
    }
}

extension QRCodeLoginScreenViewModel {
    static func mock(state: QRCodeLoginState) -> QRCodeLoginScreenViewModel {
        QRCodeLoginScreenViewModel(state: state)
    }
}
