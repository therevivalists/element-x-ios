// Generated using Sourcery 2.2.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable all
import AnalyticsEvents
import AVFoundation
import Combine
import Foundation
import LocalAuthentication
import MatrixRustSDK
import SwiftUI
class AnalyticsClientMock: AnalyticsClientProtocol {
    var isRunning: Bool {
        get { return underlyingIsRunning }
        set(value) { underlyingIsRunning = value }
    }
    var underlyingIsRunning: Bool!

    //MARK: - start

    var startAnalyticsConfigurationUnderlyingCallsCount = 0
    var startAnalyticsConfigurationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startAnalyticsConfigurationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startAnalyticsConfigurationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startAnalyticsConfigurationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startAnalyticsConfigurationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var startAnalyticsConfigurationCalled: Bool {
        return startAnalyticsConfigurationCallsCount > 0
    }
    var startAnalyticsConfigurationReceivedAnalyticsConfiguration: AnalyticsConfiguration?
    var startAnalyticsConfigurationReceivedInvocations: [AnalyticsConfiguration] = []
    var startAnalyticsConfigurationClosure: ((AnalyticsConfiguration) -> Void)?

    func start(analyticsConfiguration: AnalyticsConfiguration) {
        startAnalyticsConfigurationCallsCount += 1
        startAnalyticsConfigurationReceivedAnalyticsConfiguration = analyticsConfiguration
        startAnalyticsConfigurationReceivedInvocations.append(analyticsConfiguration)
        startAnalyticsConfigurationClosure?(analyticsConfiguration)
    }
    //MARK: - reset

    var resetUnderlyingCallsCount = 0
    var resetCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var resetCalled: Bool {
        return resetCallsCount > 0
    }
    var resetClosure: (() -> Void)?

    func reset() {
        resetCallsCount += 1
        resetClosure?()
    }
    //MARK: - stop

    var stopUnderlyingCallsCount = 0
    var stopCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stopUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stopUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stopUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stopUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var stopCalled: Bool {
        return stopCallsCount > 0
    }
    var stopClosure: (() -> Void)?

    func stop() {
        stopCallsCount += 1
        stopClosure?()
    }
    //MARK: - capture

    var captureUnderlyingCallsCount = 0
    var captureCallsCount: Int {
        get {
            if Thread.isMainThread {
                return captureUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = captureUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                captureUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    captureUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var captureCalled: Bool {
        return captureCallsCount > 0
    }
    var captureReceivedEvent: AnalyticsEventProtocol?
    var captureReceivedInvocations: [AnalyticsEventProtocol] = []
    var captureClosure: ((AnalyticsEventProtocol) -> Void)?

    func capture(_ event: AnalyticsEventProtocol) {
        captureCallsCount += 1
        captureReceivedEvent = event
        captureReceivedInvocations.append(event)
        captureClosure?(event)
    }
    //MARK: - screen

    var screenUnderlyingCallsCount = 0
    var screenCallsCount: Int {
        get {
            if Thread.isMainThread {
                return screenUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = screenUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                screenUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    screenUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var screenCalled: Bool {
        return screenCallsCount > 0
    }
    var screenReceivedEvent: AnalyticsScreenProtocol?
    var screenReceivedInvocations: [AnalyticsScreenProtocol] = []
    var screenClosure: ((AnalyticsScreenProtocol) -> Void)?

    func screen(_ event: AnalyticsScreenProtocol) {
        screenCallsCount += 1
        screenReceivedEvent = event
        screenReceivedInvocations.append(event)
        screenClosure?(event)
    }
}
class AppLockServiceMock: AppLockServiceProtocol {
    var isMandatory: Bool {
        get { return underlyingIsMandatory }
        set(value) { underlyingIsMandatory = value }
    }
    var underlyingIsMandatory: Bool!
    var isEnabled: Bool {
        get { return underlyingIsEnabled }
        set(value) { underlyingIsEnabled = value }
    }
    var underlyingIsEnabled: Bool!
    var isEnabledPublisher: AnyPublisher<Bool, Never> {
        get { return underlyingIsEnabledPublisher }
        set(value) { underlyingIsEnabledPublisher = value }
    }
    var underlyingIsEnabledPublisher: AnyPublisher<Bool, Never>!
    var biometryType: LABiometryType {
        get { return underlyingBiometryType }
        set(value) { underlyingBiometryType = value }
    }
    var underlyingBiometryType: LABiometryType!
    var biometricUnlockEnabled: Bool {
        get { return underlyingBiometricUnlockEnabled }
        set(value) { underlyingBiometricUnlockEnabled = value }
    }
    var underlyingBiometricUnlockEnabled: Bool!
    var biometricUnlockTrusted: Bool {
        get { return underlyingBiometricUnlockTrusted }
        set(value) { underlyingBiometricUnlockTrusted = value }
    }
    var underlyingBiometricUnlockTrusted: Bool!
    var numberOfPINAttempts: AnyPublisher<Int, Never> {
        get { return underlyingNumberOfPINAttempts }
        set(value) { underlyingNumberOfPINAttempts = value }
    }
    var underlyingNumberOfPINAttempts: AnyPublisher<Int, Never>!

    //MARK: - setupPINCode

    var setupPINCodeUnderlyingCallsCount = 0
    var setupPINCodeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setupPINCodeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setupPINCodeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setupPINCodeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setupPINCodeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setupPINCodeCalled: Bool {
        return setupPINCodeCallsCount > 0
    }
    var setupPINCodeReceivedPinCode: String?
    var setupPINCodeReceivedInvocations: [String] = []

    var setupPINCodeUnderlyingReturnValue: Result<Void, AppLockServiceError>!
    var setupPINCodeReturnValue: Result<Void, AppLockServiceError>! {
        get {
            if Thread.isMainThread {
                return setupPINCodeUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, AppLockServiceError>? = nil
                DispatchQueue.main.sync {
                    returnValue = setupPINCodeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setupPINCodeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    setupPINCodeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var setupPINCodeClosure: ((String) -> Result<Void, AppLockServiceError>)?

    func setupPINCode(_ pinCode: String) -> Result<Void, AppLockServiceError> {
        setupPINCodeCallsCount += 1
        setupPINCodeReceivedPinCode = pinCode
        setupPINCodeReceivedInvocations.append(pinCode)
        if let setupPINCodeClosure = setupPINCodeClosure {
            return setupPINCodeClosure(pinCode)
        } else {
            return setupPINCodeReturnValue
        }
    }
    //MARK: - validate

    var validateUnderlyingCallsCount = 0
    var validateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return validateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = validateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                validateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    validateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var validateCalled: Bool {
        return validateCallsCount > 0
    }
    var validateReceivedPinCode: String?
    var validateReceivedInvocations: [String] = []

    var validateUnderlyingReturnValue: Result<Void, AppLockServiceError>!
    var validateReturnValue: Result<Void, AppLockServiceError>! {
        get {
            if Thread.isMainThread {
                return validateUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, AppLockServiceError>? = nil
                DispatchQueue.main.sync {
                    returnValue = validateUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                validateUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    validateUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var validateClosure: ((String) -> Result<Void, AppLockServiceError>)?

    func validate(_ pinCode: String) -> Result<Void, AppLockServiceError> {
        validateCallsCount += 1
        validateReceivedPinCode = pinCode
        validateReceivedInvocations.append(pinCode)
        if let validateClosure = validateClosure {
            return validateClosure(pinCode)
        } else {
            return validateReturnValue
        }
    }
    //MARK: - enableBiometricUnlock

    var enableBiometricUnlockUnderlyingCallsCount = 0
    var enableBiometricUnlockCallsCount: Int {
        get {
            if Thread.isMainThread {
                return enableBiometricUnlockUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = enableBiometricUnlockUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableBiometricUnlockUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    enableBiometricUnlockUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var enableBiometricUnlockCalled: Bool {
        return enableBiometricUnlockCallsCount > 0
    }

    var enableBiometricUnlockUnderlyingReturnValue: Result<Void, AppLockServiceError>!
    var enableBiometricUnlockReturnValue: Result<Void, AppLockServiceError>! {
        get {
            if Thread.isMainThread {
                return enableBiometricUnlockUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, AppLockServiceError>? = nil
                DispatchQueue.main.sync {
                    returnValue = enableBiometricUnlockUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableBiometricUnlockUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    enableBiometricUnlockUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var enableBiometricUnlockClosure: (() -> Result<Void, AppLockServiceError>)?

    func enableBiometricUnlock() -> Result<Void, AppLockServiceError> {
        enableBiometricUnlockCallsCount += 1
        if let enableBiometricUnlockClosure = enableBiometricUnlockClosure {
            return enableBiometricUnlockClosure()
        } else {
            return enableBiometricUnlockReturnValue
        }
    }
    //MARK: - disableBiometricUnlock

    var disableBiometricUnlockUnderlyingCallsCount = 0
    var disableBiometricUnlockCallsCount: Int {
        get {
            if Thread.isMainThread {
                return disableBiometricUnlockUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = disableBiometricUnlockUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                disableBiometricUnlockUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    disableBiometricUnlockUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var disableBiometricUnlockCalled: Bool {
        return disableBiometricUnlockCallsCount > 0
    }
    var disableBiometricUnlockClosure: (() -> Void)?

    func disableBiometricUnlock() {
        disableBiometricUnlockCallsCount += 1
        disableBiometricUnlockClosure?()
    }
    //MARK: - disable

    var disableUnderlyingCallsCount = 0
    var disableCallsCount: Int {
        get {
            if Thread.isMainThread {
                return disableUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = disableUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                disableUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    disableUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var disableCalled: Bool {
        return disableCallsCount > 0
    }
    var disableClosure: (() -> Void)?

    func disable() {
        disableCallsCount += 1
        disableClosure?()
    }
    //MARK: - applicationDidEnterBackground

    var applicationDidEnterBackgroundUnderlyingCallsCount = 0
    var applicationDidEnterBackgroundCallsCount: Int {
        get {
            if Thread.isMainThread {
                return applicationDidEnterBackgroundUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = applicationDidEnterBackgroundUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                applicationDidEnterBackgroundUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    applicationDidEnterBackgroundUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var applicationDidEnterBackgroundCalled: Bool {
        return applicationDidEnterBackgroundCallsCount > 0
    }
    var applicationDidEnterBackgroundClosure: (() -> Void)?

    func applicationDidEnterBackground() {
        applicationDidEnterBackgroundCallsCount += 1
        applicationDidEnterBackgroundClosure?()
    }
    //MARK: - computeNeedsUnlock

    var computeNeedsUnlockDidBecomeActiveAtUnderlyingCallsCount = 0
    var computeNeedsUnlockDidBecomeActiveAtCallsCount: Int {
        get {
            if Thread.isMainThread {
                return computeNeedsUnlockDidBecomeActiveAtUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = computeNeedsUnlockDidBecomeActiveAtUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                computeNeedsUnlockDidBecomeActiveAtUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    computeNeedsUnlockDidBecomeActiveAtUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var computeNeedsUnlockDidBecomeActiveAtCalled: Bool {
        return computeNeedsUnlockDidBecomeActiveAtCallsCount > 0
    }
    var computeNeedsUnlockDidBecomeActiveAtReceivedDate: Date?
    var computeNeedsUnlockDidBecomeActiveAtReceivedInvocations: [Date] = []

    var computeNeedsUnlockDidBecomeActiveAtUnderlyingReturnValue: Bool!
    var computeNeedsUnlockDidBecomeActiveAtReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return computeNeedsUnlockDidBecomeActiveAtUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = computeNeedsUnlockDidBecomeActiveAtUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                computeNeedsUnlockDidBecomeActiveAtUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    computeNeedsUnlockDidBecomeActiveAtUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var computeNeedsUnlockDidBecomeActiveAtClosure: ((Date) -> Bool)?

    func computeNeedsUnlock(didBecomeActiveAt date: Date) -> Bool {
        computeNeedsUnlockDidBecomeActiveAtCallsCount += 1
        computeNeedsUnlockDidBecomeActiveAtReceivedDate = date
        computeNeedsUnlockDidBecomeActiveAtReceivedInvocations.append(date)
        if let computeNeedsUnlockDidBecomeActiveAtClosure = computeNeedsUnlockDidBecomeActiveAtClosure {
            return computeNeedsUnlockDidBecomeActiveAtClosure(date)
        } else {
            return computeNeedsUnlockDidBecomeActiveAtReturnValue
        }
    }
    //MARK: - unlock

    var unlockWithUnderlyingCallsCount = 0
    var unlockWithCallsCount: Int {
        get {
            if Thread.isMainThread {
                return unlockWithUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = unlockWithUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unlockWithUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    unlockWithUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var unlockWithCalled: Bool {
        return unlockWithCallsCount > 0
    }
    var unlockWithReceivedPinCode: String?
    var unlockWithReceivedInvocations: [String] = []

    var unlockWithUnderlyingReturnValue: Bool!
    var unlockWithReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return unlockWithUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = unlockWithUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unlockWithUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    unlockWithUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var unlockWithClosure: ((String) -> Bool)?

    func unlock(with pinCode: String) -> Bool {
        unlockWithCallsCount += 1
        unlockWithReceivedPinCode = pinCode
        unlockWithReceivedInvocations.append(pinCode)
        if let unlockWithClosure = unlockWithClosure {
            return unlockWithClosure(pinCode)
        } else {
            return unlockWithReturnValue
        }
    }
    //MARK: - unlockWithBiometrics

    var unlockWithBiometricsUnderlyingCallsCount = 0
    var unlockWithBiometricsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return unlockWithBiometricsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = unlockWithBiometricsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unlockWithBiometricsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    unlockWithBiometricsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var unlockWithBiometricsCalled: Bool {
        return unlockWithBiometricsCallsCount > 0
    }

    var unlockWithBiometricsUnderlyingReturnValue: AppLockServiceBiometricResult!
    var unlockWithBiometricsReturnValue: AppLockServiceBiometricResult! {
        get {
            if Thread.isMainThread {
                return unlockWithBiometricsUnderlyingReturnValue
            } else {
                var returnValue: AppLockServiceBiometricResult? = nil
                DispatchQueue.main.sync {
                    returnValue = unlockWithBiometricsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unlockWithBiometricsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    unlockWithBiometricsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var unlockWithBiometricsClosure: (() async -> AppLockServiceBiometricResult)?

    func unlockWithBiometrics() async -> AppLockServiceBiometricResult {
        unlockWithBiometricsCallsCount += 1
        if let unlockWithBiometricsClosure = unlockWithBiometricsClosure {
            return await unlockWithBiometricsClosure()
        } else {
            return unlockWithBiometricsReturnValue
        }
    }
}
class AppMediatorMock: AppMediatorProtocol {
    var windowManager: WindowManagerProtocol {
        get { return underlyingWindowManager }
        set(value) { underlyingWindowManager = value }
    }
    var underlyingWindowManager: WindowManagerProtocol!
    var appState: UIApplication.State {
        get { return underlyingAppState }
        set(value) { underlyingAppState = value }
    }
    var underlyingAppState: UIApplication.State!

    //MARK: - beginBackgroundTask

    var beginBackgroundTaskExpirationHandlerUnderlyingCallsCount = 0
    var beginBackgroundTaskExpirationHandlerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return beginBackgroundTaskExpirationHandlerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = beginBackgroundTaskExpirationHandlerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                beginBackgroundTaskExpirationHandlerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    beginBackgroundTaskExpirationHandlerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var beginBackgroundTaskExpirationHandlerCalled: Bool {
        return beginBackgroundTaskExpirationHandlerCallsCount > 0
    }

    var beginBackgroundTaskExpirationHandlerUnderlyingReturnValue: UIBackgroundTaskIdentifier!
    var beginBackgroundTaskExpirationHandlerReturnValue: UIBackgroundTaskIdentifier! {
        get {
            if Thread.isMainThread {
                return beginBackgroundTaskExpirationHandlerUnderlyingReturnValue
            } else {
                var returnValue: UIBackgroundTaskIdentifier? = nil
                DispatchQueue.main.sync {
                    returnValue = beginBackgroundTaskExpirationHandlerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                beginBackgroundTaskExpirationHandlerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    beginBackgroundTaskExpirationHandlerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var beginBackgroundTaskExpirationHandlerClosure: (((() -> Void)?) -> UIBackgroundTaskIdentifier)?

    func beginBackgroundTask(expirationHandler handler: (() -> Void)?) -> UIBackgroundTaskIdentifier {
        beginBackgroundTaskExpirationHandlerCallsCount += 1
        if let beginBackgroundTaskExpirationHandlerClosure = beginBackgroundTaskExpirationHandlerClosure {
            return beginBackgroundTaskExpirationHandlerClosure(handler)
        } else {
            return beginBackgroundTaskExpirationHandlerReturnValue
        }
    }
    //MARK: - endBackgroundTask

    var endBackgroundTaskUnderlyingCallsCount = 0
    var endBackgroundTaskCallsCount: Int {
        get {
            if Thread.isMainThread {
                return endBackgroundTaskUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = endBackgroundTaskUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                endBackgroundTaskUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    endBackgroundTaskUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var endBackgroundTaskCalled: Bool {
        return endBackgroundTaskCallsCount > 0
    }
    var endBackgroundTaskReceivedIdentifier: UIBackgroundTaskIdentifier?
    var endBackgroundTaskReceivedInvocations: [UIBackgroundTaskIdentifier] = []
    var endBackgroundTaskClosure: ((UIBackgroundTaskIdentifier) -> Void)?

    func endBackgroundTask(_ identifier: UIBackgroundTaskIdentifier) {
        endBackgroundTaskCallsCount += 1
        endBackgroundTaskReceivedIdentifier = identifier
        endBackgroundTaskReceivedInvocations.append(identifier)
        endBackgroundTaskClosure?(identifier)
    }
    //MARK: - open

    var openUnderlyingCallsCount = 0
    var openCallsCount: Int {
        get {
            if Thread.isMainThread {
                return openUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = openUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                openUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    openUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var openCalled: Bool {
        return openCallsCount > 0
    }
    var openReceivedUrl: URL?
    var openReceivedInvocations: [URL] = []
    var openClosure: ((URL) -> Void)?

    func open(_ url: URL) {
        openCallsCount += 1
        openReceivedUrl = url
        openReceivedInvocations.append(url)
        openClosure?(url)
    }
    //MARK: - openAppSettings

    var openAppSettingsUnderlyingCallsCount = 0
    var openAppSettingsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return openAppSettingsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = openAppSettingsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                openAppSettingsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    openAppSettingsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var openAppSettingsCalled: Bool {
        return openAppSettingsCallsCount > 0
    }
    var openAppSettingsClosure: (() -> Void)?

    func openAppSettings() {
        openAppSettingsCallsCount += 1
        openAppSettingsClosure?()
    }
    //MARK: - setIdleTimerDisabled

    var setIdleTimerDisabledUnderlyingCallsCount = 0
    var setIdleTimerDisabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setIdleTimerDisabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setIdleTimerDisabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setIdleTimerDisabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setIdleTimerDisabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setIdleTimerDisabledCalled: Bool {
        return setIdleTimerDisabledCallsCount > 0
    }
    var setIdleTimerDisabledReceivedDisabled: Bool?
    var setIdleTimerDisabledReceivedInvocations: [Bool] = []
    var setIdleTimerDisabledClosure: ((Bool) -> Void)?

    func setIdleTimerDisabled(_ disabled: Bool) {
        setIdleTimerDisabledCallsCount += 1
        setIdleTimerDisabledReceivedDisabled = disabled
        setIdleTimerDisabledReceivedInvocations.append(disabled)
        setIdleTimerDisabledClosure?(disabled)
    }
}
class AudioConverterMock: AudioConverterProtocol {

    //MARK: - convertToOpusOgg

    var convertToOpusOggSourceURLDestinationURLThrowableError: Error?
    var convertToOpusOggSourceURLDestinationURLUnderlyingCallsCount = 0
    var convertToOpusOggSourceURLDestinationURLCallsCount: Int {
        get {
            if Thread.isMainThread {
                return convertToOpusOggSourceURLDestinationURLUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = convertToOpusOggSourceURLDestinationURLUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                convertToOpusOggSourceURLDestinationURLUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    convertToOpusOggSourceURLDestinationURLUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var convertToOpusOggSourceURLDestinationURLCalled: Bool {
        return convertToOpusOggSourceURLDestinationURLCallsCount > 0
    }
    var convertToOpusOggSourceURLDestinationURLReceivedArguments: (sourceURL: URL, destinationURL: URL)?
    var convertToOpusOggSourceURLDestinationURLReceivedInvocations: [(sourceURL: URL, destinationURL: URL)] = []
    var convertToOpusOggSourceURLDestinationURLClosure: ((URL, URL) throws -> Void)?

    func convertToOpusOgg(sourceURL: URL, destinationURL: URL) throws {
        if let error = convertToOpusOggSourceURLDestinationURLThrowableError {
            throw error
        }
        convertToOpusOggSourceURLDestinationURLCallsCount += 1
        convertToOpusOggSourceURLDestinationURLReceivedArguments = (sourceURL: sourceURL, destinationURL: destinationURL)
        convertToOpusOggSourceURLDestinationURLReceivedInvocations.append((sourceURL: sourceURL, destinationURL: destinationURL))
        try convertToOpusOggSourceURLDestinationURLClosure?(sourceURL, destinationURL)
    }
    //MARK: - convertToMPEG4AAC

    var convertToMPEG4AACSourceURLDestinationURLThrowableError: Error?
    var convertToMPEG4AACSourceURLDestinationURLUnderlyingCallsCount = 0
    var convertToMPEG4AACSourceURLDestinationURLCallsCount: Int {
        get {
            if Thread.isMainThread {
                return convertToMPEG4AACSourceURLDestinationURLUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = convertToMPEG4AACSourceURLDestinationURLUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                convertToMPEG4AACSourceURLDestinationURLUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    convertToMPEG4AACSourceURLDestinationURLUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var convertToMPEG4AACSourceURLDestinationURLCalled: Bool {
        return convertToMPEG4AACSourceURLDestinationURLCallsCount > 0
    }
    var convertToMPEG4AACSourceURLDestinationURLReceivedArguments: (sourceURL: URL, destinationURL: URL)?
    var convertToMPEG4AACSourceURLDestinationURLReceivedInvocations: [(sourceURL: URL, destinationURL: URL)] = []
    var convertToMPEG4AACSourceURLDestinationURLClosure: ((URL, URL) throws -> Void)?

    func convertToMPEG4AAC(sourceURL: URL, destinationURL: URL) throws {
        if let error = convertToMPEG4AACSourceURLDestinationURLThrowableError {
            throw error
        }
        convertToMPEG4AACSourceURLDestinationURLCallsCount += 1
        convertToMPEG4AACSourceURLDestinationURLReceivedArguments = (sourceURL: sourceURL, destinationURL: destinationURL)
        convertToMPEG4AACSourceURLDestinationURLReceivedInvocations.append((sourceURL: sourceURL, destinationURL: destinationURL))
        try convertToMPEG4AACSourceURLDestinationURLClosure?(sourceURL, destinationURL)
    }
}
class AudioPlayerMock: AudioPlayerProtocol {
    var actions: AnyPublisher<AudioPlayerAction, Never> {
        get { return underlyingActions }
        set(value) { underlyingActions = value }
    }
    var underlyingActions: AnyPublisher<AudioPlayerAction, Never>!
    var mediaSource: MediaSourceProxy?
    var duration: TimeInterval {
        get { return underlyingDuration }
        set(value) { underlyingDuration = value }
    }
    var underlyingDuration: TimeInterval!
    var currentTime: TimeInterval {
        get { return underlyingCurrentTime }
        set(value) { underlyingCurrentTime = value }
    }
    var underlyingCurrentTime: TimeInterval!
    var url: URL?
    var state: MediaPlayerState {
        get { return underlyingState }
        set(value) { underlyingState = value }
    }
    var underlyingState: MediaPlayerState!

    //MARK: - load

    var loadMediaSourceUsingAutoplayUnderlyingCallsCount = 0
    var loadMediaSourceUsingAutoplayCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadMediaSourceUsingAutoplayUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadMediaSourceUsingAutoplayUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadMediaSourceUsingAutoplayUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadMediaSourceUsingAutoplayUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var loadMediaSourceUsingAutoplayCalled: Bool {
        return loadMediaSourceUsingAutoplayCallsCount > 0
    }
    var loadMediaSourceUsingAutoplayReceivedArguments: (mediaSource: MediaSourceProxy, url: URL, autoplay: Bool)?
    var loadMediaSourceUsingAutoplayReceivedInvocations: [(mediaSource: MediaSourceProxy, url: URL, autoplay: Bool)] = []
    var loadMediaSourceUsingAutoplayClosure: ((MediaSourceProxy, URL, Bool) -> Void)?

    func load(mediaSource: MediaSourceProxy, using url: URL, autoplay: Bool) {
        loadMediaSourceUsingAutoplayCallsCount += 1
        loadMediaSourceUsingAutoplayReceivedArguments = (mediaSource: mediaSource, url: url, autoplay: autoplay)
        loadMediaSourceUsingAutoplayReceivedInvocations.append((mediaSource: mediaSource, url: url, autoplay: autoplay))
        loadMediaSourceUsingAutoplayClosure?(mediaSource, url, autoplay)
    }
    //MARK: - reset

    var resetUnderlyingCallsCount = 0
    var resetCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var resetCalled: Bool {
        return resetCallsCount > 0
    }
    var resetClosure: (() -> Void)?

    func reset() {
        resetCallsCount += 1
        resetClosure?()
    }
    //MARK: - play

    var playUnderlyingCallsCount = 0
    var playCallsCount: Int {
        get {
            if Thread.isMainThread {
                return playUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = playUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                playUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    playUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var playCalled: Bool {
        return playCallsCount > 0
    }
    var playClosure: (() -> Void)?

    func play() {
        playCallsCount += 1
        playClosure?()
    }
    //MARK: - pause

    var pauseUnderlyingCallsCount = 0
    var pauseCallsCount: Int {
        get {
            if Thread.isMainThread {
                return pauseUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = pauseUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pauseUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    pauseUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var pauseCalled: Bool {
        return pauseCallsCount > 0
    }
    var pauseClosure: (() -> Void)?

    func pause() {
        pauseCallsCount += 1
        pauseClosure?()
    }
    //MARK: - stop

    var stopUnderlyingCallsCount = 0
    var stopCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stopUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stopUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stopUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stopUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var stopCalled: Bool {
        return stopCallsCount > 0
    }
    var stopClosure: (() -> Void)?

    func stop() {
        stopCallsCount += 1
        stopClosure?()
    }
    //MARK: - seek

    var seekToUnderlyingCallsCount = 0
    var seekToCallsCount: Int {
        get {
            if Thread.isMainThread {
                return seekToUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = seekToUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                seekToUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    seekToUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var seekToCalled: Bool {
        return seekToCallsCount > 0
    }
    var seekToReceivedProgress: Double?
    var seekToReceivedInvocations: [Double] = []
    var seekToClosure: ((Double) async -> Void)?

    func seek(to progress: Double) async {
        seekToCallsCount += 1
        seekToReceivedProgress = progress
        seekToReceivedInvocations.append(progress)
        await seekToClosure?(progress)
    }
}
class AudioRecorderMock: AudioRecorderProtocol {
    var actions: AnyPublisher<AudioRecorderAction, Never> {
        get { return underlyingActions }
        set(value) { underlyingActions = value }
    }
    var underlyingActions: AnyPublisher<AudioRecorderAction, Never>!
    var currentTime: TimeInterval {
        get { return underlyingCurrentTime }
        set(value) { underlyingCurrentTime = value }
    }
    var underlyingCurrentTime: TimeInterval!
    var isRecording: Bool {
        get { return underlyingIsRecording }
        set(value) { underlyingIsRecording = value }
    }
    var underlyingIsRecording: Bool!
    var audioFileURL: URL?

    //MARK: - record

    var recordAudioFileURLUnderlyingCallsCount = 0
    var recordAudioFileURLCallsCount: Int {
        get {
            if Thread.isMainThread {
                return recordAudioFileURLUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = recordAudioFileURLUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recordAudioFileURLUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    recordAudioFileURLUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var recordAudioFileURLCalled: Bool {
        return recordAudioFileURLCallsCount > 0
    }
    var recordAudioFileURLReceivedAudioFileURL: URL?
    var recordAudioFileURLReceivedInvocations: [URL] = []
    var recordAudioFileURLClosure: ((URL) async -> Void)?

    func record(audioFileURL: URL) async {
        recordAudioFileURLCallsCount += 1
        recordAudioFileURLReceivedAudioFileURL = audioFileURL
        recordAudioFileURLReceivedInvocations.append(audioFileURL)
        await recordAudioFileURLClosure?(audioFileURL)
    }
    //MARK: - stopRecording

    var stopRecordingUnderlyingCallsCount = 0
    var stopRecordingCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stopRecordingUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stopRecordingUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stopRecordingUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stopRecordingUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var stopRecordingCalled: Bool {
        return stopRecordingCallsCount > 0
    }
    var stopRecordingClosure: (() async -> Void)?

    func stopRecording() async {
        stopRecordingCallsCount += 1
        await stopRecordingClosure?()
    }
    //MARK: - deleteRecording

    var deleteRecordingUnderlyingCallsCount = 0
    var deleteRecordingCallsCount: Int {
        get {
            if Thread.isMainThread {
                return deleteRecordingUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = deleteRecordingUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                deleteRecordingUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    deleteRecordingUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var deleteRecordingCalled: Bool {
        return deleteRecordingCallsCount > 0
    }
    var deleteRecordingClosure: (() async -> Void)?

    func deleteRecording() async {
        deleteRecordingCallsCount += 1
        await deleteRecordingClosure?()
    }
    //MARK: - averagePower

    var averagePowerUnderlyingCallsCount = 0
    var averagePowerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return averagePowerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = averagePowerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                averagePowerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    averagePowerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var averagePowerCalled: Bool {
        return averagePowerCallsCount > 0
    }

    var averagePowerUnderlyingReturnValue: Float!
    var averagePowerReturnValue: Float! {
        get {
            if Thread.isMainThread {
                return averagePowerUnderlyingReturnValue
            } else {
                var returnValue: Float? = nil
                DispatchQueue.main.sync {
                    returnValue = averagePowerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                averagePowerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    averagePowerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var averagePowerClosure: (() -> Float)?

    func averagePower() -> Float {
        averagePowerCallsCount += 1
        if let averagePowerClosure = averagePowerClosure {
            return averagePowerClosure()
        } else {
            return averagePowerReturnValue
        }
    }
}
class AudioSessionMock: AudioSessionProtocol {

    //MARK: - requestRecordPermission

    var requestRecordPermissionUnderlyingCallsCount = 0
    var requestRecordPermissionCallsCount: Int {
        get {
            if Thread.isMainThread {
                return requestRecordPermissionUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = requestRecordPermissionUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestRecordPermissionUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    requestRecordPermissionUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var requestRecordPermissionCalled: Bool {
        return requestRecordPermissionCallsCount > 0
    }
    var requestRecordPermissionReceivedResponse: ((Bool) -> Void)?
    var requestRecordPermissionReceivedInvocations: [((Bool) -> Void)] = []
    var requestRecordPermissionClosure: ((@escaping (Bool) -> Void) -> Void)?

    func requestRecordPermission(_ response: @escaping (Bool) -> Void) {
        requestRecordPermissionCallsCount += 1
        requestRecordPermissionReceivedResponse = response
        requestRecordPermissionReceivedInvocations.append(response)
        requestRecordPermissionClosure?(response)
    }
    //MARK: - setAllowHapticsAndSystemSoundsDuringRecording

    var setAllowHapticsAndSystemSoundsDuringRecordingThrowableError: Error?
    var setAllowHapticsAndSystemSoundsDuringRecordingUnderlyingCallsCount = 0
    var setAllowHapticsAndSystemSoundsDuringRecordingCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setAllowHapticsAndSystemSoundsDuringRecordingUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setAllowHapticsAndSystemSoundsDuringRecordingUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setAllowHapticsAndSystemSoundsDuringRecordingUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setAllowHapticsAndSystemSoundsDuringRecordingUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setAllowHapticsAndSystemSoundsDuringRecordingCalled: Bool {
        return setAllowHapticsAndSystemSoundsDuringRecordingCallsCount > 0
    }
    var setAllowHapticsAndSystemSoundsDuringRecordingReceivedInValue: Bool?
    var setAllowHapticsAndSystemSoundsDuringRecordingReceivedInvocations: [Bool] = []
    var setAllowHapticsAndSystemSoundsDuringRecordingClosure: ((Bool) throws -> Void)?

    func setAllowHapticsAndSystemSoundsDuringRecording(_ inValue: Bool) throws {
        if let error = setAllowHapticsAndSystemSoundsDuringRecordingThrowableError {
            throw error
        }
        setAllowHapticsAndSystemSoundsDuringRecordingCallsCount += 1
        setAllowHapticsAndSystemSoundsDuringRecordingReceivedInValue = inValue
        setAllowHapticsAndSystemSoundsDuringRecordingReceivedInvocations.append(inValue)
        try setAllowHapticsAndSystemSoundsDuringRecordingClosure?(inValue)
    }
    //MARK: - setCategory

    var setCategoryModeOptionsThrowableError: Error?
    var setCategoryModeOptionsUnderlyingCallsCount = 0
    var setCategoryModeOptionsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setCategoryModeOptionsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setCategoryModeOptionsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setCategoryModeOptionsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setCategoryModeOptionsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setCategoryModeOptionsCalled: Bool {
        return setCategoryModeOptionsCallsCount > 0
    }
    var setCategoryModeOptionsReceivedArguments: (category: AVAudioSession.Category, mode: AVAudioSession.Mode, options: AVAudioSession.CategoryOptions)?
    var setCategoryModeOptionsReceivedInvocations: [(category: AVAudioSession.Category, mode: AVAudioSession.Mode, options: AVAudioSession.CategoryOptions)] = []
    var setCategoryModeOptionsClosure: ((AVAudioSession.Category, AVAudioSession.Mode, AVAudioSession.CategoryOptions) throws -> Void)?

    func setCategory(_ category: AVAudioSession.Category, mode: AVAudioSession.Mode, options: AVAudioSession.CategoryOptions) throws {
        if let error = setCategoryModeOptionsThrowableError {
            throw error
        }
        setCategoryModeOptionsCallsCount += 1
        setCategoryModeOptionsReceivedArguments = (category: category, mode: mode, options: options)
        setCategoryModeOptionsReceivedInvocations.append((category: category, mode: mode, options: options))
        try setCategoryModeOptionsClosure?(category, mode, options)
    }
    //MARK: - setActive

    var setActiveOptionsThrowableError: Error?
    var setActiveOptionsUnderlyingCallsCount = 0
    var setActiveOptionsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setActiveOptionsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setActiveOptionsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setActiveOptionsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setActiveOptionsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setActiveOptionsCalled: Bool {
        return setActiveOptionsCallsCount > 0
    }
    var setActiveOptionsReceivedArguments: (active: Bool, options: AVAudioSession.SetActiveOptions)?
    var setActiveOptionsReceivedInvocations: [(active: Bool, options: AVAudioSession.SetActiveOptions)] = []
    var setActiveOptionsClosure: ((Bool, AVAudioSession.SetActiveOptions) throws -> Void)?

    func setActive(_ active: Bool, options: AVAudioSession.SetActiveOptions) throws {
        if let error = setActiveOptionsThrowableError {
            throw error
        }
        setActiveOptionsCallsCount += 1
        setActiveOptionsReceivedArguments = (active: active, options: options)
        setActiveOptionsReceivedInvocations.append((active: active, options: options))
        try setActiveOptionsClosure?(active, options)
    }
}
class BugReportServiceMock: BugReportServiceProtocol {
    var isRunning: Bool {
        get { return underlyingIsRunning }
        set(value) { underlyingIsRunning = value }
    }
    var underlyingIsRunning: Bool!
    var crashedLastRun: Bool {
        get { return underlyingCrashedLastRun }
        set(value) { underlyingCrashedLastRun = value }
    }
    var underlyingCrashedLastRun: Bool!

    //MARK: - start

    var startUnderlyingCallsCount = 0
    var startCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var startCalled: Bool {
        return startCallsCount > 0
    }
    var startClosure: (() -> Void)?

    func start() {
        startCallsCount += 1
        startClosure?()
    }
    //MARK: - stop

    var stopUnderlyingCallsCount = 0
    var stopCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stopUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stopUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stopUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stopUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var stopCalled: Bool {
        return stopCallsCount > 0
    }
    var stopClosure: (() -> Void)?

    func stop() {
        stopCallsCount += 1
        stopClosure?()
    }
    //MARK: - reset

    var resetUnderlyingCallsCount = 0
    var resetCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var resetCalled: Bool {
        return resetCallsCount > 0
    }
    var resetClosure: (() -> Void)?

    func reset() {
        resetCallsCount += 1
        resetClosure?()
    }
    //MARK: - submitBugReport

    var submitBugReportProgressListenerUnderlyingCallsCount = 0
    var submitBugReportProgressListenerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return submitBugReportProgressListenerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = submitBugReportProgressListenerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                submitBugReportProgressListenerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    submitBugReportProgressListenerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var submitBugReportProgressListenerCalled: Bool {
        return submitBugReportProgressListenerCallsCount > 0
    }
    var submitBugReportProgressListenerReceivedArguments: (bugReport: BugReport, progressListener: CurrentValueSubject<Double, Never>)?
    var submitBugReportProgressListenerReceivedInvocations: [(bugReport: BugReport, progressListener: CurrentValueSubject<Double, Never>)] = []

    var submitBugReportProgressListenerUnderlyingReturnValue: Result<SubmitBugReportResponse, BugReportServiceError>!
    var submitBugReportProgressListenerReturnValue: Result<SubmitBugReportResponse, BugReportServiceError>! {
        get {
            if Thread.isMainThread {
                return submitBugReportProgressListenerUnderlyingReturnValue
            } else {
                var returnValue: Result<SubmitBugReportResponse, BugReportServiceError>? = nil
                DispatchQueue.main.sync {
                    returnValue = submitBugReportProgressListenerUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                submitBugReportProgressListenerUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    submitBugReportProgressListenerUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var submitBugReportProgressListenerClosure: ((BugReport, CurrentValueSubject<Double, Never>) async -> Result<SubmitBugReportResponse, BugReportServiceError>)?

    func submitBugReport(_ bugReport: BugReport, progressListener: CurrentValueSubject<Double, Never>) async -> Result<SubmitBugReportResponse, BugReportServiceError> {
        submitBugReportProgressListenerCallsCount += 1
        submitBugReportProgressListenerReceivedArguments = (bugReport: bugReport, progressListener: progressListener)
        submitBugReportProgressListenerReceivedInvocations.append((bugReport: bugReport, progressListener: progressListener))
        if let submitBugReportProgressListenerClosure = submitBugReportProgressListenerClosure {
            return await submitBugReportProgressListenerClosure(bugReport, progressListener)
        } else {
            return submitBugReportProgressListenerReturnValue
        }
    }
}
class ClientProxyMock: ClientProxyProtocol {
    var actionsPublisher: AnyPublisher<ClientProxyAction, Never> {
        get { return underlyingActionsPublisher }
        set(value) { underlyingActionsPublisher = value }
    }
    var underlyingActionsPublisher: AnyPublisher<ClientProxyAction, Never>!
    var loadingStatePublisher: CurrentValuePublisher<ClientProxyLoadingState, Never> {
        get { return underlyingLoadingStatePublisher }
        set(value) { underlyingLoadingStatePublisher = value }
    }
    var underlyingLoadingStatePublisher: CurrentValuePublisher<ClientProxyLoadingState, Never>!
    var verificationStatePublisher: CurrentValuePublisher<SessionVerificationState, Never> {
        get { return underlyingVerificationStatePublisher }
        set(value) { underlyingVerificationStatePublisher = value }
    }
    var underlyingVerificationStatePublisher: CurrentValuePublisher<SessionVerificationState, Never>!
    var userID: String {
        get { return underlyingUserID }
        set(value) { underlyingUserID = value }
    }
    var underlyingUserID: String!
    var deviceID: String?
    var homeserver: String {
        get { return underlyingHomeserver }
        set(value) { underlyingHomeserver = value }
    }
    var underlyingHomeserver: String!
    var userDisplayNamePublisher: CurrentValuePublisher<String?, Never> {
        get { return underlyingUserDisplayNamePublisher }
        set(value) { underlyingUserDisplayNamePublisher = value }
    }
    var underlyingUserDisplayNamePublisher: CurrentValuePublisher<String?, Never>!
    var userAvatarURLPublisher: CurrentValuePublisher<URL?, Never> {
        get { return underlyingUserAvatarURLPublisher }
        set(value) { underlyingUserAvatarURLPublisher = value }
    }
    var underlyingUserAvatarURLPublisher: CurrentValuePublisher<URL?, Never>!
    var ignoredUsersPublisher: CurrentValuePublisher<[String]?, Never> {
        get { return underlyingIgnoredUsersPublisher }
        set(value) { underlyingIgnoredUsersPublisher = value }
    }
    var underlyingIgnoredUsersPublisher: CurrentValuePublisher<[String]?, Never>!
    var pusherNotificationClientIdentifier: String?
    var roomSummaryProvider: RoomSummaryProviderProtocol?
    var alternateRoomSummaryProvider: RoomSummaryProviderProtocol?
    var inviteSummaryProvider: RoomSummaryProviderProtocol?
    var notificationSettings: NotificationSettingsProxyProtocol {
        get { return underlyingNotificationSettings }
        set(value) { underlyingNotificationSettings = value }
    }
    var underlyingNotificationSettings: NotificationSettingsProxyProtocol!
    var secureBackupController: SecureBackupControllerProtocol {
        get { return underlyingSecureBackupController }
        set(value) { underlyingSecureBackupController = value }
    }
    var underlyingSecureBackupController: SecureBackupControllerProtocol!

    //MARK: - isOnlyDeviceLeft

    var isOnlyDeviceLeftUnderlyingCallsCount = 0
    var isOnlyDeviceLeftCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isOnlyDeviceLeftUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isOnlyDeviceLeftUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isOnlyDeviceLeftUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isOnlyDeviceLeftUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var isOnlyDeviceLeftCalled: Bool {
        return isOnlyDeviceLeftCallsCount > 0
    }

    var isOnlyDeviceLeftUnderlyingReturnValue: Result<Bool, ClientProxyError>!
    var isOnlyDeviceLeftReturnValue: Result<Bool, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return isOnlyDeviceLeftUnderlyingReturnValue
            } else {
                var returnValue: Result<Bool, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = isOnlyDeviceLeftUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isOnlyDeviceLeftUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isOnlyDeviceLeftUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var isOnlyDeviceLeftClosure: (() async -> Result<Bool, ClientProxyError>)?

    func isOnlyDeviceLeft() async -> Result<Bool, ClientProxyError> {
        isOnlyDeviceLeftCallsCount += 1
        if let isOnlyDeviceLeftClosure = isOnlyDeviceLeftClosure {
            return await isOnlyDeviceLeftClosure()
        } else {
            return isOnlyDeviceLeftReturnValue
        }
    }
    //MARK: - startSync

    var startSyncUnderlyingCallsCount = 0
    var startSyncCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startSyncUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startSyncUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startSyncUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startSyncUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var startSyncCalled: Bool {
        return startSyncCallsCount > 0
    }
    var startSyncClosure: (() -> Void)?

    func startSync() {
        startSyncCallsCount += 1
        startSyncClosure?()
    }
    //MARK: - stopSync

    var stopSyncUnderlyingCallsCount = 0
    var stopSyncCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stopSyncUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stopSyncUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stopSyncUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stopSyncUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var stopSyncCalled: Bool {
        return stopSyncCallsCount > 0
    }
    var stopSyncClosure: (() -> Void)?

    func stopSync() {
        stopSyncCallsCount += 1
        stopSyncClosure?()
    }
    //MARK: - accountURL

    var accountURLActionUnderlyingCallsCount = 0
    var accountURLActionCallsCount: Int {
        get {
            if Thread.isMainThread {
                return accountURLActionUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = accountURLActionUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                accountURLActionUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    accountURLActionUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var accountURLActionCalled: Bool {
        return accountURLActionCallsCount > 0
    }
    var accountURLActionReceivedAction: AccountManagementAction?
    var accountURLActionReceivedInvocations: [AccountManagementAction] = []

    var accountURLActionUnderlyingReturnValue: URL?
    var accountURLActionReturnValue: URL? {
        get {
            if Thread.isMainThread {
                return accountURLActionUnderlyingReturnValue
            } else {
                var returnValue: URL?? = nil
                DispatchQueue.main.sync {
                    returnValue = accountURLActionUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                accountURLActionUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    accountURLActionUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var accountURLActionClosure: ((AccountManagementAction) -> URL?)?

    func accountURL(action: AccountManagementAction) -> URL? {
        accountURLActionCallsCount += 1
        accountURLActionReceivedAction = action
        accountURLActionReceivedInvocations.append(action)
        if let accountURLActionClosure = accountURLActionClosure {
            return accountURLActionClosure(action)
        } else {
            return accountURLActionReturnValue
        }
    }
    //MARK: - createDirectRoomIfNeeded

    var createDirectRoomIfNeededWithExpectedRoomNameUnderlyingCallsCount = 0
    var createDirectRoomIfNeededWithExpectedRoomNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return createDirectRoomIfNeededWithExpectedRoomNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = createDirectRoomIfNeededWithExpectedRoomNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createDirectRoomIfNeededWithExpectedRoomNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    createDirectRoomIfNeededWithExpectedRoomNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var createDirectRoomIfNeededWithExpectedRoomNameCalled: Bool {
        return createDirectRoomIfNeededWithExpectedRoomNameCallsCount > 0
    }
    var createDirectRoomIfNeededWithExpectedRoomNameReceivedArguments: (userID: String, expectedRoomName: String?)?
    var createDirectRoomIfNeededWithExpectedRoomNameReceivedInvocations: [(userID: String, expectedRoomName: String?)] = []

    var createDirectRoomIfNeededWithExpectedRoomNameUnderlyingReturnValue: Result<(roomID: String, isNewRoom: Bool), ClientProxyError>!
    var createDirectRoomIfNeededWithExpectedRoomNameReturnValue: Result<(roomID: String, isNewRoom: Bool), ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return createDirectRoomIfNeededWithExpectedRoomNameUnderlyingReturnValue
            } else {
                var returnValue: Result<(roomID: String, isNewRoom: Bool), ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = createDirectRoomIfNeededWithExpectedRoomNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createDirectRoomIfNeededWithExpectedRoomNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    createDirectRoomIfNeededWithExpectedRoomNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var createDirectRoomIfNeededWithExpectedRoomNameClosure: ((String, String?) async -> Result<(roomID: String, isNewRoom: Bool), ClientProxyError>)?

    func createDirectRoomIfNeeded(with userID: String, expectedRoomName: String?) async -> Result<(roomID: String, isNewRoom: Bool), ClientProxyError> {
        createDirectRoomIfNeededWithExpectedRoomNameCallsCount += 1
        createDirectRoomIfNeededWithExpectedRoomNameReceivedArguments = (userID: userID, expectedRoomName: expectedRoomName)
        createDirectRoomIfNeededWithExpectedRoomNameReceivedInvocations.append((userID: userID, expectedRoomName: expectedRoomName))
        if let createDirectRoomIfNeededWithExpectedRoomNameClosure = createDirectRoomIfNeededWithExpectedRoomNameClosure {
            return await createDirectRoomIfNeededWithExpectedRoomNameClosure(userID, expectedRoomName)
        } else {
            return createDirectRoomIfNeededWithExpectedRoomNameReturnValue
        }
    }
    //MARK: - directRoomForUserID

    var directRoomForUserIDUnderlyingCallsCount = 0
    var directRoomForUserIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return directRoomForUserIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = directRoomForUserIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                directRoomForUserIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    directRoomForUserIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var directRoomForUserIDCalled: Bool {
        return directRoomForUserIDCallsCount > 0
    }
    var directRoomForUserIDReceivedUserID: String?
    var directRoomForUserIDReceivedInvocations: [String] = []

    var directRoomForUserIDUnderlyingReturnValue: Result<String?, ClientProxyError>!
    var directRoomForUserIDReturnValue: Result<String?, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return directRoomForUserIDUnderlyingReturnValue
            } else {
                var returnValue: Result<String?, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = directRoomForUserIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                directRoomForUserIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    directRoomForUserIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var directRoomForUserIDClosure: ((String) async -> Result<String?, ClientProxyError>)?

    func directRoomForUserID(_ userID: String) async -> Result<String?, ClientProxyError> {
        directRoomForUserIDCallsCount += 1
        directRoomForUserIDReceivedUserID = userID
        directRoomForUserIDReceivedInvocations.append(userID)
        if let directRoomForUserIDClosure = directRoomForUserIDClosure {
            return await directRoomForUserIDClosure(userID)
        } else {
            return directRoomForUserIDReturnValue
        }
    }
    //MARK: - createDirectRoom

    var createDirectRoomWithExpectedRoomNameUnderlyingCallsCount = 0
    var createDirectRoomWithExpectedRoomNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return createDirectRoomWithExpectedRoomNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = createDirectRoomWithExpectedRoomNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createDirectRoomWithExpectedRoomNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    createDirectRoomWithExpectedRoomNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var createDirectRoomWithExpectedRoomNameCalled: Bool {
        return createDirectRoomWithExpectedRoomNameCallsCount > 0
    }
    var createDirectRoomWithExpectedRoomNameReceivedArguments: (userID: String, expectedRoomName: String?)?
    var createDirectRoomWithExpectedRoomNameReceivedInvocations: [(userID: String, expectedRoomName: String?)] = []

    var createDirectRoomWithExpectedRoomNameUnderlyingReturnValue: Result<String, ClientProxyError>!
    var createDirectRoomWithExpectedRoomNameReturnValue: Result<String, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return createDirectRoomWithExpectedRoomNameUnderlyingReturnValue
            } else {
                var returnValue: Result<String, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = createDirectRoomWithExpectedRoomNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createDirectRoomWithExpectedRoomNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    createDirectRoomWithExpectedRoomNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var createDirectRoomWithExpectedRoomNameClosure: ((String, String?) async -> Result<String, ClientProxyError>)?

    func createDirectRoom(with userID: String, expectedRoomName: String?) async -> Result<String, ClientProxyError> {
        createDirectRoomWithExpectedRoomNameCallsCount += 1
        createDirectRoomWithExpectedRoomNameReceivedArguments = (userID: userID, expectedRoomName: expectedRoomName)
        createDirectRoomWithExpectedRoomNameReceivedInvocations.append((userID: userID, expectedRoomName: expectedRoomName))
        if let createDirectRoomWithExpectedRoomNameClosure = createDirectRoomWithExpectedRoomNameClosure {
            return await createDirectRoomWithExpectedRoomNameClosure(userID, expectedRoomName)
        } else {
            return createDirectRoomWithExpectedRoomNameReturnValue
        }
    }
    //MARK: - createRoom

    var createRoomNameTopicIsRoomPrivateUserIDsAvatarURLUnderlyingCallsCount = 0
    var createRoomNameTopicIsRoomPrivateUserIDsAvatarURLCallsCount: Int {
        get {
            if Thread.isMainThread {
                return createRoomNameTopicIsRoomPrivateUserIDsAvatarURLUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = createRoomNameTopicIsRoomPrivateUserIDsAvatarURLUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createRoomNameTopicIsRoomPrivateUserIDsAvatarURLUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    createRoomNameTopicIsRoomPrivateUserIDsAvatarURLUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var createRoomNameTopicIsRoomPrivateUserIDsAvatarURLCalled: Bool {
        return createRoomNameTopicIsRoomPrivateUserIDsAvatarURLCallsCount > 0
    }
    var createRoomNameTopicIsRoomPrivateUserIDsAvatarURLReceivedArguments: (name: String, topic: String?, isRoomPrivate: Bool, userIDs: [String], avatarURL: URL?)?
    var createRoomNameTopicIsRoomPrivateUserIDsAvatarURLReceivedInvocations: [(name: String, topic: String?, isRoomPrivate: Bool, userIDs: [String], avatarURL: URL?)] = []

    var createRoomNameTopicIsRoomPrivateUserIDsAvatarURLUnderlyingReturnValue: Result<String, ClientProxyError>!
    var createRoomNameTopicIsRoomPrivateUserIDsAvatarURLReturnValue: Result<String, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return createRoomNameTopicIsRoomPrivateUserIDsAvatarURLUnderlyingReturnValue
            } else {
                var returnValue: Result<String, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = createRoomNameTopicIsRoomPrivateUserIDsAvatarURLUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createRoomNameTopicIsRoomPrivateUserIDsAvatarURLUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    createRoomNameTopicIsRoomPrivateUserIDsAvatarURLUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var createRoomNameTopicIsRoomPrivateUserIDsAvatarURLClosure: ((String, String?, Bool, [String], URL?) async -> Result<String, ClientProxyError>)?

    func createRoom(name: String, topic: String?, isRoomPrivate: Bool, userIDs: [String], avatarURL: URL?) async -> Result<String, ClientProxyError> {
        createRoomNameTopicIsRoomPrivateUserIDsAvatarURLCallsCount += 1
        createRoomNameTopicIsRoomPrivateUserIDsAvatarURLReceivedArguments = (name: name, topic: topic, isRoomPrivate: isRoomPrivate, userIDs: userIDs, avatarURL: avatarURL)
        createRoomNameTopicIsRoomPrivateUserIDsAvatarURLReceivedInvocations.append((name: name, topic: topic, isRoomPrivate: isRoomPrivate, userIDs: userIDs, avatarURL: avatarURL))
        if let createRoomNameTopicIsRoomPrivateUserIDsAvatarURLClosure = createRoomNameTopicIsRoomPrivateUserIDsAvatarURLClosure {
            return await createRoomNameTopicIsRoomPrivateUserIDsAvatarURLClosure(name, topic, isRoomPrivate, userIDs, avatarURL)
        } else {
            return createRoomNameTopicIsRoomPrivateUserIDsAvatarURLReturnValue
        }
    }
    //MARK: - joinRoom

    var joinRoomUnderlyingCallsCount = 0
    var joinRoomCallsCount: Int {
        get {
            if Thread.isMainThread {
                return joinRoomUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = joinRoomUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                joinRoomUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    joinRoomUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var joinRoomCalled: Bool {
        return joinRoomCallsCount > 0
    }
    var joinRoomReceivedRoomID: String?
    var joinRoomReceivedInvocations: [String] = []

    var joinRoomUnderlyingReturnValue: Result<Void, ClientProxyError>!
    var joinRoomReturnValue: Result<Void, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return joinRoomUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = joinRoomUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                joinRoomUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    joinRoomUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var joinRoomClosure: ((String) async -> Result<Void, ClientProxyError>)?

    func joinRoom(_ roomID: String) async -> Result<Void, ClientProxyError> {
        joinRoomCallsCount += 1
        joinRoomReceivedRoomID = roomID
        joinRoomReceivedInvocations.append(roomID)
        if let joinRoomClosure = joinRoomClosure {
            return await joinRoomClosure(roomID)
        } else {
            return joinRoomReturnValue
        }
    }
    //MARK: - uploadMedia

    var uploadMediaUnderlyingCallsCount = 0
    var uploadMediaCallsCount: Int {
        get {
            if Thread.isMainThread {
                return uploadMediaUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = uploadMediaUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                uploadMediaUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    uploadMediaUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var uploadMediaCalled: Bool {
        return uploadMediaCallsCount > 0
    }
    var uploadMediaReceivedMedia: MediaInfo?
    var uploadMediaReceivedInvocations: [MediaInfo] = []

    var uploadMediaUnderlyingReturnValue: Result<String, ClientProxyError>!
    var uploadMediaReturnValue: Result<String, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return uploadMediaUnderlyingReturnValue
            } else {
                var returnValue: Result<String, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = uploadMediaUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                uploadMediaUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    uploadMediaUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var uploadMediaClosure: ((MediaInfo) async -> Result<String, ClientProxyError>)?

    func uploadMedia(_ media: MediaInfo) async -> Result<String, ClientProxyError> {
        uploadMediaCallsCount += 1
        uploadMediaReceivedMedia = media
        uploadMediaReceivedInvocations.append(media)
        if let uploadMediaClosure = uploadMediaClosure {
            return await uploadMediaClosure(media)
        } else {
            return uploadMediaReturnValue
        }
    }
    //MARK: - roomForIdentifier

    var roomForIdentifierUnderlyingCallsCount = 0
    var roomForIdentifierCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomForIdentifierUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomForIdentifierUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomForIdentifierUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomForIdentifierUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var roomForIdentifierCalled: Bool {
        return roomForIdentifierCallsCount > 0
    }
    var roomForIdentifierReceivedIdentifier: String?
    var roomForIdentifierReceivedInvocations: [String] = []

    var roomForIdentifierUnderlyingReturnValue: RoomProxyProtocol?
    var roomForIdentifierReturnValue: RoomProxyProtocol? {
        get {
            if Thread.isMainThread {
                return roomForIdentifierUnderlyingReturnValue
            } else {
                var returnValue: RoomProxyProtocol?? = nil
                DispatchQueue.main.sync {
                    returnValue = roomForIdentifierUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomForIdentifierUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomForIdentifierUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var roomForIdentifierClosure: ((String) async -> RoomProxyProtocol?)?

    func roomForIdentifier(_ identifier: String) async -> RoomProxyProtocol? {
        roomForIdentifierCallsCount += 1
        roomForIdentifierReceivedIdentifier = identifier
        roomForIdentifierReceivedInvocations.append(identifier)
        if let roomForIdentifierClosure = roomForIdentifierClosure {
            return await roomForIdentifierClosure(identifier)
        } else {
            return roomForIdentifierReturnValue
        }
    }
    //MARK: - roomPreviewForIdentifier

    var roomPreviewForIdentifierUnderlyingCallsCount = 0
    var roomPreviewForIdentifierCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomPreviewForIdentifierUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomPreviewForIdentifierUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomPreviewForIdentifierUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomPreviewForIdentifierUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var roomPreviewForIdentifierCalled: Bool {
        return roomPreviewForIdentifierCallsCount > 0
    }
    var roomPreviewForIdentifierReceivedIdentifier: String?
    var roomPreviewForIdentifierReceivedInvocations: [String] = []

    var roomPreviewForIdentifierUnderlyingReturnValue: Result<RoomPreviewDetails, ClientProxyError>!
    var roomPreviewForIdentifierReturnValue: Result<RoomPreviewDetails, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return roomPreviewForIdentifierUnderlyingReturnValue
            } else {
                var returnValue: Result<RoomPreviewDetails, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = roomPreviewForIdentifierUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomPreviewForIdentifierUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomPreviewForIdentifierUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var roomPreviewForIdentifierClosure: ((String) async -> Result<RoomPreviewDetails, ClientProxyError>)?

    func roomPreviewForIdentifier(_ identifier: String) async -> Result<RoomPreviewDetails, ClientProxyError> {
        roomPreviewForIdentifierCallsCount += 1
        roomPreviewForIdentifierReceivedIdentifier = identifier
        roomPreviewForIdentifierReceivedInvocations.append(identifier)
        if let roomPreviewForIdentifierClosure = roomPreviewForIdentifierClosure {
            return await roomPreviewForIdentifierClosure(identifier)
        } else {
            return roomPreviewForIdentifierReturnValue
        }
    }
    //MARK: - loadUserDisplayName

    var loadUserDisplayNameUnderlyingCallsCount = 0
    var loadUserDisplayNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadUserDisplayNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadUserDisplayNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadUserDisplayNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadUserDisplayNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var loadUserDisplayNameCalled: Bool {
        return loadUserDisplayNameCallsCount > 0
    }

    var loadUserDisplayNameUnderlyingReturnValue: Result<Void, ClientProxyError>!
    var loadUserDisplayNameReturnValue: Result<Void, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return loadUserDisplayNameUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = loadUserDisplayNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadUserDisplayNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    loadUserDisplayNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var loadUserDisplayNameClosure: (() async -> Result<Void, ClientProxyError>)?

    @discardableResult
    func loadUserDisplayName() async -> Result<Void, ClientProxyError> {
        loadUserDisplayNameCallsCount += 1
        if let loadUserDisplayNameClosure = loadUserDisplayNameClosure {
            return await loadUserDisplayNameClosure()
        } else {
            return loadUserDisplayNameReturnValue
        }
    }
    //MARK: - setUserDisplayName

    var setUserDisplayNameUnderlyingCallsCount = 0
    var setUserDisplayNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setUserDisplayNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setUserDisplayNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setUserDisplayNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setUserDisplayNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setUserDisplayNameCalled: Bool {
        return setUserDisplayNameCallsCount > 0
    }
    var setUserDisplayNameReceivedName: String?
    var setUserDisplayNameReceivedInvocations: [String] = []

    var setUserDisplayNameUnderlyingReturnValue: Result<Void, ClientProxyError>!
    var setUserDisplayNameReturnValue: Result<Void, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return setUserDisplayNameUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = setUserDisplayNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setUserDisplayNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    setUserDisplayNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var setUserDisplayNameClosure: ((String) async -> Result<Void, ClientProxyError>)?

    func setUserDisplayName(_ name: String) async -> Result<Void, ClientProxyError> {
        setUserDisplayNameCallsCount += 1
        setUserDisplayNameReceivedName = name
        setUserDisplayNameReceivedInvocations.append(name)
        if let setUserDisplayNameClosure = setUserDisplayNameClosure {
            return await setUserDisplayNameClosure(name)
        } else {
            return setUserDisplayNameReturnValue
        }
    }
    //MARK: - loadUserAvatarURL

    var loadUserAvatarURLUnderlyingCallsCount = 0
    var loadUserAvatarURLCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadUserAvatarURLUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadUserAvatarURLUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadUserAvatarURLUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadUserAvatarURLUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var loadUserAvatarURLCalled: Bool {
        return loadUserAvatarURLCallsCount > 0
    }

    var loadUserAvatarURLUnderlyingReturnValue: Result<Void, ClientProxyError>!
    var loadUserAvatarURLReturnValue: Result<Void, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return loadUserAvatarURLUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = loadUserAvatarURLUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadUserAvatarURLUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    loadUserAvatarURLUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var loadUserAvatarURLClosure: (() async -> Result<Void, ClientProxyError>)?

    @discardableResult
    func loadUserAvatarURL() async -> Result<Void, ClientProxyError> {
        loadUserAvatarURLCallsCount += 1
        if let loadUserAvatarURLClosure = loadUserAvatarURLClosure {
            return await loadUserAvatarURLClosure()
        } else {
            return loadUserAvatarURLReturnValue
        }
    }
    //MARK: - setUserAvatar

    var setUserAvatarMediaUnderlyingCallsCount = 0
    var setUserAvatarMediaCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setUserAvatarMediaUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setUserAvatarMediaUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setUserAvatarMediaUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setUserAvatarMediaUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setUserAvatarMediaCalled: Bool {
        return setUserAvatarMediaCallsCount > 0
    }
    var setUserAvatarMediaReceivedMedia: MediaInfo?
    var setUserAvatarMediaReceivedInvocations: [MediaInfo] = []

    var setUserAvatarMediaUnderlyingReturnValue: Result<Void, ClientProxyError>!
    var setUserAvatarMediaReturnValue: Result<Void, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return setUserAvatarMediaUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = setUserAvatarMediaUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setUserAvatarMediaUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    setUserAvatarMediaUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var setUserAvatarMediaClosure: ((MediaInfo) async -> Result<Void, ClientProxyError>)?

    func setUserAvatar(media: MediaInfo) async -> Result<Void, ClientProxyError> {
        setUserAvatarMediaCallsCount += 1
        setUserAvatarMediaReceivedMedia = media
        setUserAvatarMediaReceivedInvocations.append(media)
        if let setUserAvatarMediaClosure = setUserAvatarMediaClosure {
            return await setUserAvatarMediaClosure(media)
        } else {
            return setUserAvatarMediaReturnValue
        }
    }
    //MARK: - removeUserAvatar

    var removeUserAvatarUnderlyingCallsCount = 0
    var removeUserAvatarCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removeUserAvatarUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removeUserAvatarUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeUserAvatarUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removeUserAvatarUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var removeUserAvatarCalled: Bool {
        return removeUserAvatarCallsCount > 0
    }

    var removeUserAvatarUnderlyingReturnValue: Result<Void, ClientProxyError>!
    var removeUserAvatarReturnValue: Result<Void, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return removeUserAvatarUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = removeUserAvatarUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeUserAvatarUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    removeUserAvatarUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var removeUserAvatarClosure: (() async -> Result<Void, ClientProxyError>)?

    func removeUserAvatar() async -> Result<Void, ClientProxyError> {
        removeUserAvatarCallsCount += 1
        if let removeUserAvatarClosure = removeUserAvatarClosure {
            return await removeUserAvatarClosure()
        } else {
            return removeUserAvatarReturnValue
        }
    }
    //MARK: - sessionVerificationControllerProxy

    var sessionVerificationControllerProxyUnderlyingCallsCount = 0
    var sessionVerificationControllerProxyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sessionVerificationControllerProxyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionVerificationControllerProxyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionVerificationControllerProxyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionVerificationControllerProxyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sessionVerificationControllerProxyCalled: Bool {
        return sessionVerificationControllerProxyCallsCount > 0
    }

    var sessionVerificationControllerProxyUnderlyingReturnValue: Result<SessionVerificationControllerProxyProtocol, ClientProxyError>!
    var sessionVerificationControllerProxyReturnValue: Result<SessionVerificationControllerProxyProtocol, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return sessionVerificationControllerProxyUnderlyingReturnValue
            } else {
                var returnValue: Result<SessionVerificationControllerProxyProtocol, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sessionVerificationControllerProxyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sessionVerificationControllerProxyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sessionVerificationControllerProxyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sessionVerificationControllerProxyClosure: (() async -> Result<SessionVerificationControllerProxyProtocol, ClientProxyError>)?

    func sessionVerificationControllerProxy() async -> Result<SessionVerificationControllerProxyProtocol, ClientProxyError> {
        sessionVerificationControllerProxyCallsCount += 1
        if let sessionVerificationControllerProxyClosure = sessionVerificationControllerProxyClosure {
            return await sessionVerificationControllerProxyClosure()
        } else {
            return sessionVerificationControllerProxyReturnValue
        }
    }
    //MARK: - logout

    var logoutUnderlyingCallsCount = 0
    var logoutCallsCount: Int {
        get {
            if Thread.isMainThread {
                return logoutUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = logoutUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                logoutUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    logoutUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var logoutCalled: Bool {
        return logoutCallsCount > 0
    }

    var logoutUnderlyingReturnValue: URL?
    var logoutReturnValue: URL? {
        get {
            if Thread.isMainThread {
                return logoutUnderlyingReturnValue
            } else {
                var returnValue: URL?? = nil
                DispatchQueue.main.sync {
                    returnValue = logoutUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                logoutUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    logoutUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var logoutClosure: (() async -> URL?)?

    func logout() async -> URL? {
        logoutCallsCount += 1
        if let logoutClosure = logoutClosure {
            return await logoutClosure()
        } else {
            return logoutReturnValue
        }
    }
    //MARK: - setPusher

    var setPusherWithThrowableError: Error?
    var setPusherWithUnderlyingCallsCount = 0
    var setPusherWithCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setPusherWithUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setPusherWithUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setPusherWithUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setPusherWithUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setPusherWithCalled: Bool {
        return setPusherWithCallsCount > 0
    }
    var setPusherWithReceivedConfiguration: PusherConfiguration?
    var setPusherWithReceivedInvocations: [PusherConfiguration] = []
    var setPusherWithClosure: ((PusherConfiguration) async throws -> Void)?

    func setPusher(with configuration: PusherConfiguration) async throws {
        if let error = setPusherWithThrowableError {
            throw error
        }
        setPusherWithCallsCount += 1
        setPusherWithReceivedConfiguration = configuration
        setPusherWithReceivedInvocations.append(configuration)
        try await setPusherWithClosure?(configuration)
    }
    //MARK: - searchUsers

    var searchUsersSearchTermLimitUnderlyingCallsCount = 0
    var searchUsersSearchTermLimitCallsCount: Int {
        get {
            if Thread.isMainThread {
                return searchUsersSearchTermLimitUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = searchUsersSearchTermLimitUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                searchUsersSearchTermLimitUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    searchUsersSearchTermLimitUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var searchUsersSearchTermLimitCalled: Bool {
        return searchUsersSearchTermLimitCallsCount > 0
    }
    var searchUsersSearchTermLimitReceivedArguments: (searchTerm: String, limit: UInt)?
    var searchUsersSearchTermLimitReceivedInvocations: [(searchTerm: String, limit: UInt)] = []

    var searchUsersSearchTermLimitUnderlyingReturnValue: Result<SearchUsersResultsProxy, ClientProxyError>!
    var searchUsersSearchTermLimitReturnValue: Result<SearchUsersResultsProxy, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return searchUsersSearchTermLimitUnderlyingReturnValue
            } else {
                var returnValue: Result<SearchUsersResultsProxy, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = searchUsersSearchTermLimitUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                searchUsersSearchTermLimitUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    searchUsersSearchTermLimitUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var searchUsersSearchTermLimitClosure: ((String, UInt) async -> Result<SearchUsersResultsProxy, ClientProxyError>)?

    func searchUsers(searchTerm: String, limit: UInt) async -> Result<SearchUsersResultsProxy, ClientProxyError> {
        searchUsersSearchTermLimitCallsCount += 1
        searchUsersSearchTermLimitReceivedArguments = (searchTerm: searchTerm, limit: limit)
        searchUsersSearchTermLimitReceivedInvocations.append((searchTerm: searchTerm, limit: limit))
        if let searchUsersSearchTermLimitClosure = searchUsersSearchTermLimitClosure {
            return await searchUsersSearchTermLimitClosure(searchTerm, limit)
        } else {
            return searchUsersSearchTermLimitReturnValue
        }
    }
    //MARK: - profile

    var profileForUnderlyingCallsCount = 0
    var profileForCallsCount: Int {
        get {
            if Thread.isMainThread {
                return profileForUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = profileForUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                profileForUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    profileForUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var profileForCalled: Bool {
        return profileForCallsCount > 0
    }
    var profileForReceivedUserID: String?
    var profileForReceivedInvocations: [String] = []

    var profileForUnderlyingReturnValue: Result<UserProfileProxy, ClientProxyError>!
    var profileForReturnValue: Result<UserProfileProxy, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return profileForUnderlyingReturnValue
            } else {
                var returnValue: Result<UserProfileProxy, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = profileForUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                profileForUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    profileForUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var profileForClosure: ((String) async -> Result<UserProfileProxy, ClientProxyError>)?

    func profile(for userID: String) async -> Result<UserProfileProxy, ClientProxyError> {
        profileForCallsCount += 1
        profileForReceivedUserID = userID
        profileForReceivedInvocations.append(userID)
        if let profileForClosure = profileForClosure {
            return await profileForClosure(userID)
        } else {
            return profileForReturnValue
        }
    }
    //MARK: - roomDirectorySearchProxy

    var roomDirectorySearchProxyUnderlyingCallsCount = 0
    var roomDirectorySearchProxyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return roomDirectorySearchProxyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = roomDirectorySearchProxyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomDirectorySearchProxyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    roomDirectorySearchProxyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var roomDirectorySearchProxyCalled: Bool {
        return roomDirectorySearchProxyCallsCount > 0
    }

    var roomDirectorySearchProxyUnderlyingReturnValue: RoomDirectorySearchProxyProtocol!
    var roomDirectorySearchProxyReturnValue: RoomDirectorySearchProxyProtocol! {
        get {
            if Thread.isMainThread {
                return roomDirectorySearchProxyUnderlyingReturnValue
            } else {
                var returnValue: RoomDirectorySearchProxyProtocol? = nil
                DispatchQueue.main.sync {
                    returnValue = roomDirectorySearchProxyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                roomDirectorySearchProxyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    roomDirectorySearchProxyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var roomDirectorySearchProxyClosure: (() -> RoomDirectorySearchProxyProtocol)?

    func roomDirectorySearchProxy() -> RoomDirectorySearchProxyProtocol {
        roomDirectorySearchProxyCallsCount += 1
        if let roomDirectorySearchProxyClosure = roomDirectorySearchProxyClosure {
            return roomDirectorySearchProxyClosure()
        } else {
            return roomDirectorySearchProxyReturnValue
        }
    }
    //MARK: - resolveRoomAlias

    var resolveRoomAliasUnderlyingCallsCount = 0
    var resolveRoomAliasCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resolveRoomAliasUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resolveRoomAliasUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resolveRoomAliasUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resolveRoomAliasUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var resolveRoomAliasCalled: Bool {
        return resolveRoomAliasCallsCount > 0
    }
    var resolveRoomAliasReceivedAlias: String?
    var resolveRoomAliasReceivedInvocations: [String] = []

    var resolveRoomAliasUnderlyingReturnValue: String?
    var resolveRoomAliasReturnValue: String? {
        get {
            if Thread.isMainThread {
                return resolveRoomAliasUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = resolveRoomAliasUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resolveRoomAliasUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    resolveRoomAliasUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var resolveRoomAliasClosure: ((String) async -> String?)?

    func resolveRoomAlias(_ alias: String) async -> String? {
        resolveRoomAliasCallsCount += 1
        resolveRoomAliasReceivedAlias = alias
        resolveRoomAliasReceivedInvocations.append(alias)
        if let resolveRoomAliasClosure = resolveRoomAliasClosure {
            return await resolveRoomAliasClosure(alias)
        } else {
            return resolveRoomAliasReturnValue
        }
    }
    //MARK: - ignoreUser

    var ignoreUserUnderlyingCallsCount = 0
    var ignoreUserCallsCount: Int {
        get {
            if Thread.isMainThread {
                return ignoreUserUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = ignoreUserUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ignoreUserUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    ignoreUserUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var ignoreUserCalled: Bool {
        return ignoreUserCallsCount > 0
    }
    var ignoreUserReceivedUserID: String?
    var ignoreUserReceivedInvocations: [String] = []

    var ignoreUserUnderlyingReturnValue: Result<Void, ClientProxyError>!
    var ignoreUserReturnValue: Result<Void, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return ignoreUserUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = ignoreUserUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                ignoreUserUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    ignoreUserUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var ignoreUserClosure: ((String) async -> Result<Void, ClientProxyError>)?

    func ignoreUser(_ userID: String) async -> Result<Void, ClientProxyError> {
        ignoreUserCallsCount += 1
        ignoreUserReceivedUserID = userID
        ignoreUserReceivedInvocations.append(userID)
        if let ignoreUserClosure = ignoreUserClosure {
            return await ignoreUserClosure(userID)
        } else {
            return ignoreUserReturnValue
        }
    }
    //MARK: - unignoreUser

    var unignoreUserUnderlyingCallsCount = 0
    var unignoreUserCallsCount: Int {
        get {
            if Thread.isMainThread {
                return unignoreUserUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = unignoreUserUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unignoreUserUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    unignoreUserUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var unignoreUserCalled: Bool {
        return unignoreUserCallsCount > 0
    }
    var unignoreUserReceivedUserID: String?
    var unignoreUserReceivedInvocations: [String] = []

    var unignoreUserUnderlyingReturnValue: Result<Void, ClientProxyError>!
    var unignoreUserReturnValue: Result<Void, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return unignoreUserUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = unignoreUserUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unignoreUserUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    unignoreUserUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var unignoreUserClosure: ((String) async -> Result<Void, ClientProxyError>)?

    func unignoreUser(_ userID: String) async -> Result<Void, ClientProxyError> {
        unignoreUserCallsCount += 1
        unignoreUserReceivedUserID = userID
        unignoreUserReceivedInvocations.append(userID)
        if let unignoreUserClosure = unignoreUserClosure {
            return await unignoreUserClosure(userID)
        } else {
            return unignoreUserReturnValue
        }
    }
    //MARK: - trackRecentlyVisitedRoom

    var trackRecentlyVisitedRoomUnderlyingCallsCount = 0
    var trackRecentlyVisitedRoomCallsCount: Int {
        get {
            if Thread.isMainThread {
                return trackRecentlyVisitedRoomUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = trackRecentlyVisitedRoomUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                trackRecentlyVisitedRoomUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    trackRecentlyVisitedRoomUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var trackRecentlyVisitedRoomCalled: Bool {
        return trackRecentlyVisitedRoomCallsCount > 0
    }
    var trackRecentlyVisitedRoomReceivedRoomID: String?
    var trackRecentlyVisitedRoomReceivedInvocations: [String] = []

    var trackRecentlyVisitedRoomUnderlyingReturnValue: Result<Void, ClientProxyError>!
    var trackRecentlyVisitedRoomReturnValue: Result<Void, ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return trackRecentlyVisitedRoomUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = trackRecentlyVisitedRoomUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                trackRecentlyVisitedRoomUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    trackRecentlyVisitedRoomUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var trackRecentlyVisitedRoomClosure: ((String) async -> Result<Void, ClientProxyError>)?

    func trackRecentlyVisitedRoom(_ roomID: String) async -> Result<Void, ClientProxyError> {
        trackRecentlyVisitedRoomCallsCount += 1
        trackRecentlyVisitedRoomReceivedRoomID = roomID
        trackRecentlyVisitedRoomReceivedInvocations.append(roomID)
        if let trackRecentlyVisitedRoomClosure = trackRecentlyVisitedRoomClosure {
            return await trackRecentlyVisitedRoomClosure(roomID)
        } else {
            return trackRecentlyVisitedRoomReturnValue
        }
    }
    //MARK: - recentlyVisitedRooms

    var recentlyVisitedRoomsUnderlyingCallsCount = 0
    var recentlyVisitedRoomsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return recentlyVisitedRoomsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = recentlyVisitedRoomsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recentlyVisitedRoomsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    recentlyVisitedRoomsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var recentlyVisitedRoomsCalled: Bool {
        return recentlyVisitedRoomsCallsCount > 0
    }

    var recentlyVisitedRoomsUnderlyingReturnValue: Result<[String], ClientProxyError>!
    var recentlyVisitedRoomsReturnValue: Result<[String], ClientProxyError>! {
        get {
            if Thread.isMainThread {
                return recentlyVisitedRoomsUnderlyingReturnValue
            } else {
                var returnValue: Result<[String], ClientProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = recentlyVisitedRoomsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recentlyVisitedRoomsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    recentlyVisitedRoomsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var recentlyVisitedRoomsClosure: (() async -> Result<[String], ClientProxyError>)?

    func recentlyVisitedRooms() async -> Result<[String], ClientProxyError> {
        recentlyVisitedRoomsCallsCount += 1
        if let recentlyVisitedRoomsClosure = recentlyVisitedRoomsClosure {
            return await recentlyVisitedRoomsClosure()
        } else {
            return recentlyVisitedRoomsReturnValue
        }
    }
    //MARK: - recentConversationCounterparts

    var recentConversationCounterpartsUnderlyingCallsCount = 0
    var recentConversationCounterpartsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return recentConversationCounterpartsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = recentConversationCounterpartsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recentConversationCounterpartsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    recentConversationCounterpartsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var recentConversationCounterpartsCalled: Bool {
        return recentConversationCounterpartsCallsCount > 0
    }

    var recentConversationCounterpartsUnderlyingReturnValue: [UserProfileProxy]!
    var recentConversationCounterpartsReturnValue: [UserProfileProxy]! {
        get {
            if Thread.isMainThread {
                return recentConversationCounterpartsUnderlyingReturnValue
            } else {
                var returnValue: [UserProfileProxy]? = nil
                DispatchQueue.main.sync {
                    returnValue = recentConversationCounterpartsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                recentConversationCounterpartsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    recentConversationCounterpartsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var recentConversationCounterpartsClosure: (() async -> [UserProfileProxy])?

    func recentConversationCounterparts() async -> [UserProfileProxy] {
        recentConversationCounterpartsCallsCount += 1
        if let recentConversationCounterpartsClosure = recentConversationCounterpartsClosure {
            return await recentConversationCounterpartsClosure()
        } else {
            return recentConversationCounterpartsReturnValue
        }
    }
    //MARK: - loadMediaContentForSource

    var loadMediaContentForSourceThrowableError: Error?
    var loadMediaContentForSourceUnderlyingCallsCount = 0
    var loadMediaContentForSourceCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadMediaContentForSourceUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadMediaContentForSourceUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadMediaContentForSourceUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadMediaContentForSourceUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var loadMediaContentForSourceCalled: Bool {
        return loadMediaContentForSourceCallsCount > 0
    }
    var loadMediaContentForSourceReceivedSource: MediaSourceProxy?
    var loadMediaContentForSourceReceivedInvocations: [MediaSourceProxy] = []

    var loadMediaContentForSourceUnderlyingReturnValue: Data!
    var loadMediaContentForSourceReturnValue: Data! {
        get {
            if Thread.isMainThread {
                return loadMediaContentForSourceUnderlyingReturnValue
            } else {
                var returnValue: Data? = nil
                DispatchQueue.main.sync {
                    returnValue = loadMediaContentForSourceUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadMediaContentForSourceUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    loadMediaContentForSourceUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var loadMediaContentForSourceClosure: ((MediaSourceProxy) async throws -> Data)?

    func loadMediaContentForSource(_ source: MediaSourceProxy) async throws -> Data {
        if let error = loadMediaContentForSourceThrowableError {
            throw error
        }
        loadMediaContentForSourceCallsCount += 1
        loadMediaContentForSourceReceivedSource = source
        loadMediaContentForSourceReceivedInvocations.append(source)
        if let loadMediaContentForSourceClosure = loadMediaContentForSourceClosure {
            return try await loadMediaContentForSourceClosure(source)
        } else {
            return loadMediaContentForSourceReturnValue
        }
    }
    //MARK: - loadMediaThumbnailForSource

    var loadMediaThumbnailForSourceWidthHeightThrowableError: Error?
    var loadMediaThumbnailForSourceWidthHeightUnderlyingCallsCount = 0
    var loadMediaThumbnailForSourceWidthHeightCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadMediaThumbnailForSourceWidthHeightUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadMediaThumbnailForSourceWidthHeightUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadMediaThumbnailForSourceWidthHeightUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadMediaThumbnailForSourceWidthHeightUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var loadMediaThumbnailForSourceWidthHeightCalled: Bool {
        return loadMediaThumbnailForSourceWidthHeightCallsCount > 0
    }
    var loadMediaThumbnailForSourceWidthHeightReceivedArguments: (source: MediaSourceProxy, width: UInt, height: UInt)?
    var loadMediaThumbnailForSourceWidthHeightReceivedInvocations: [(source: MediaSourceProxy, width: UInt, height: UInt)] = []

    var loadMediaThumbnailForSourceWidthHeightUnderlyingReturnValue: Data!
    var loadMediaThumbnailForSourceWidthHeightReturnValue: Data! {
        get {
            if Thread.isMainThread {
                return loadMediaThumbnailForSourceWidthHeightUnderlyingReturnValue
            } else {
                var returnValue: Data? = nil
                DispatchQueue.main.sync {
                    returnValue = loadMediaThumbnailForSourceWidthHeightUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadMediaThumbnailForSourceWidthHeightUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    loadMediaThumbnailForSourceWidthHeightUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var loadMediaThumbnailForSourceWidthHeightClosure: ((MediaSourceProxy, UInt, UInt) async throws -> Data)?

    func loadMediaThumbnailForSource(_ source: MediaSourceProxy, width: UInt, height: UInt) async throws -> Data {
        if let error = loadMediaThumbnailForSourceWidthHeightThrowableError {
            throw error
        }
        loadMediaThumbnailForSourceWidthHeightCallsCount += 1
        loadMediaThumbnailForSourceWidthHeightReceivedArguments = (source: source, width: width, height: height)
        loadMediaThumbnailForSourceWidthHeightReceivedInvocations.append((source: source, width: width, height: height))
        if let loadMediaThumbnailForSourceWidthHeightClosure = loadMediaThumbnailForSourceWidthHeightClosure {
            return try await loadMediaThumbnailForSourceWidthHeightClosure(source, width, height)
        } else {
            return loadMediaThumbnailForSourceWidthHeightReturnValue
        }
    }
    //MARK: - loadMediaFileForSource

    var loadMediaFileForSourceBodyThrowableError: Error?
    var loadMediaFileForSourceBodyUnderlyingCallsCount = 0
    var loadMediaFileForSourceBodyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadMediaFileForSourceBodyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadMediaFileForSourceBodyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadMediaFileForSourceBodyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadMediaFileForSourceBodyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var loadMediaFileForSourceBodyCalled: Bool {
        return loadMediaFileForSourceBodyCallsCount > 0
    }
    var loadMediaFileForSourceBodyReceivedArguments: (source: MediaSourceProxy, body: String?)?
    var loadMediaFileForSourceBodyReceivedInvocations: [(source: MediaSourceProxy, body: String?)] = []

    var loadMediaFileForSourceBodyUnderlyingReturnValue: MediaFileHandleProxy!
    var loadMediaFileForSourceBodyReturnValue: MediaFileHandleProxy! {
        get {
            if Thread.isMainThread {
                return loadMediaFileForSourceBodyUnderlyingReturnValue
            } else {
                var returnValue: MediaFileHandleProxy? = nil
                DispatchQueue.main.sync {
                    returnValue = loadMediaFileForSourceBodyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadMediaFileForSourceBodyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    loadMediaFileForSourceBodyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var loadMediaFileForSourceBodyClosure: ((MediaSourceProxy, String?) async throws -> MediaFileHandleProxy)?

    func loadMediaFileForSource(_ source: MediaSourceProxy, body: String?) async throws -> MediaFileHandleProxy {
        if let error = loadMediaFileForSourceBodyThrowableError {
            throw error
        }
        loadMediaFileForSourceBodyCallsCount += 1
        loadMediaFileForSourceBodyReceivedArguments = (source: source, body: body)
        loadMediaFileForSourceBodyReceivedInvocations.append((source: source, body: body))
        if let loadMediaFileForSourceBodyClosure = loadMediaFileForSourceBodyClosure {
            return try await loadMediaFileForSourceBodyClosure(source, body)
        } else {
            return loadMediaFileForSourceBodyReturnValue
        }
    }
}
class CompletionSuggestionServiceMock: CompletionSuggestionServiceProtocol {
    var suggestionsPublisher: AnyPublisher<[SuggestionItem], Never> {
        get { return underlyingSuggestionsPublisher }
        set(value) { underlyingSuggestionsPublisher = value }
    }
    var underlyingSuggestionsPublisher: AnyPublisher<[SuggestionItem], Never>!

    //MARK: - setSuggestionTrigger

    var setSuggestionTriggerUnderlyingCallsCount = 0
    var setSuggestionTriggerCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setSuggestionTriggerUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setSuggestionTriggerUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setSuggestionTriggerUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setSuggestionTriggerUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setSuggestionTriggerCalled: Bool {
        return setSuggestionTriggerCallsCount > 0
    }
    var setSuggestionTriggerReceivedSuggestionTrigger: SuggestionPattern?
    var setSuggestionTriggerReceivedInvocations: [SuggestionPattern?] = []
    var setSuggestionTriggerClosure: ((SuggestionPattern?) -> Void)?

    func setSuggestionTrigger(_ suggestionTrigger: SuggestionPattern?) {
        setSuggestionTriggerCallsCount += 1
        setSuggestionTriggerReceivedSuggestionTrigger = suggestionTrigger
        setSuggestionTriggerReceivedInvocations.append(suggestionTrigger)
        setSuggestionTriggerClosure?(suggestionTrigger)
    }
}
class ElementCallWidgetDriverMock: ElementCallWidgetDriverProtocol {
    var messagePublisher: PassthroughSubject<String, Never> {
        get { return underlyingMessagePublisher }
        set(value) { underlyingMessagePublisher = value }
    }
    var underlyingMessagePublisher: PassthroughSubject<String, Never>!
    var actions: AnyPublisher<ElementCallWidgetDriverAction, Never> {
        get { return underlyingActions }
        set(value) { underlyingActions = value }
    }
    var underlyingActions: AnyPublisher<ElementCallWidgetDriverAction, Never>!

    //MARK: - start

    var startBaseURLClientIDUnderlyingCallsCount = 0
    var startBaseURLClientIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startBaseURLClientIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startBaseURLClientIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startBaseURLClientIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startBaseURLClientIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var startBaseURLClientIDCalled: Bool {
        return startBaseURLClientIDCallsCount > 0
    }
    var startBaseURLClientIDReceivedArguments: (baseURL: URL, clientID: String)?
    var startBaseURLClientIDReceivedInvocations: [(baseURL: URL, clientID: String)] = []

    var startBaseURLClientIDUnderlyingReturnValue: Result<URL, ElementCallWidgetDriverError>!
    var startBaseURLClientIDReturnValue: Result<URL, ElementCallWidgetDriverError>! {
        get {
            if Thread.isMainThread {
                return startBaseURLClientIDUnderlyingReturnValue
            } else {
                var returnValue: Result<URL, ElementCallWidgetDriverError>? = nil
                DispatchQueue.main.sync {
                    returnValue = startBaseURLClientIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startBaseURLClientIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    startBaseURLClientIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var startBaseURLClientIDClosure: ((URL, String) async -> Result<URL, ElementCallWidgetDriverError>)?

    func start(baseURL: URL, clientID: String) async -> Result<URL, ElementCallWidgetDriverError> {
        startBaseURLClientIDCallsCount += 1
        startBaseURLClientIDReceivedArguments = (baseURL: baseURL, clientID: clientID)
        startBaseURLClientIDReceivedInvocations.append((baseURL: baseURL, clientID: clientID))
        if let startBaseURLClientIDClosure = startBaseURLClientIDClosure {
            return await startBaseURLClientIDClosure(baseURL, clientID)
        } else {
            return startBaseURLClientIDReturnValue
        }
    }
    //MARK: - sendMessage

    var sendMessageUnderlyingCallsCount = 0
    var sendMessageCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendMessageUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendMessageUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendMessageUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendMessageUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendMessageCalled: Bool {
        return sendMessageCallsCount > 0
    }
    var sendMessageReceivedMessage: String?
    var sendMessageReceivedInvocations: [String] = []

    var sendMessageUnderlyingReturnValue: Result<Bool, ElementCallWidgetDriverError>!
    var sendMessageReturnValue: Result<Bool, ElementCallWidgetDriverError>! {
        get {
            if Thread.isMainThread {
                return sendMessageUnderlyingReturnValue
            } else {
                var returnValue: Result<Bool, ElementCallWidgetDriverError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendMessageUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendMessageUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendMessageUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendMessageClosure: ((String) async -> Result<Bool, ElementCallWidgetDriverError>)?

    func sendMessage(_ message: String) async -> Result<Bool, ElementCallWidgetDriverError> {
        sendMessageCallsCount += 1
        sendMessageReceivedMessage = message
        sendMessageReceivedInvocations.append(message)
        if let sendMessageClosure = sendMessageClosure {
            return await sendMessageClosure(message)
        } else {
            return sendMessageReturnValue
        }
    }
}
class KeychainControllerMock: KeychainControllerProtocol {

    //MARK: - setRestorationToken

    var setRestorationTokenForUsernameUnderlyingCallsCount = 0
    var setRestorationTokenForUsernameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setRestorationTokenForUsernameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setRestorationTokenForUsernameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setRestorationTokenForUsernameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setRestorationTokenForUsernameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setRestorationTokenForUsernameCalled: Bool {
        return setRestorationTokenForUsernameCallsCount > 0
    }
    var setRestorationTokenForUsernameReceivedArguments: (restorationToken: RestorationToken, forUsername: String)?
    var setRestorationTokenForUsernameReceivedInvocations: [(restorationToken: RestorationToken, forUsername: String)] = []
    var setRestorationTokenForUsernameClosure: ((RestorationToken, String) -> Void)?

    func setRestorationToken(_ restorationToken: RestorationToken, forUsername: String) {
        setRestorationTokenForUsernameCallsCount += 1
        setRestorationTokenForUsernameReceivedArguments = (restorationToken: restorationToken, forUsername: forUsername)
        setRestorationTokenForUsernameReceivedInvocations.append((restorationToken: restorationToken, forUsername: forUsername))
        setRestorationTokenForUsernameClosure?(restorationToken, forUsername)
    }
    //MARK: - restorationTokens

    var restorationTokensUnderlyingCallsCount = 0
    var restorationTokensCallsCount: Int {
        get {
            if Thread.isMainThread {
                return restorationTokensUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = restorationTokensUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                restorationTokensUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    restorationTokensUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var restorationTokensCalled: Bool {
        return restorationTokensCallsCount > 0
    }

    var restorationTokensUnderlyingReturnValue: [KeychainCredentials]!
    var restorationTokensReturnValue: [KeychainCredentials]! {
        get {
            if Thread.isMainThread {
                return restorationTokensUnderlyingReturnValue
            } else {
                var returnValue: [KeychainCredentials]? = nil
                DispatchQueue.main.sync {
                    returnValue = restorationTokensUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                restorationTokensUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    restorationTokensUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var restorationTokensClosure: (() -> [KeychainCredentials])?

    func restorationTokens() -> [KeychainCredentials] {
        restorationTokensCallsCount += 1
        if let restorationTokensClosure = restorationTokensClosure {
            return restorationTokensClosure()
        } else {
            return restorationTokensReturnValue
        }
    }
    //MARK: - removeRestorationTokenForUsername

    var removeRestorationTokenForUsernameUnderlyingCallsCount = 0
    var removeRestorationTokenForUsernameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removeRestorationTokenForUsernameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removeRestorationTokenForUsernameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeRestorationTokenForUsernameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removeRestorationTokenForUsernameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var removeRestorationTokenForUsernameCalled: Bool {
        return removeRestorationTokenForUsernameCallsCount > 0
    }
    var removeRestorationTokenForUsernameReceivedUsername: String?
    var removeRestorationTokenForUsernameReceivedInvocations: [String] = []
    var removeRestorationTokenForUsernameClosure: ((String) -> Void)?

    func removeRestorationTokenForUsername(_ username: String) {
        removeRestorationTokenForUsernameCallsCount += 1
        removeRestorationTokenForUsernameReceivedUsername = username
        removeRestorationTokenForUsernameReceivedInvocations.append(username)
        removeRestorationTokenForUsernameClosure?(username)
    }
    //MARK: - removeAllRestorationTokens

    var removeAllRestorationTokensUnderlyingCallsCount = 0
    var removeAllRestorationTokensCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removeAllRestorationTokensUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removeAllRestorationTokensUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeAllRestorationTokensUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removeAllRestorationTokensUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var removeAllRestorationTokensCalled: Bool {
        return removeAllRestorationTokensCallsCount > 0
    }
    var removeAllRestorationTokensClosure: (() -> Void)?

    func removeAllRestorationTokens() {
        removeAllRestorationTokensCallsCount += 1
        removeAllRestorationTokensClosure?()
    }
    //MARK: - containsPINCode

    var containsPINCodeThrowableError: Error?
    var containsPINCodeUnderlyingCallsCount = 0
    var containsPINCodeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return containsPINCodeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = containsPINCodeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                containsPINCodeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    containsPINCodeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var containsPINCodeCalled: Bool {
        return containsPINCodeCallsCount > 0
    }

    var containsPINCodeUnderlyingReturnValue: Bool!
    var containsPINCodeReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return containsPINCodeUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = containsPINCodeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                containsPINCodeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    containsPINCodeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var containsPINCodeClosure: (() throws -> Bool)?

    func containsPINCode() throws -> Bool {
        if let error = containsPINCodeThrowableError {
            throw error
        }
        containsPINCodeCallsCount += 1
        if let containsPINCodeClosure = containsPINCodeClosure {
            return try containsPINCodeClosure()
        } else {
            return containsPINCodeReturnValue
        }
    }
    //MARK: - setPINCode

    var setPINCodeThrowableError: Error?
    var setPINCodeUnderlyingCallsCount = 0
    var setPINCodeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setPINCodeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setPINCodeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setPINCodeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setPINCodeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setPINCodeCalled: Bool {
        return setPINCodeCallsCount > 0
    }
    var setPINCodeReceivedPinCode: String?
    var setPINCodeReceivedInvocations: [String] = []
    var setPINCodeClosure: ((String) throws -> Void)?

    func setPINCode(_ pinCode: String) throws {
        if let error = setPINCodeThrowableError {
            throw error
        }
        setPINCodeCallsCount += 1
        setPINCodeReceivedPinCode = pinCode
        setPINCodeReceivedInvocations.append(pinCode)
        try setPINCodeClosure?(pinCode)
    }
    //MARK: - pinCode

    var pinCodeUnderlyingCallsCount = 0
    var pinCodeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return pinCodeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = pinCodeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pinCodeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    pinCodeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var pinCodeCalled: Bool {
        return pinCodeCallsCount > 0
    }

    var pinCodeUnderlyingReturnValue: String?
    var pinCodeReturnValue: String? {
        get {
            if Thread.isMainThread {
                return pinCodeUnderlyingReturnValue
            } else {
                var returnValue: String?? = nil
                DispatchQueue.main.sync {
                    returnValue = pinCodeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pinCodeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    pinCodeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var pinCodeClosure: (() -> String?)?

    func pinCode() -> String? {
        pinCodeCallsCount += 1
        if let pinCodeClosure = pinCodeClosure {
            return pinCodeClosure()
        } else {
            return pinCodeReturnValue
        }
    }
    //MARK: - removePINCode

    var removePINCodeUnderlyingCallsCount = 0
    var removePINCodeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removePINCodeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removePINCodeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removePINCodeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removePINCodeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var removePINCodeCalled: Bool {
        return removePINCodeCallsCount > 0
    }
    var removePINCodeClosure: (() -> Void)?

    func removePINCode() {
        removePINCodeCallsCount += 1
        removePINCodeClosure?()
    }
    //MARK: - containsPINCodeBiometricState

    var containsPINCodeBiometricStateUnderlyingCallsCount = 0
    var containsPINCodeBiometricStateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return containsPINCodeBiometricStateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = containsPINCodeBiometricStateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                containsPINCodeBiometricStateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    containsPINCodeBiometricStateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var containsPINCodeBiometricStateCalled: Bool {
        return containsPINCodeBiometricStateCallsCount > 0
    }

    var containsPINCodeBiometricStateUnderlyingReturnValue: Bool!
    var containsPINCodeBiometricStateReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return containsPINCodeBiometricStateUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = containsPINCodeBiometricStateUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                containsPINCodeBiometricStateUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    containsPINCodeBiometricStateUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var containsPINCodeBiometricStateClosure: (() -> Bool)?

    func containsPINCodeBiometricState() -> Bool {
        containsPINCodeBiometricStateCallsCount += 1
        if let containsPINCodeBiometricStateClosure = containsPINCodeBiometricStateClosure {
            return containsPINCodeBiometricStateClosure()
        } else {
            return containsPINCodeBiometricStateReturnValue
        }
    }
    //MARK: - setPINCodeBiometricState

    var setPINCodeBiometricStateThrowableError: Error?
    var setPINCodeBiometricStateUnderlyingCallsCount = 0
    var setPINCodeBiometricStateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setPINCodeBiometricStateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setPINCodeBiometricStateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setPINCodeBiometricStateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setPINCodeBiometricStateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setPINCodeBiometricStateCalled: Bool {
        return setPINCodeBiometricStateCallsCount > 0
    }
    var setPINCodeBiometricStateReceivedState: Data?
    var setPINCodeBiometricStateReceivedInvocations: [Data] = []
    var setPINCodeBiometricStateClosure: ((Data) throws -> Void)?

    func setPINCodeBiometricState(_ state: Data) throws {
        if let error = setPINCodeBiometricStateThrowableError {
            throw error
        }
        setPINCodeBiometricStateCallsCount += 1
        setPINCodeBiometricStateReceivedState = state
        setPINCodeBiometricStateReceivedInvocations.append(state)
        try setPINCodeBiometricStateClosure?(state)
    }
    //MARK: - pinCodeBiometricState

    var pinCodeBiometricStateUnderlyingCallsCount = 0
    var pinCodeBiometricStateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return pinCodeBiometricStateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = pinCodeBiometricStateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pinCodeBiometricStateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    pinCodeBiometricStateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var pinCodeBiometricStateCalled: Bool {
        return pinCodeBiometricStateCallsCount > 0
    }

    var pinCodeBiometricStateUnderlyingReturnValue: Data?
    var pinCodeBiometricStateReturnValue: Data? {
        get {
            if Thread.isMainThread {
                return pinCodeBiometricStateUnderlyingReturnValue
            } else {
                var returnValue: Data?? = nil
                DispatchQueue.main.sync {
                    returnValue = pinCodeBiometricStateUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pinCodeBiometricStateUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    pinCodeBiometricStateUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var pinCodeBiometricStateClosure: (() -> Data?)?

    func pinCodeBiometricState() -> Data? {
        pinCodeBiometricStateCallsCount += 1
        if let pinCodeBiometricStateClosure = pinCodeBiometricStateClosure {
            return pinCodeBiometricStateClosure()
        } else {
            return pinCodeBiometricStateReturnValue
        }
    }
    //MARK: - removePINCodeBiometricState

    var removePINCodeBiometricStateUnderlyingCallsCount = 0
    var removePINCodeBiometricStateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removePINCodeBiometricStateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removePINCodeBiometricStateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removePINCodeBiometricStateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removePINCodeBiometricStateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var removePINCodeBiometricStateCalled: Bool {
        return removePINCodeBiometricStateCallsCount > 0
    }
    var removePINCodeBiometricStateClosure: (() -> Void)?

    func removePINCodeBiometricState() {
        removePINCodeBiometricStateCallsCount += 1
        removePINCodeBiometricStateClosure?()
    }
}
class MediaPlayerMock: MediaPlayerProtocol {
    var mediaSource: MediaSourceProxy?
    var duration: TimeInterval {
        get { return underlyingDuration }
        set(value) { underlyingDuration = value }
    }
    var underlyingDuration: TimeInterval!
    var currentTime: TimeInterval {
        get { return underlyingCurrentTime }
        set(value) { underlyingCurrentTime = value }
    }
    var underlyingCurrentTime: TimeInterval!
    var url: URL?
    var state: MediaPlayerState {
        get { return underlyingState }
        set(value) { underlyingState = value }
    }
    var underlyingState: MediaPlayerState!

    //MARK: - load

    var loadMediaSourceUsingAutoplayUnderlyingCallsCount = 0
    var loadMediaSourceUsingAutoplayCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadMediaSourceUsingAutoplayUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadMediaSourceUsingAutoplayUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadMediaSourceUsingAutoplayUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadMediaSourceUsingAutoplayUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var loadMediaSourceUsingAutoplayCalled: Bool {
        return loadMediaSourceUsingAutoplayCallsCount > 0
    }
    var loadMediaSourceUsingAutoplayReceivedArguments: (mediaSource: MediaSourceProxy, url: URL, autoplay: Bool)?
    var loadMediaSourceUsingAutoplayReceivedInvocations: [(mediaSource: MediaSourceProxy, url: URL, autoplay: Bool)] = []
    var loadMediaSourceUsingAutoplayClosure: ((MediaSourceProxy, URL, Bool) -> Void)?

    func load(mediaSource: MediaSourceProxy, using url: URL, autoplay: Bool) {
        loadMediaSourceUsingAutoplayCallsCount += 1
        loadMediaSourceUsingAutoplayReceivedArguments = (mediaSource: mediaSource, url: url, autoplay: autoplay)
        loadMediaSourceUsingAutoplayReceivedInvocations.append((mediaSource: mediaSource, url: url, autoplay: autoplay))
        loadMediaSourceUsingAutoplayClosure?(mediaSource, url, autoplay)
    }
    //MARK: - reset

    var resetUnderlyingCallsCount = 0
    var resetCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var resetCalled: Bool {
        return resetCallsCount > 0
    }
    var resetClosure: (() -> Void)?

    func reset() {
        resetCallsCount += 1
        resetClosure?()
    }
    //MARK: - play

    var playUnderlyingCallsCount = 0
    var playCallsCount: Int {
        get {
            if Thread.isMainThread {
                return playUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = playUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                playUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    playUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var playCalled: Bool {
        return playCallsCount > 0
    }
    var playClosure: (() -> Void)?

    func play() {
        playCallsCount += 1
        playClosure?()
    }
    //MARK: - pause

    var pauseUnderlyingCallsCount = 0
    var pauseCallsCount: Int {
        get {
            if Thread.isMainThread {
                return pauseUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = pauseUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pauseUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    pauseUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var pauseCalled: Bool {
        return pauseCallsCount > 0
    }
    var pauseClosure: (() -> Void)?

    func pause() {
        pauseCallsCount += 1
        pauseClosure?()
    }
    //MARK: - stop

    var stopUnderlyingCallsCount = 0
    var stopCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stopUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stopUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stopUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stopUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var stopCalled: Bool {
        return stopCallsCount > 0
    }
    var stopClosure: (() -> Void)?

    func stop() {
        stopCallsCount += 1
        stopClosure?()
    }
    //MARK: - seek

    var seekToUnderlyingCallsCount = 0
    var seekToCallsCount: Int {
        get {
            if Thread.isMainThread {
                return seekToUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = seekToUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                seekToUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    seekToUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var seekToCalled: Bool {
        return seekToCallsCount > 0
    }
    var seekToReceivedProgress: Double?
    var seekToReceivedInvocations: [Double] = []
    var seekToClosure: ((Double) async -> Void)?

    func seek(to progress: Double) async {
        seekToCallsCount += 1
        seekToReceivedProgress = progress
        seekToReceivedInvocations.append(progress)
        await seekToClosure?(progress)
    }
}
class MediaPlayerProviderMock: MediaPlayerProviderProtocol {

    //MARK: - player

    var playerForUnderlyingCallsCount = 0
    var playerForCallsCount: Int {
        get {
            if Thread.isMainThread {
                return playerForUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = playerForUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                playerForUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    playerForUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var playerForCalled: Bool {
        return playerForCallsCount > 0
    }
    var playerForReceivedMediaSource: MediaSourceProxy?
    var playerForReceivedInvocations: [MediaSourceProxy] = []

    var playerForUnderlyingReturnValue: Result<MediaPlayerProtocol, MediaPlayerProviderError>!
    var playerForReturnValue: Result<MediaPlayerProtocol, MediaPlayerProviderError>! {
        get {
            if Thread.isMainThread {
                return playerForUnderlyingReturnValue
            } else {
                var returnValue: Result<MediaPlayerProtocol, MediaPlayerProviderError>? = nil
                DispatchQueue.main.sync {
                    returnValue = playerForUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                playerForUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    playerForUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var playerForClosure: ((MediaSourceProxy) -> Result<MediaPlayerProtocol, MediaPlayerProviderError>)?

    func player(for mediaSource: MediaSourceProxy) -> Result<MediaPlayerProtocol, MediaPlayerProviderError> {
        playerForCallsCount += 1
        playerForReceivedMediaSource = mediaSource
        playerForReceivedInvocations.append(mediaSource)
        if let playerForClosure = playerForClosure {
            return playerForClosure(mediaSource)
        } else {
            return playerForReturnValue
        }
    }
    //MARK: - playerState

    var playerStateForUnderlyingCallsCount = 0
    var playerStateForCallsCount: Int {
        get {
            if Thread.isMainThread {
                return playerStateForUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = playerStateForUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                playerStateForUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    playerStateForUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var playerStateForCalled: Bool {
        return playerStateForCallsCount > 0
    }
    var playerStateForReceivedId: AudioPlayerStateIdentifier?
    var playerStateForReceivedInvocations: [AudioPlayerStateIdentifier] = []

    var playerStateForUnderlyingReturnValue: AudioPlayerState?
    var playerStateForReturnValue: AudioPlayerState? {
        get {
            if Thread.isMainThread {
                return playerStateForUnderlyingReturnValue
            } else {
                var returnValue: AudioPlayerState?? = nil
                DispatchQueue.main.sync {
                    returnValue = playerStateForUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                playerStateForUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    playerStateForUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var playerStateForClosure: ((AudioPlayerStateIdentifier) -> AudioPlayerState?)?

    func playerState(for id: AudioPlayerStateIdentifier) -> AudioPlayerState? {
        playerStateForCallsCount += 1
        playerStateForReceivedId = id
        playerStateForReceivedInvocations.append(id)
        if let playerStateForClosure = playerStateForClosure {
            return playerStateForClosure(id)
        } else {
            return playerStateForReturnValue
        }
    }
    //MARK: - register

    var registerAudioPlayerStateUnderlyingCallsCount = 0
    var registerAudioPlayerStateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return registerAudioPlayerStateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = registerAudioPlayerStateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                registerAudioPlayerStateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    registerAudioPlayerStateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var registerAudioPlayerStateCalled: Bool {
        return registerAudioPlayerStateCallsCount > 0
    }
    var registerAudioPlayerStateReceivedAudioPlayerState: AudioPlayerState?
    var registerAudioPlayerStateReceivedInvocations: [AudioPlayerState] = []
    var registerAudioPlayerStateClosure: ((AudioPlayerState) -> Void)?

    func register(audioPlayerState: AudioPlayerState) {
        registerAudioPlayerStateCallsCount += 1
        registerAudioPlayerStateReceivedAudioPlayerState = audioPlayerState
        registerAudioPlayerStateReceivedInvocations.append(audioPlayerState)
        registerAudioPlayerStateClosure?(audioPlayerState)
    }
    //MARK: - unregister

    var unregisterAudioPlayerStateUnderlyingCallsCount = 0
    var unregisterAudioPlayerStateCallsCount: Int {
        get {
            if Thread.isMainThread {
                return unregisterAudioPlayerStateUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = unregisterAudioPlayerStateUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unregisterAudioPlayerStateUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    unregisterAudioPlayerStateUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var unregisterAudioPlayerStateCalled: Bool {
        return unregisterAudioPlayerStateCallsCount > 0
    }
    var unregisterAudioPlayerStateReceivedAudioPlayerState: AudioPlayerState?
    var unregisterAudioPlayerStateReceivedInvocations: [AudioPlayerState] = []
    var unregisterAudioPlayerStateClosure: ((AudioPlayerState) -> Void)?

    func unregister(audioPlayerState: AudioPlayerState) {
        unregisterAudioPlayerStateCallsCount += 1
        unregisterAudioPlayerStateReceivedAudioPlayerState = audioPlayerState
        unregisterAudioPlayerStateReceivedInvocations.append(audioPlayerState)
        unregisterAudioPlayerStateClosure?(audioPlayerState)
    }
    //MARK: - detachAllStates

    var detachAllStatesExceptUnderlyingCallsCount = 0
    var detachAllStatesExceptCallsCount: Int {
        get {
            if Thread.isMainThread {
                return detachAllStatesExceptUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = detachAllStatesExceptUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                detachAllStatesExceptUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    detachAllStatesExceptUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var detachAllStatesExceptCalled: Bool {
        return detachAllStatesExceptCallsCount > 0
    }
    var detachAllStatesExceptReceivedException: AudioPlayerState?
    var detachAllStatesExceptReceivedInvocations: [AudioPlayerState?] = []
    var detachAllStatesExceptClosure: ((AudioPlayerState?) async -> Void)?

    func detachAllStates(except exception: AudioPlayerState?) async {
        detachAllStatesExceptCallsCount += 1
        detachAllStatesExceptReceivedException = exception
        detachAllStatesExceptReceivedInvocations.append(exception)
        await detachAllStatesExceptClosure?(exception)
    }
}
class NetworkMonitorMock: NetworkMonitorProtocol {
    var reachabilityPublisher: CurrentValuePublisher<NetworkMonitorReachability, Never> {
        get { return underlyingReachabilityPublisher }
        set(value) { underlyingReachabilityPublisher = value }
    }
    var underlyingReachabilityPublisher: CurrentValuePublisher<NetworkMonitorReachability, Never>!

}
class NotificationCenterMock: NotificationCenterProtocol {

    //MARK: - post

    var postNameObjectUnderlyingCallsCount = 0
    var postNameObjectCallsCount: Int {
        get {
            if Thread.isMainThread {
                return postNameObjectUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = postNameObjectUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                postNameObjectUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    postNameObjectUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var postNameObjectCalled: Bool {
        return postNameObjectCallsCount > 0
    }
    var postNameObjectReceivedArguments: (aName: NSNotification.Name, anObject: Any?)?
    var postNameObjectReceivedInvocations: [(aName: NSNotification.Name, anObject: Any?)] = []
    var postNameObjectClosure: ((NSNotification.Name, Any?) -> Void)?

    func post(name aName: NSNotification.Name, object anObject: Any?) {
        postNameObjectCallsCount += 1
        postNameObjectReceivedArguments = (aName: aName, anObject: anObject)
        postNameObjectReceivedInvocations.append((aName: aName, anObject: anObject))
        postNameObjectClosure?(aName, anObject)
    }
}
class NotificationManagerMock: NotificationManagerProtocol {
    weak var delegate: NotificationManagerDelegate?

    //MARK: - start

    var startUnderlyingCallsCount = 0
    var startCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var startCalled: Bool {
        return startCallsCount > 0
    }
    var startClosure: (() -> Void)?

    func start() {
        startCallsCount += 1
        startClosure?()
    }
    //MARK: - register

    var registerWithUnderlyingCallsCount = 0
    var registerWithCallsCount: Int {
        get {
            if Thread.isMainThread {
                return registerWithUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = registerWithUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                registerWithUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    registerWithUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var registerWithCalled: Bool {
        return registerWithCallsCount > 0
    }
    var registerWithReceivedDeviceToken: Data?
    var registerWithReceivedInvocations: [Data] = []

    var registerWithUnderlyingReturnValue: Bool!
    var registerWithReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return registerWithUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = registerWithUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                registerWithUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    registerWithUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var registerWithClosure: ((Data) async -> Bool)?

    func register(with deviceToken: Data) async -> Bool {
        registerWithCallsCount += 1
        registerWithReceivedDeviceToken = deviceToken
        registerWithReceivedInvocations.append(deviceToken)
        if let registerWithClosure = registerWithClosure {
            return await registerWithClosure(deviceToken)
        } else {
            return registerWithReturnValue
        }
    }
    //MARK: - registrationFailed

    var registrationFailedWithUnderlyingCallsCount = 0
    var registrationFailedWithCallsCount: Int {
        get {
            if Thread.isMainThread {
                return registrationFailedWithUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = registrationFailedWithUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                registrationFailedWithUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    registrationFailedWithUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var registrationFailedWithCalled: Bool {
        return registrationFailedWithCallsCount > 0
    }
    var registrationFailedWithReceivedError: Error?
    var registrationFailedWithReceivedInvocations: [Error] = []
    var registrationFailedWithClosure: ((Error) -> Void)?

    func registrationFailed(with error: Error) {
        registrationFailedWithCallsCount += 1
        registrationFailedWithReceivedError = error
        registrationFailedWithReceivedInvocations.append(error)
        registrationFailedWithClosure?(error)
    }
    //MARK: - showLocalNotification

    var showLocalNotificationWithSubtitleUnderlyingCallsCount = 0
    var showLocalNotificationWithSubtitleCallsCount: Int {
        get {
            if Thread.isMainThread {
                return showLocalNotificationWithSubtitleUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = showLocalNotificationWithSubtitleUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                showLocalNotificationWithSubtitleUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    showLocalNotificationWithSubtitleUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var showLocalNotificationWithSubtitleCalled: Bool {
        return showLocalNotificationWithSubtitleCallsCount > 0
    }
    var showLocalNotificationWithSubtitleReceivedArguments: (title: String, subtitle: String?)?
    var showLocalNotificationWithSubtitleReceivedInvocations: [(title: String, subtitle: String?)] = []
    var showLocalNotificationWithSubtitleClosure: ((String, String?) async -> Void)?

    func showLocalNotification(with title: String, subtitle: String?) async {
        showLocalNotificationWithSubtitleCallsCount += 1
        showLocalNotificationWithSubtitleReceivedArguments = (title: title, subtitle: subtitle)
        showLocalNotificationWithSubtitleReceivedInvocations.append((title: title, subtitle: subtitle))
        await showLocalNotificationWithSubtitleClosure?(title, subtitle)
    }
    //MARK: - setUserSession

    var setUserSessionUnderlyingCallsCount = 0
    var setUserSessionCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setUserSessionUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setUserSessionUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setUserSessionUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setUserSessionUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setUserSessionCalled: Bool {
        return setUserSessionCallsCount > 0
    }
    var setUserSessionReceivedUserSession: UserSessionProtocol?
    var setUserSessionReceivedInvocations: [UserSessionProtocol?] = []
    var setUserSessionClosure: ((UserSessionProtocol?) -> Void)?

    func setUserSession(_ userSession: UserSessionProtocol?) {
        setUserSessionCallsCount += 1
        setUserSessionReceivedUserSession = userSession
        setUserSessionReceivedInvocations.append(userSession)
        setUserSessionClosure?(userSession)
    }
    //MARK: - requestAuthorization

    var requestAuthorizationUnderlyingCallsCount = 0
    var requestAuthorizationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return requestAuthorizationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = requestAuthorizationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestAuthorizationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    requestAuthorizationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var requestAuthorizationCalled: Bool {
        return requestAuthorizationCallsCount > 0
    }
    var requestAuthorizationClosure: (() -> Void)?

    func requestAuthorization() {
        requestAuthorizationCallsCount += 1
        requestAuthorizationClosure?()
    }
    //MARK: - removeDeliveredMessageNotifications

    var removeDeliveredMessageNotificationsForUnderlyingCallsCount = 0
    var removeDeliveredMessageNotificationsForCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removeDeliveredMessageNotificationsForUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removeDeliveredMessageNotificationsForUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeDeliveredMessageNotificationsForUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removeDeliveredMessageNotificationsForUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var removeDeliveredMessageNotificationsForCalled: Bool {
        return removeDeliveredMessageNotificationsForCallsCount > 0
    }
    var removeDeliveredMessageNotificationsForReceivedRoomID: String?
    var removeDeliveredMessageNotificationsForReceivedInvocations: [String] = []
    var removeDeliveredMessageNotificationsForClosure: ((String) async -> Void)?

    func removeDeliveredMessageNotifications(for roomID: String) async {
        removeDeliveredMessageNotificationsForCallsCount += 1
        removeDeliveredMessageNotificationsForReceivedRoomID = roomID
        removeDeliveredMessageNotificationsForReceivedInvocations.append(roomID)
        await removeDeliveredMessageNotificationsForClosure?(roomID)
    }
    //MARK: - removeDeliveredInviteNotifications

    var removeDeliveredInviteNotificationsUnderlyingCallsCount = 0
    var removeDeliveredInviteNotificationsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removeDeliveredInviteNotificationsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removeDeliveredInviteNotificationsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeDeliveredInviteNotificationsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removeDeliveredInviteNotificationsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var removeDeliveredInviteNotificationsCalled: Bool {
        return removeDeliveredInviteNotificationsCallsCount > 0
    }
    var removeDeliveredInviteNotificationsClosure: (() async -> Void)?

    func removeDeliveredInviteNotifications() async {
        removeDeliveredInviteNotificationsCallsCount += 1
        await removeDeliveredInviteNotificationsClosure?()
    }
}
class NotificationSettingsProxyMock: NotificationSettingsProxyProtocol {
    var callbacks: PassthroughSubject<NotificationSettingsProxyCallback, Never> {
        get { return underlyingCallbacks }
        set(value) { underlyingCallbacks = value }
    }
    var underlyingCallbacks: PassthroughSubject<NotificationSettingsProxyCallback, Never>!

    //MARK: - getNotificationSettings

    var getNotificationSettingsRoomIdIsEncryptedIsOneToOneThrowableError: Error?
    var getNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = 0
    var getNotificationSettingsRoomIdIsEncryptedIsOneToOneCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var getNotificationSettingsRoomIdIsEncryptedIsOneToOneCalled: Bool {
        return getNotificationSettingsRoomIdIsEncryptedIsOneToOneCallsCount > 0
    }
    var getNotificationSettingsRoomIdIsEncryptedIsOneToOneReceivedArguments: (roomId: String, isEncrypted: Bool, isOneToOne: Bool)?
    var getNotificationSettingsRoomIdIsEncryptedIsOneToOneReceivedInvocations: [(roomId: String, isEncrypted: Bool, isOneToOne: Bool)] = []

    var getNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingReturnValue: RoomNotificationSettingsProxyProtocol!
    var getNotificationSettingsRoomIdIsEncryptedIsOneToOneReturnValue: RoomNotificationSettingsProxyProtocol! {
        get {
            if Thread.isMainThread {
                return getNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingReturnValue
            } else {
                var returnValue: RoomNotificationSettingsProxyProtocol? = nil
                DispatchQueue.main.sync {
                    returnValue = getNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getNotificationSettingsRoomIdIsEncryptedIsOneToOneUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var getNotificationSettingsRoomIdIsEncryptedIsOneToOneClosure: ((String, Bool, Bool) async throws -> RoomNotificationSettingsProxyProtocol)?

    func getNotificationSettings(roomId: String, isEncrypted: Bool, isOneToOne: Bool) async throws -> RoomNotificationSettingsProxyProtocol {
        if let error = getNotificationSettingsRoomIdIsEncryptedIsOneToOneThrowableError {
            throw error
        }
        getNotificationSettingsRoomIdIsEncryptedIsOneToOneCallsCount += 1
        getNotificationSettingsRoomIdIsEncryptedIsOneToOneReceivedArguments = (roomId: roomId, isEncrypted: isEncrypted, isOneToOne: isOneToOne)
        getNotificationSettingsRoomIdIsEncryptedIsOneToOneReceivedInvocations.append((roomId: roomId, isEncrypted: isEncrypted, isOneToOne: isOneToOne))
        if let getNotificationSettingsRoomIdIsEncryptedIsOneToOneClosure = getNotificationSettingsRoomIdIsEncryptedIsOneToOneClosure {
            return try await getNotificationSettingsRoomIdIsEncryptedIsOneToOneClosure(roomId, isEncrypted, isOneToOne)
        } else {
            return getNotificationSettingsRoomIdIsEncryptedIsOneToOneReturnValue
        }
    }
    //MARK: - setNotificationMode

    var setNotificationModeRoomIdModeThrowableError: Error?
    var setNotificationModeRoomIdModeUnderlyingCallsCount = 0
    var setNotificationModeRoomIdModeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setNotificationModeRoomIdModeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setNotificationModeRoomIdModeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setNotificationModeRoomIdModeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setNotificationModeRoomIdModeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setNotificationModeRoomIdModeCalled: Bool {
        return setNotificationModeRoomIdModeCallsCount > 0
    }
    var setNotificationModeRoomIdModeReceivedArguments: (roomId: String, mode: RoomNotificationModeProxy)?
    var setNotificationModeRoomIdModeReceivedInvocations: [(roomId: String, mode: RoomNotificationModeProxy)] = []
    var setNotificationModeRoomIdModeClosure: ((String, RoomNotificationModeProxy) async throws -> Void)?

    func setNotificationMode(roomId: String, mode: RoomNotificationModeProxy) async throws {
        if let error = setNotificationModeRoomIdModeThrowableError {
            throw error
        }
        setNotificationModeRoomIdModeCallsCount += 1
        setNotificationModeRoomIdModeReceivedArguments = (roomId: roomId, mode: mode)
        setNotificationModeRoomIdModeReceivedInvocations.append((roomId: roomId, mode: mode))
        try await setNotificationModeRoomIdModeClosure?(roomId, mode)
    }
    //MARK: - getUserDefinedRoomNotificationMode

    var getUserDefinedRoomNotificationModeRoomIdThrowableError: Error?
    var getUserDefinedRoomNotificationModeRoomIdUnderlyingCallsCount = 0
    var getUserDefinedRoomNotificationModeRoomIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getUserDefinedRoomNotificationModeRoomIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getUserDefinedRoomNotificationModeRoomIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getUserDefinedRoomNotificationModeRoomIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getUserDefinedRoomNotificationModeRoomIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var getUserDefinedRoomNotificationModeRoomIdCalled: Bool {
        return getUserDefinedRoomNotificationModeRoomIdCallsCount > 0
    }
    var getUserDefinedRoomNotificationModeRoomIdReceivedRoomId: String?
    var getUserDefinedRoomNotificationModeRoomIdReceivedInvocations: [String] = []

    var getUserDefinedRoomNotificationModeRoomIdUnderlyingReturnValue: RoomNotificationModeProxy?
    var getUserDefinedRoomNotificationModeRoomIdReturnValue: RoomNotificationModeProxy? {
        get {
            if Thread.isMainThread {
                return getUserDefinedRoomNotificationModeRoomIdUnderlyingReturnValue
            } else {
                var returnValue: RoomNotificationModeProxy?? = nil
                DispatchQueue.main.sync {
                    returnValue = getUserDefinedRoomNotificationModeRoomIdUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getUserDefinedRoomNotificationModeRoomIdUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getUserDefinedRoomNotificationModeRoomIdUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var getUserDefinedRoomNotificationModeRoomIdClosure: ((String) async throws -> RoomNotificationModeProxy?)?

    func getUserDefinedRoomNotificationMode(roomId: String) async throws -> RoomNotificationModeProxy? {
        if let error = getUserDefinedRoomNotificationModeRoomIdThrowableError {
            throw error
        }
        getUserDefinedRoomNotificationModeRoomIdCallsCount += 1
        getUserDefinedRoomNotificationModeRoomIdReceivedRoomId = roomId
        getUserDefinedRoomNotificationModeRoomIdReceivedInvocations.append(roomId)
        if let getUserDefinedRoomNotificationModeRoomIdClosure = getUserDefinedRoomNotificationModeRoomIdClosure {
            return try await getUserDefinedRoomNotificationModeRoomIdClosure(roomId)
        } else {
            return getUserDefinedRoomNotificationModeRoomIdReturnValue
        }
    }
    //MARK: - getDefaultRoomNotificationMode

    var getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingCallsCount = 0
    var getDefaultRoomNotificationModeIsEncryptedIsOneToOneCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var getDefaultRoomNotificationModeIsEncryptedIsOneToOneCalled: Bool {
        return getDefaultRoomNotificationModeIsEncryptedIsOneToOneCallsCount > 0
    }
    var getDefaultRoomNotificationModeIsEncryptedIsOneToOneReceivedArguments: (isEncrypted: Bool, isOneToOne: Bool)?
    var getDefaultRoomNotificationModeIsEncryptedIsOneToOneReceivedInvocations: [(isEncrypted: Bool, isOneToOne: Bool)] = []

    var getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingReturnValue: RoomNotificationModeProxy!
    var getDefaultRoomNotificationModeIsEncryptedIsOneToOneReturnValue: RoomNotificationModeProxy! {
        get {
            if Thread.isMainThread {
                return getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingReturnValue
            } else {
                var returnValue: RoomNotificationModeProxy? = nil
                DispatchQueue.main.sync {
                    returnValue = getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getDefaultRoomNotificationModeIsEncryptedIsOneToOneUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var getDefaultRoomNotificationModeIsEncryptedIsOneToOneClosure: ((Bool, Bool) async -> RoomNotificationModeProxy)?

    func getDefaultRoomNotificationMode(isEncrypted: Bool, isOneToOne: Bool) async -> RoomNotificationModeProxy {
        getDefaultRoomNotificationModeIsEncryptedIsOneToOneCallsCount += 1
        getDefaultRoomNotificationModeIsEncryptedIsOneToOneReceivedArguments = (isEncrypted: isEncrypted, isOneToOne: isOneToOne)
        getDefaultRoomNotificationModeIsEncryptedIsOneToOneReceivedInvocations.append((isEncrypted: isEncrypted, isOneToOne: isOneToOne))
        if let getDefaultRoomNotificationModeIsEncryptedIsOneToOneClosure = getDefaultRoomNotificationModeIsEncryptedIsOneToOneClosure {
            return await getDefaultRoomNotificationModeIsEncryptedIsOneToOneClosure(isEncrypted, isOneToOne)
        } else {
            return getDefaultRoomNotificationModeIsEncryptedIsOneToOneReturnValue
        }
    }
    //MARK: - setDefaultRoomNotificationMode

    var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeThrowableError: Error?
    var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeUnderlyingCallsCount = 0
    var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeCalled: Bool {
        return setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeCallsCount > 0
    }
    var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeReceivedArguments: (isEncrypted: Bool, isOneToOne: Bool, mode: RoomNotificationModeProxy)?
    var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeReceivedInvocations: [(isEncrypted: Bool, isOneToOne: Bool, mode: RoomNotificationModeProxy)] = []
    var setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeClosure: ((Bool, Bool, RoomNotificationModeProxy) async throws -> Void)?

    func setDefaultRoomNotificationMode(isEncrypted: Bool, isOneToOne: Bool, mode: RoomNotificationModeProxy) async throws {
        if let error = setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeThrowableError {
            throw error
        }
        setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeCallsCount += 1
        setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeReceivedArguments = (isEncrypted: isEncrypted, isOneToOne: isOneToOne, mode: mode)
        setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeReceivedInvocations.append((isEncrypted: isEncrypted, isOneToOne: isOneToOne, mode: mode))
        try await setDefaultRoomNotificationModeIsEncryptedIsOneToOneModeClosure?(isEncrypted, isOneToOne, mode)
    }
    //MARK: - restoreDefaultNotificationMode

    var restoreDefaultNotificationModeRoomIdThrowableError: Error?
    var restoreDefaultNotificationModeRoomIdUnderlyingCallsCount = 0
    var restoreDefaultNotificationModeRoomIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return restoreDefaultNotificationModeRoomIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = restoreDefaultNotificationModeRoomIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                restoreDefaultNotificationModeRoomIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    restoreDefaultNotificationModeRoomIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var restoreDefaultNotificationModeRoomIdCalled: Bool {
        return restoreDefaultNotificationModeRoomIdCallsCount > 0
    }
    var restoreDefaultNotificationModeRoomIdReceivedRoomId: String?
    var restoreDefaultNotificationModeRoomIdReceivedInvocations: [String] = []
    var restoreDefaultNotificationModeRoomIdClosure: ((String) async throws -> Void)?

    func restoreDefaultNotificationMode(roomId: String) async throws {
        if let error = restoreDefaultNotificationModeRoomIdThrowableError {
            throw error
        }
        restoreDefaultNotificationModeRoomIdCallsCount += 1
        restoreDefaultNotificationModeRoomIdReceivedRoomId = roomId
        restoreDefaultNotificationModeRoomIdReceivedInvocations.append(roomId)
        try await restoreDefaultNotificationModeRoomIdClosure?(roomId)
    }
    //MARK: - unmuteRoom

    var unmuteRoomRoomIdIsEncryptedIsOneToOneThrowableError: Error?
    var unmuteRoomRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = 0
    var unmuteRoomRoomIdIsEncryptedIsOneToOneCallsCount: Int {
        get {
            if Thread.isMainThread {
                return unmuteRoomRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = unmuteRoomRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unmuteRoomRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    unmuteRoomRoomIdIsEncryptedIsOneToOneUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var unmuteRoomRoomIdIsEncryptedIsOneToOneCalled: Bool {
        return unmuteRoomRoomIdIsEncryptedIsOneToOneCallsCount > 0
    }
    var unmuteRoomRoomIdIsEncryptedIsOneToOneReceivedArguments: (roomId: String, isEncrypted: Bool, isOneToOne: Bool)?
    var unmuteRoomRoomIdIsEncryptedIsOneToOneReceivedInvocations: [(roomId: String, isEncrypted: Bool, isOneToOne: Bool)] = []
    var unmuteRoomRoomIdIsEncryptedIsOneToOneClosure: ((String, Bool, Bool) async throws -> Void)?

    func unmuteRoom(roomId: String, isEncrypted: Bool, isOneToOne: Bool) async throws {
        if let error = unmuteRoomRoomIdIsEncryptedIsOneToOneThrowableError {
            throw error
        }
        unmuteRoomRoomIdIsEncryptedIsOneToOneCallsCount += 1
        unmuteRoomRoomIdIsEncryptedIsOneToOneReceivedArguments = (roomId: roomId, isEncrypted: isEncrypted, isOneToOne: isOneToOne)
        unmuteRoomRoomIdIsEncryptedIsOneToOneReceivedInvocations.append((roomId: roomId, isEncrypted: isEncrypted, isOneToOne: isOneToOne))
        try await unmuteRoomRoomIdIsEncryptedIsOneToOneClosure?(roomId, isEncrypted, isOneToOne)
    }
    //MARK: - isRoomMentionEnabled

    var isRoomMentionEnabledThrowableError: Error?
    var isRoomMentionEnabledUnderlyingCallsCount = 0
    var isRoomMentionEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isRoomMentionEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isRoomMentionEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isRoomMentionEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isRoomMentionEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var isRoomMentionEnabledCalled: Bool {
        return isRoomMentionEnabledCallsCount > 0
    }

    var isRoomMentionEnabledUnderlyingReturnValue: Bool!
    var isRoomMentionEnabledReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isRoomMentionEnabledUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isRoomMentionEnabledUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isRoomMentionEnabledUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isRoomMentionEnabledUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var isRoomMentionEnabledClosure: (() async throws -> Bool)?

    func isRoomMentionEnabled() async throws -> Bool {
        if let error = isRoomMentionEnabledThrowableError {
            throw error
        }
        isRoomMentionEnabledCallsCount += 1
        if let isRoomMentionEnabledClosure = isRoomMentionEnabledClosure {
            return try await isRoomMentionEnabledClosure()
        } else {
            return isRoomMentionEnabledReturnValue
        }
    }
    //MARK: - setRoomMentionEnabled

    var setRoomMentionEnabledEnabledThrowableError: Error?
    var setRoomMentionEnabledEnabledUnderlyingCallsCount = 0
    var setRoomMentionEnabledEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setRoomMentionEnabledEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setRoomMentionEnabledEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setRoomMentionEnabledEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setRoomMentionEnabledEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setRoomMentionEnabledEnabledCalled: Bool {
        return setRoomMentionEnabledEnabledCallsCount > 0
    }
    var setRoomMentionEnabledEnabledReceivedEnabled: Bool?
    var setRoomMentionEnabledEnabledReceivedInvocations: [Bool] = []
    var setRoomMentionEnabledEnabledClosure: ((Bool) async throws -> Void)?

    func setRoomMentionEnabled(enabled: Bool) async throws {
        if let error = setRoomMentionEnabledEnabledThrowableError {
            throw error
        }
        setRoomMentionEnabledEnabledCallsCount += 1
        setRoomMentionEnabledEnabledReceivedEnabled = enabled
        setRoomMentionEnabledEnabledReceivedInvocations.append(enabled)
        try await setRoomMentionEnabledEnabledClosure?(enabled)
    }
    //MARK: - isCallEnabled

    var isCallEnabledThrowableError: Error?
    var isCallEnabledUnderlyingCallsCount = 0
    var isCallEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isCallEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isCallEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isCallEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isCallEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var isCallEnabledCalled: Bool {
        return isCallEnabledCallsCount > 0
    }

    var isCallEnabledUnderlyingReturnValue: Bool!
    var isCallEnabledReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isCallEnabledUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isCallEnabledUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isCallEnabledUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isCallEnabledUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var isCallEnabledClosure: (() async throws -> Bool)?

    func isCallEnabled() async throws -> Bool {
        if let error = isCallEnabledThrowableError {
            throw error
        }
        isCallEnabledCallsCount += 1
        if let isCallEnabledClosure = isCallEnabledClosure {
            return try await isCallEnabledClosure()
        } else {
            return isCallEnabledReturnValue
        }
    }
    //MARK: - setCallEnabled

    var setCallEnabledEnabledThrowableError: Error?
    var setCallEnabledEnabledUnderlyingCallsCount = 0
    var setCallEnabledEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setCallEnabledEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setCallEnabledEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setCallEnabledEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setCallEnabledEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setCallEnabledEnabledCalled: Bool {
        return setCallEnabledEnabledCallsCount > 0
    }
    var setCallEnabledEnabledReceivedEnabled: Bool?
    var setCallEnabledEnabledReceivedInvocations: [Bool] = []
    var setCallEnabledEnabledClosure: ((Bool) async throws -> Void)?

    func setCallEnabled(enabled: Bool) async throws {
        if let error = setCallEnabledEnabledThrowableError {
            throw error
        }
        setCallEnabledEnabledCallsCount += 1
        setCallEnabledEnabledReceivedEnabled = enabled
        setCallEnabledEnabledReceivedInvocations.append(enabled)
        try await setCallEnabledEnabledClosure?(enabled)
    }
    //MARK: - isInviteForMeEnabled

    var isInviteForMeEnabledThrowableError: Error?
    var isInviteForMeEnabledUnderlyingCallsCount = 0
    var isInviteForMeEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isInviteForMeEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isInviteForMeEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isInviteForMeEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isInviteForMeEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var isInviteForMeEnabledCalled: Bool {
        return isInviteForMeEnabledCallsCount > 0
    }

    var isInviteForMeEnabledUnderlyingReturnValue: Bool!
    var isInviteForMeEnabledReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return isInviteForMeEnabledUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = isInviteForMeEnabledUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isInviteForMeEnabledUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isInviteForMeEnabledUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var isInviteForMeEnabledClosure: (() async throws -> Bool)?

    func isInviteForMeEnabled() async throws -> Bool {
        if let error = isInviteForMeEnabledThrowableError {
            throw error
        }
        isInviteForMeEnabledCallsCount += 1
        if let isInviteForMeEnabledClosure = isInviteForMeEnabledClosure {
            return try await isInviteForMeEnabledClosure()
        } else {
            return isInviteForMeEnabledReturnValue
        }
    }
    //MARK: - setInviteForMeEnabled

    var setInviteForMeEnabledEnabledThrowableError: Error?
    var setInviteForMeEnabledEnabledUnderlyingCallsCount = 0
    var setInviteForMeEnabledEnabledCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setInviteForMeEnabledEnabledUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setInviteForMeEnabledEnabledUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setInviteForMeEnabledEnabledUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setInviteForMeEnabledEnabledUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setInviteForMeEnabledEnabledCalled: Bool {
        return setInviteForMeEnabledEnabledCallsCount > 0
    }
    var setInviteForMeEnabledEnabledReceivedEnabled: Bool?
    var setInviteForMeEnabledEnabledReceivedInvocations: [Bool] = []
    var setInviteForMeEnabledEnabledClosure: ((Bool) async throws -> Void)?

    func setInviteForMeEnabled(enabled: Bool) async throws {
        if let error = setInviteForMeEnabledEnabledThrowableError {
            throw error
        }
        setInviteForMeEnabledEnabledCallsCount += 1
        setInviteForMeEnabledEnabledReceivedEnabled = enabled
        setInviteForMeEnabledEnabledReceivedInvocations.append(enabled)
        try await setInviteForMeEnabledEnabledClosure?(enabled)
    }
    //MARK: - getRoomsWithUserDefinedRules

    var getRoomsWithUserDefinedRulesThrowableError: Error?
    var getRoomsWithUserDefinedRulesUnderlyingCallsCount = 0
    var getRoomsWithUserDefinedRulesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getRoomsWithUserDefinedRulesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomsWithUserDefinedRulesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomsWithUserDefinedRulesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomsWithUserDefinedRulesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var getRoomsWithUserDefinedRulesCalled: Bool {
        return getRoomsWithUserDefinedRulesCallsCount > 0
    }

    var getRoomsWithUserDefinedRulesUnderlyingReturnValue: [String]!
    var getRoomsWithUserDefinedRulesReturnValue: [String]! {
        get {
            if Thread.isMainThread {
                return getRoomsWithUserDefinedRulesUnderlyingReturnValue
            } else {
                var returnValue: [String]? = nil
                DispatchQueue.main.sync {
                    returnValue = getRoomsWithUserDefinedRulesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getRoomsWithUserDefinedRulesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getRoomsWithUserDefinedRulesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var getRoomsWithUserDefinedRulesClosure: (() async throws -> [String])?

    func getRoomsWithUserDefinedRules() async throws -> [String] {
        if let error = getRoomsWithUserDefinedRulesThrowableError {
            throw error
        }
        getRoomsWithUserDefinedRulesCallsCount += 1
        if let getRoomsWithUserDefinedRulesClosure = getRoomsWithUserDefinedRulesClosure {
            return try await getRoomsWithUserDefinedRulesClosure()
        } else {
            return getRoomsWithUserDefinedRulesReturnValue
        }
    }
    //MARK: - canPushEncryptedEventsToDevice

    var canPushEncryptedEventsToDeviceUnderlyingCallsCount = 0
    var canPushEncryptedEventsToDeviceCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canPushEncryptedEventsToDeviceUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canPushEncryptedEventsToDeviceUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canPushEncryptedEventsToDeviceUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canPushEncryptedEventsToDeviceUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var canPushEncryptedEventsToDeviceCalled: Bool {
        return canPushEncryptedEventsToDeviceCallsCount > 0
    }

    var canPushEncryptedEventsToDeviceUnderlyingReturnValue: Bool!
    var canPushEncryptedEventsToDeviceReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return canPushEncryptedEventsToDeviceUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = canPushEncryptedEventsToDeviceUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canPushEncryptedEventsToDeviceUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canPushEncryptedEventsToDeviceUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var canPushEncryptedEventsToDeviceClosure: (() async -> Bool)?

    func canPushEncryptedEventsToDevice() async -> Bool {
        canPushEncryptedEventsToDeviceCallsCount += 1
        if let canPushEncryptedEventsToDeviceClosure = canPushEncryptedEventsToDeviceClosure {
            return await canPushEncryptedEventsToDeviceClosure()
        } else {
            return canPushEncryptedEventsToDeviceReturnValue
        }
    }
}
class OrientationManagerMock: OrientationManagerProtocol {

    //MARK: - setOrientation

    var setOrientationUnderlyingCallsCount = 0
    var setOrientationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setOrientationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setOrientationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setOrientationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setOrientationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setOrientationCalled: Bool {
        return setOrientationCallsCount > 0
    }
    var setOrientationReceivedOrientation: UIInterfaceOrientationMask?
    var setOrientationReceivedInvocations: [UIInterfaceOrientationMask] = []
    var setOrientationClosure: ((UIInterfaceOrientationMask) -> Void)?

    func setOrientation(_ orientation: UIInterfaceOrientationMask) {
        setOrientationCallsCount += 1
        setOrientationReceivedOrientation = orientation
        setOrientationReceivedInvocations.append(orientation)
        setOrientationClosure?(orientation)
    }
    //MARK: - lockOrientation

    var lockOrientationUnderlyingCallsCount = 0
    var lockOrientationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return lockOrientationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = lockOrientationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                lockOrientationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    lockOrientationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var lockOrientationCalled: Bool {
        return lockOrientationCallsCount > 0
    }
    var lockOrientationReceivedOrientation: UIInterfaceOrientationMask?
    var lockOrientationReceivedInvocations: [UIInterfaceOrientationMask] = []
    var lockOrientationClosure: ((UIInterfaceOrientationMask) -> Void)?

    func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        lockOrientationCallsCount += 1
        lockOrientationReceivedOrientation = orientation
        lockOrientationReceivedInvocations.append(orientation)
        lockOrientationClosure?(orientation)
    }
}
class PollInteractionHandlerMock: PollInteractionHandlerProtocol {

    //MARK: - sendPollResponse

    var sendPollResponsePollStartIDOptionIDUnderlyingCallsCount = 0
    var sendPollResponsePollStartIDOptionIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendPollResponsePollStartIDOptionIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendPollResponsePollStartIDOptionIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendPollResponsePollStartIDOptionIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendPollResponsePollStartIDOptionIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendPollResponsePollStartIDOptionIDCalled: Bool {
        return sendPollResponsePollStartIDOptionIDCallsCount > 0
    }
    var sendPollResponsePollStartIDOptionIDReceivedArguments: (pollStartID: String, optionID: String)?
    var sendPollResponsePollStartIDOptionIDReceivedInvocations: [(pollStartID: String, optionID: String)] = []

    var sendPollResponsePollStartIDOptionIDUnderlyingReturnValue: Result<Void, Error>!
    var sendPollResponsePollStartIDOptionIDReturnValue: Result<Void, Error>! {
        get {
            if Thread.isMainThread {
                return sendPollResponsePollStartIDOptionIDUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, Error>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendPollResponsePollStartIDOptionIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendPollResponsePollStartIDOptionIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendPollResponsePollStartIDOptionIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendPollResponsePollStartIDOptionIDClosure: ((String, String) async -> Result<Void, Error>)?

    func sendPollResponse(pollStartID: String, optionID: String) async -> Result<Void, Error> {
        sendPollResponsePollStartIDOptionIDCallsCount += 1
        sendPollResponsePollStartIDOptionIDReceivedArguments = (pollStartID: pollStartID, optionID: optionID)
        sendPollResponsePollStartIDOptionIDReceivedInvocations.append((pollStartID: pollStartID, optionID: optionID))
        if let sendPollResponsePollStartIDOptionIDClosure = sendPollResponsePollStartIDOptionIDClosure {
            return await sendPollResponsePollStartIDOptionIDClosure(pollStartID, optionID)
        } else {
            return sendPollResponsePollStartIDOptionIDReturnValue
        }
    }
    //MARK: - endPoll

    var endPollPollStartIDUnderlyingCallsCount = 0
    var endPollPollStartIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return endPollPollStartIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = endPollPollStartIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                endPollPollStartIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    endPollPollStartIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var endPollPollStartIDCalled: Bool {
        return endPollPollStartIDCallsCount > 0
    }
    var endPollPollStartIDReceivedPollStartID: String?
    var endPollPollStartIDReceivedInvocations: [String] = []

    var endPollPollStartIDUnderlyingReturnValue: Result<Void, Error>!
    var endPollPollStartIDReturnValue: Result<Void, Error>! {
        get {
            if Thread.isMainThread {
                return endPollPollStartIDUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, Error>? = nil
                DispatchQueue.main.sync {
                    returnValue = endPollPollStartIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                endPollPollStartIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    endPollPollStartIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var endPollPollStartIDClosure: ((String) async -> Result<Void, Error>)?

    func endPoll(pollStartID: String) async -> Result<Void, Error> {
        endPollPollStartIDCallsCount += 1
        endPollPollStartIDReceivedPollStartID = pollStartID
        endPollPollStartIDReceivedInvocations.append(pollStartID)
        if let endPollPollStartIDClosure = endPollPollStartIDClosure {
            return await endPollPollStartIDClosure(pollStartID)
        } else {
            return endPollPollStartIDReturnValue
        }
    }
}
class QRCodeLoginServiceMock: QRCodeLoginServiceProtocol {

    //MARK: - requestAuthorizationIfNeeded

    var requestAuthorizationIfNeededUnderlyingCallsCount = 0
    var requestAuthorizationIfNeededCallsCount: Int {
        get {
            if Thread.isMainThread {
                return requestAuthorizationIfNeededUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = requestAuthorizationIfNeededUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestAuthorizationIfNeededUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    requestAuthorizationIfNeededUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var requestAuthorizationIfNeededCalled: Bool {
        return requestAuthorizationIfNeededCallsCount > 0
    }

    var requestAuthorizationIfNeededUnderlyingReturnValue: Bool!
    var requestAuthorizationIfNeededReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return requestAuthorizationIfNeededUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = requestAuthorizationIfNeededUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestAuthorizationIfNeededUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    requestAuthorizationIfNeededUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var requestAuthorizationIfNeededClosure: (() async -> Bool)?

    func requestAuthorizationIfNeeded() async -> Bool {
        requestAuthorizationIfNeededCallsCount += 1
        if let requestAuthorizationIfNeededClosure = requestAuthorizationIfNeededClosure {
            return await requestAuthorizationIfNeededClosure()
        } else {
            return requestAuthorizationIfNeededReturnValue
        }
    }
}
class RoomDirectorySearchProxyMock: RoomDirectorySearchProxyProtocol {
    var resultsPublisher: CurrentValuePublisher<[RoomDirectorySearchResult], Never> {
        get { return underlyingResultsPublisher }
        set(value) { underlyingResultsPublisher = value }
    }
    var underlyingResultsPublisher: CurrentValuePublisher<[RoomDirectorySearchResult], Never>!

    //MARK: - search

    var searchQueryUnderlyingCallsCount = 0
    var searchQueryCallsCount: Int {
        get {
            if Thread.isMainThread {
                return searchQueryUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = searchQueryUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                searchQueryUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    searchQueryUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var searchQueryCalled: Bool {
        return searchQueryCallsCount > 0
    }
    var searchQueryReceivedQuery: String?
    var searchQueryReceivedInvocations: [String?] = []

    var searchQueryUnderlyingReturnValue: Result<Void, RoomDirectorySearchError>!
    var searchQueryReturnValue: Result<Void, RoomDirectorySearchError>! {
        get {
            if Thread.isMainThread {
                return searchQueryUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomDirectorySearchError>? = nil
                DispatchQueue.main.sync {
                    returnValue = searchQueryUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                searchQueryUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    searchQueryUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var searchQueryClosure: ((String?) async -> Result<Void, RoomDirectorySearchError>)?

    func search(query: String?) async -> Result<Void, RoomDirectorySearchError> {
        searchQueryCallsCount += 1
        searchQueryReceivedQuery = query
        searchQueryReceivedInvocations.append(query)
        if let searchQueryClosure = searchQueryClosure {
            return await searchQueryClosure(query)
        } else {
            return searchQueryReturnValue
        }
    }
    //MARK: - nextPage

    var nextPageUnderlyingCallsCount = 0
    var nextPageCallsCount: Int {
        get {
            if Thread.isMainThread {
                return nextPageUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = nextPageUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                nextPageUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    nextPageUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var nextPageCalled: Bool {
        return nextPageCallsCount > 0
    }

    var nextPageUnderlyingReturnValue: Result<Void, RoomDirectorySearchError>!
    var nextPageReturnValue: Result<Void, RoomDirectorySearchError>! {
        get {
            if Thread.isMainThread {
                return nextPageUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomDirectorySearchError>? = nil
                DispatchQueue.main.sync {
                    returnValue = nextPageUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                nextPageUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    nextPageUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var nextPageClosure: (() async -> Result<Void, RoomDirectorySearchError>)?

    func nextPage() async -> Result<Void, RoomDirectorySearchError> {
        nextPageCallsCount += 1
        if let nextPageClosure = nextPageClosure {
            return await nextPageClosure()
        } else {
            return nextPageReturnValue
        }
    }
}
class RoomMemberProxyMock: RoomMemberProxyProtocol {
    var userID: String {
        get { return underlyingUserID }
        set(value) { underlyingUserID = value }
    }
    var underlyingUserID: String!
    var displayName: String?
    var avatarURL: URL?
    var membership: MembershipState {
        get { return underlyingMembership }
        set(value) { underlyingMembership = value }
    }
    var underlyingMembership: MembershipState!
    var isIgnored: Bool {
        get { return underlyingIsIgnored }
        set(value) { underlyingIsIgnored = value }
    }
    var underlyingIsIgnored: Bool!
    var powerLevel: Int {
        get { return underlyingPowerLevel }
        set(value) { underlyingPowerLevel = value }
    }
    var underlyingPowerLevel: Int!
    var role: RoomMemberRole {
        get { return underlyingRole }
        set(value) { underlyingRole = value }
    }
    var underlyingRole: RoomMemberRole!

}
class RoomNotificationSettingsProxyMock: RoomNotificationSettingsProxyProtocol {
    var mode: RoomNotificationModeProxy {
        get { return underlyingMode }
        set(value) { underlyingMode = value }
    }
    var underlyingMode: RoomNotificationModeProxy!
    var isDefault: Bool {
        get { return underlyingIsDefault }
        set(value) { underlyingIsDefault = value }
    }
    var underlyingIsDefault: Bool!

}
class RoomProxyMock: RoomProxyProtocol {
    var id: String {
        get { return underlyingId }
        set(value) { underlyingId = value }
    }
    var underlyingId: String!
    var isDirect: Bool {
        get { return underlyingIsDirect }
        set(value) { underlyingIsDirect = value }
    }
    var underlyingIsDirect: Bool!
    var isPublic: Bool {
        get { return underlyingIsPublic }
        set(value) { underlyingIsPublic = value }
    }
    var underlyingIsPublic: Bool!
    var isSpace: Bool {
        get { return underlyingIsSpace }
        set(value) { underlyingIsSpace = value }
    }
    var underlyingIsSpace: Bool!
    var isEncrypted: Bool {
        get { return underlyingIsEncrypted }
        set(value) { underlyingIsEncrypted = value }
    }
    var underlyingIsEncrypted: Bool!
    var isFavouriteCallsCount = 0
    var isFavouriteCalled: Bool {
        return isFavouriteCallsCount > 0
    }

    var isFavourite: Bool {
        get async {
            isFavouriteCallsCount += 1
            if let isFavouriteClosure = isFavouriteClosure {
                return await isFavouriteClosure()
            } else {
                return underlyingIsFavourite
            }
        }
    }
    var underlyingIsFavourite: Bool!
    var isFavouriteClosure: (() async -> Bool)?
    var membership: Membership {
        get { return underlyingMembership }
        set(value) { underlyingMembership = value }
    }
    var underlyingMembership: Membership!
    var hasOngoingCall: Bool {
        get { return underlyingHasOngoingCall }
        set(value) { underlyingHasOngoingCall = value }
    }
    var underlyingHasOngoingCall: Bool!
    var canonicalAlias: String?
    var ownUserID: String {
        get { return underlyingOwnUserID }
        set(value) { underlyingOwnUserID = value }
    }
    var underlyingOwnUserID: String!
    var name: String?
    var topic: String?
    var avatarURL: URL?
    var membersPublisher: CurrentValuePublisher<[RoomMemberProxyProtocol], Never> {
        get { return underlyingMembersPublisher }
        set(value) { underlyingMembersPublisher = value }
    }
    var underlyingMembersPublisher: CurrentValuePublisher<[RoomMemberProxyProtocol], Never>!
    var typingMembersPublisher: CurrentValuePublisher<[String], Never> {
        get { return underlyingTypingMembersPublisher }
        set(value) { underlyingTypingMembersPublisher = value }
    }
    var underlyingTypingMembersPublisher: CurrentValuePublisher<[String], Never>!
    var joinedMembersCount: Int {
        get { return underlyingJoinedMembersCount }
        set(value) { underlyingJoinedMembersCount = value }
    }
    var underlyingJoinedMembersCount: Int!
    var activeMembersCount: Int {
        get { return underlyingActiveMembersCount }
        set(value) { underlyingActiveMembersCount = value }
    }
    var underlyingActiveMembersCount: Int!
    var actionsPublisher: AnyPublisher<RoomProxyAction, Never> {
        get { return underlyingActionsPublisher }
        set(value) { underlyingActionsPublisher = value }
    }
    var underlyingActionsPublisher: AnyPublisher<RoomProxyAction, Never>!
    var timeline: TimelineProxyProtocol {
        get { return underlyingTimeline }
        set(value) { underlyingTimeline = value }
    }
    var underlyingTimeline: TimelineProxyProtocol!

    //MARK: - subscribeForUpdates

    var subscribeForUpdatesUnderlyingCallsCount = 0
    var subscribeForUpdatesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeForUpdatesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeForUpdatesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeForUpdatesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeForUpdatesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var subscribeForUpdatesCalled: Bool {
        return subscribeForUpdatesCallsCount > 0
    }
    var subscribeForUpdatesClosure: (() async -> Void)?

    func subscribeForUpdates() async {
        subscribeForUpdatesCallsCount += 1
        await subscribeForUpdatesClosure?()
    }
    //MARK: - unsubscribeFromUpdates

    var unsubscribeFromUpdatesUnderlyingCallsCount = 0
    var unsubscribeFromUpdatesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return unsubscribeFromUpdatesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = unsubscribeFromUpdatesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unsubscribeFromUpdatesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    unsubscribeFromUpdatesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var unsubscribeFromUpdatesCalled: Bool {
        return unsubscribeFromUpdatesCallsCount > 0
    }
    var unsubscribeFromUpdatesClosure: (() -> Void)?

    func unsubscribeFromUpdates() {
        unsubscribeFromUpdatesCallsCount += 1
        unsubscribeFromUpdatesClosure?()
    }
    //MARK: - timelineFocusedOnEvent

    var timelineFocusedOnEventEventIDNumberOfEventsUnderlyingCallsCount = 0
    var timelineFocusedOnEventEventIDNumberOfEventsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return timelineFocusedOnEventEventIDNumberOfEventsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = timelineFocusedOnEventEventIDNumberOfEventsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                timelineFocusedOnEventEventIDNumberOfEventsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    timelineFocusedOnEventEventIDNumberOfEventsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var timelineFocusedOnEventEventIDNumberOfEventsCalled: Bool {
        return timelineFocusedOnEventEventIDNumberOfEventsCallsCount > 0
    }
    var timelineFocusedOnEventEventIDNumberOfEventsReceivedArguments: (eventID: String, numberOfEvents: UInt16)?
    var timelineFocusedOnEventEventIDNumberOfEventsReceivedInvocations: [(eventID: String, numberOfEvents: UInt16)] = []

    var timelineFocusedOnEventEventIDNumberOfEventsUnderlyingReturnValue: Result<TimelineProxyProtocol, RoomProxyError>!
    var timelineFocusedOnEventEventIDNumberOfEventsReturnValue: Result<TimelineProxyProtocol, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return timelineFocusedOnEventEventIDNumberOfEventsUnderlyingReturnValue
            } else {
                var returnValue: Result<TimelineProxyProtocol, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = timelineFocusedOnEventEventIDNumberOfEventsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                timelineFocusedOnEventEventIDNumberOfEventsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    timelineFocusedOnEventEventIDNumberOfEventsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var timelineFocusedOnEventEventIDNumberOfEventsClosure: ((String, UInt16) async -> Result<TimelineProxyProtocol, RoomProxyError>)?

    func timelineFocusedOnEvent(eventID: String, numberOfEvents: UInt16) async -> Result<TimelineProxyProtocol, RoomProxyError> {
        timelineFocusedOnEventEventIDNumberOfEventsCallsCount += 1
        timelineFocusedOnEventEventIDNumberOfEventsReceivedArguments = (eventID: eventID, numberOfEvents: numberOfEvents)
        timelineFocusedOnEventEventIDNumberOfEventsReceivedInvocations.append((eventID: eventID, numberOfEvents: numberOfEvents))
        if let timelineFocusedOnEventEventIDNumberOfEventsClosure = timelineFocusedOnEventEventIDNumberOfEventsClosure {
            return await timelineFocusedOnEventEventIDNumberOfEventsClosure(eventID, numberOfEvents)
        } else {
            return timelineFocusedOnEventEventIDNumberOfEventsReturnValue
        }
    }
    //MARK: - redact

    var redactUnderlyingCallsCount = 0
    var redactCallsCount: Int {
        get {
            if Thread.isMainThread {
                return redactUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = redactUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                redactUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    redactUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var redactCalled: Bool {
        return redactCallsCount > 0
    }
    var redactReceivedEventID: String?
    var redactReceivedInvocations: [String] = []

    var redactUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var redactReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return redactUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = redactUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                redactUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    redactUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var redactClosure: ((String) async -> Result<Void, RoomProxyError>)?

    func redact(_ eventID: String) async -> Result<Void, RoomProxyError> {
        redactCallsCount += 1
        redactReceivedEventID = eventID
        redactReceivedInvocations.append(eventID)
        if let redactClosure = redactClosure {
            return await redactClosure(eventID)
        } else {
            return redactReturnValue
        }
    }
    //MARK: - reportContent

    var reportContentReasonUnderlyingCallsCount = 0
    var reportContentReasonCallsCount: Int {
        get {
            if Thread.isMainThread {
                return reportContentReasonUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = reportContentReasonUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                reportContentReasonUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    reportContentReasonUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var reportContentReasonCalled: Bool {
        return reportContentReasonCallsCount > 0
    }
    var reportContentReasonReceivedArguments: (eventID: String, reason: String?)?
    var reportContentReasonReceivedInvocations: [(eventID: String, reason: String?)] = []

    var reportContentReasonUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var reportContentReasonReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return reportContentReasonUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = reportContentReasonUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                reportContentReasonUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    reportContentReasonUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var reportContentReasonClosure: ((String, String?) async -> Result<Void, RoomProxyError>)?

    func reportContent(_ eventID: String, reason: String?) async -> Result<Void, RoomProxyError> {
        reportContentReasonCallsCount += 1
        reportContentReasonReceivedArguments = (eventID: eventID, reason: reason)
        reportContentReasonReceivedInvocations.append((eventID: eventID, reason: reason))
        if let reportContentReasonClosure = reportContentReasonClosure {
            return await reportContentReasonClosure(eventID, reason)
        } else {
            return reportContentReasonReturnValue
        }
    }
    //MARK: - leaveRoom

    var leaveRoomUnderlyingCallsCount = 0
    var leaveRoomCallsCount: Int {
        get {
            if Thread.isMainThread {
                return leaveRoomUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = leaveRoomUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                leaveRoomUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    leaveRoomUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var leaveRoomCalled: Bool {
        return leaveRoomCallsCount > 0
    }

    var leaveRoomUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var leaveRoomReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return leaveRoomUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = leaveRoomUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                leaveRoomUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    leaveRoomUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var leaveRoomClosure: (() async -> Result<Void, RoomProxyError>)?

    func leaveRoom() async -> Result<Void, RoomProxyError> {
        leaveRoomCallsCount += 1
        if let leaveRoomClosure = leaveRoomClosure {
            return await leaveRoomClosure()
        } else {
            return leaveRoomReturnValue
        }
    }
    //MARK: - updateMembers

    var updateMembersUnderlyingCallsCount = 0
    var updateMembersCallsCount: Int {
        get {
            if Thread.isMainThread {
                return updateMembersUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = updateMembersUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                updateMembersUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    updateMembersUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var updateMembersCalled: Bool {
        return updateMembersCallsCount > 0
    }
    var updateMembersClosure: (() async -> Void)?

    func updateMembers() async {
        updateMembersCallsCount += 1
        await updateMembersClosure?()
    }
    //MARK: - getMember

    var getMemberUserIDUnderlyingCallsCount = 0
    var getMemberUserIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return getMemberUserIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = getMemberUserIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMemberUserIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    getMemberUserIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var getMemberUserIDCalled: Bool {
        return getMemberUserIDCallsCount > 0
    }
    var getMemberUserIDReceivedUserID: String?
    var getMemberUserIDReceivedInvocations: [String] = []

    var getMemberUserIDUnderlyingReturnValue: Result<RoomMemberProxyProtocol, RoomProxyError>!
    var getMemberUserIDReturnValue: Result<RoomMemberProxyProtocol, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return getMemberUserIDUnderlyingReturnValue
            } else {
                var returnValue: Result<RoomMemberProxyProtocol, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = getMemberUserIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                getMemberUserIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    getMemberUserIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var getMemberUserIDClosure: ((String) async -> Result<RoomMemberProxyProtocol, RoomProxyError>)?

    func getMember(userID: String) async -> Result<RoomMemberProxyProtocol, RoomProxyError> {
        getMemberUserIDCallsCount += 1
        getMemberUserIDReceivedUserID = userID
        getMemberUserIDReceivedInvocations.append(userID)
        if let getMemberUserIDClosure = getMemberUserIDClosure {
            return await getMemberUserIDClosure(userID)
        } else {
            return getMemberUserIDReturnValue
        }
    }
    //MARK: - rejectInvitation

    var rejectInvitationUnderlyingCallsCount = 0
    var rejectInvitationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return rejectInvitationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = rejectInvitationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                rejectInvitationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    rejectInvitationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var rejectInvitationCalled: Bool {
        return rejectInvitationCallsCount > 0
    }

    var rejectInvitationUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var rejectInvitationReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return rejectInvitationUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = rejectInvitationUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                rejectInvitationUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    rejectInvitationUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var rejectInvitationClosure: (() async -> Result<Void, RoomProxyError>)?

    func rejectInvitation() async -> Result<Void, RoomProxyError> {
        rejectInvitationCallsCount += 1
        if let rejectInvitationClosure = rejectInvitationClosure {
            return await rejectInvitationClosure()
        } else {
            return rejectInvitationReturnValue
        }
    }
    //MARK: - acceptInvitation

    var acceptInvitationUnderlyingCallsCount = 0
    var acceptInvitationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return acceptInvitationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = acceptInvitationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                acceptInvitationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    acceptInvitationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var acceptInvitationCalled: Bool {
        return acceptInvitationCallsCount > 0
    }

    var acceptInvitationUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var acceptInvitationReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return acceptInvitationUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = acceptInvitationUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                acceptInvitationUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    acceptInvitationUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var acceptInvitationClosure: (() async -> Result<Void, RoomProxyError>)?

    func acceptInvitation() async -> Result<Void, RoomProxyError> {
        acceptInvitationCallsCount += 1
        if let acceptInvitationClosure = acceptInvitationClosure {
            return await acceptInvitationClosure()
        } else {
            return acceptInvitationReturnValue
        }
    }
    //MARK: - invite

    var inviteUserIDUnderlyingCallsCount = 0
    var inviteUserIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return inviteUserIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = inviteUserIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                inviteUserIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    inviteUserIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var inviteUserIDCalled: Bool {
        return inviteUserIDCallsCount > 0
    }
    var inviteUserIDReceivedUserID: String?
    var inviteUserIDReceivedInvocations: [String] = []

    var inviteUserIDUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var inviteUserIDReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return inviteUserIDUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = inviteUserIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                inviteUserIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    inviteUserIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var inviteUserIDClosure: ((String) async -> Result<Void, RoomProxyError>)?

    func invite(userID: String) async -> Result<Void, RoomProxyError> {
        inviteUserIDCallsCount += 1
        inviteUserIDReceivedUserID = userID
        inviteUserIDReceivedInvocations.append(userID)
        if let inviteUserIDClosure = inviteUserIDClosure {
            return await inviteUserIDClosure(userID)
        } else {
            return inviteUserIDReturnValue
        }
    }
    //MARK: - setName

    var setNameUnderlyingCallsCount = 0
    var setNameCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setNameUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setNameUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setNameUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setNameUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setNameCalled: Bool {
        return setNameCallsCount > 0
    }
    var setNameReceivedName: String?
    var setNameReceivedInvocations: [String] = []

    var setNameUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var setNameReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return setNameUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = setNameUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setNameUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    setNameUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var setNameClosure: ((String) async -> Result<Void, RoomProxyError>)?

    func setName(_ name: String) async -> Result<Void, RoomProxyError> {
        setNameCallsCount += 1
        setNameReceivedName = name
        setNameReceivedInvocations.append(name)
        if let setNameClosure = setNameClosure {
            return await setNameClosure(name)
        } else {
            return setNameReturnValue
        }
    }
    //MARK: - setTopic

    var setTopicUnderlyingCallsCount = 0
    var setTopicCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setTopicUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setTopicUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setTopicUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setTopicUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setTopicCalled: Bool {
        return setTopicCallsCount > 0
    }
    var setTopicReceivedTopic: String?
    var setTopicReceivedInvocations: [String] = []

    var setTopicUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var setTopicReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return setTopicUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = setTopicUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setTopicUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    setTopicUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var setTopicClosure: ((String) async -> Result<Void, RoomProxyError>)?

    func setTopic(_ topic: String) async -> Result<Void, RoomProxyError> {
        setTopicCallsCount += 1
        setTopicReceivedTopic = topic
        setTopicReceivedInvocations.append(topic)
        if let setTopicClosure = setTopicClosure {
            return await setTopicClosure(topic)
        } else {
            return setTopicReturnValue
        }
    }
    //MARK: - removeAvatar

    var removeAvatarUnderlyingCallsCount = 0
    var removeAvatarCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removeAvatarUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removeAvatarUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeAvatarUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removeAvatarUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var removeAvatarCalled: Bool {
        return removeAvatarCallsCount > 0
    }

    var removeAvatarUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var removeAvatarReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return removeAvatarUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = removeAvatarUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeAvatarUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    removeAvatarUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var removeAvatarClosure: (() async -> Result<Void, RoomProxyError>)?

    func removeAvatar() async -> Result<Void, RoomProxyError> {
        removeAvatarCallsCount += 1
        if let removeAvatarClosure = removeAvatarClosure {
            return await removeAvatarClosure()
        } else {
            return removeAvatarReturnValue
        }
    }
    //MARK: - uploadAvatar

    var uploadAvatarMediaUnderlyingCallsCount = 0
    var uploadAvatarMediaCallsCount: Int {
        get {
            if Thread.isMainThread {
                return uploadAvatarMediaUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = uploadAvatarMediaUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                uploadAvatarMediaUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    uploadAvatarMediaUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var uploadAvatarMediaCalled: Bool {
        return uploadAvatarMediaCallsCount > 0
    }
    var uploadAvatarMediaReceivedMedia: MediaInfo?
    var uploadAvatarMediaReceivedInvocations: [MediaInfo] = []

    var uploadAvatarMediaUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var uploadAvatarMediaReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return uploadAvatarMediaUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = uploadAvatarMediaUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                uploadAvatarMediaUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    uploadAvatarMediaUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var uploadAvatarMediaClosure: ((MediaInfo) async -> Result<Void, RoomProxyError>)?

    func uploadAvatar(media: MediaInfo) async -> Result<Void, RoomProxyError> {
        uploadAvatarMediaCallsCount += 1
        uploadAvatarMediaReceivedMedia = media
        uploadAvatarMediaReceivedInvocations.append(media)
        if let uploadAvatarMediaClosure = uploadAvatarMediaClosure {
            return await uploadAvatarMediaClosure(media)
        } else {
            return uploadAvatarMediaReturnValue
        }
    }
    //MARK: - markAsRead

    var markAsReadReceiptTypeUnderlyingCallsCount = 0
    var markAsReadReceiptTypeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return markAsReadReceiptTypeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = markAsReadReceiptTypeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                markAsReadReceiptTypeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    markAsReadReceiptTypeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var markAsReadReceiptTypeCalled: Bool {
        return markAsReadReceiptTypeCallsCount > 0
    }
    var markAsReadReceiptTypeReceivedReceiptType: ReceiptType?
    var markAsReadReceiptTypeReceivedInvocations: [ReceiptType] = []

    var markAsReadReceiptTypeUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var markAsReadReceiptTypeReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return markAsReadReceiptTypeUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = markAsReadReceiptTypeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                markAsReadReceiptTypeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    markAsReadReceiptTypeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var markAsReadReceiptTypeClosure: ((ReceiptType) async -> Result<Void, RoomProxyError>)?

    func markAsRead(receiptType: ReceiptType) async -> Result<Void, RoomProxyError> {
        markAsReadReceiptTypeCallsCount += 1
        markAsReadReceiptTypeReceivedReceiptType = receiptType
        markAsReadReceiptTypeReceivedInvocations.append(receiptType)
        if let markAsReadReceiptTypeClosure = markAsReadReceiptTypeClosure {
            return await markAsReadReceiptTypeClosure(receiptType)
        } else {
            return markAsReadReceiptTypeReturnValue
        }
    }
    //MARK: - sendTypingNotification

    var sendTypingNotificationIsTypingUnderlyingCallsCount = 0
    var sendTypingNotificationIsTypingCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendTypingNotificationIsTypingUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendTypingNotificationIsTypingUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendTypingNotificationIsTypingUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendTypingNotificationIsTypingUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendTypingNotificationIsTypingCalled: Bool {
        return sendTypingNotificationIsTypingCallsCount > 0
    }
    var sendTypingNotificationIsTypingReceivedIsTyping: Bool?
    var sendTypingNotificationIsTypingReceivedInvocations: [Bool] = []

    var sendTypingNotificationIsTypingUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var sendTypingNotificationIsTypingReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return sendTypingNotificationIsTypingUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendTypingNotificationIsTypingUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendTypingNotificationIsTypingUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendTypingNotificationIsTypingUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendTypingNotificationIsTypingClosure: ((Bool) async -> Result<Void, RoomProxyError>)?

    @discardableResult
    func sendTypingNotification(isTyping: Bool) async -> Result<Void, RoomProxyError> {
        sendTypingNotificationIsTypingCallsCount += 1
        sendTypingNotificationIsTypingReceivedIsTyping = isTyping
        sendTypingNotificationIsTypingReceivedInvocations.append(isTyping)
        if let sendTypingNotificationIsTypingClosure = sendTypingNotificationIsTypingClosure {
            return await sendTypingNotificationIsTypingClosure(isTyping)
        } else {
            return sendTypingNotificationIsTypingReturnValue
        }
    }
    //MARK: - flagAsUnread

    var flagAsUnreadUnderlyingCallsCount = 0
    var flagAsUnreadCallsCount: Int {
        get {
            if Thread.isMainThread {
                return flagAsUnreadUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = flagAsUnreadUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                flagAsUnreadUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    flagAsUnreadUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var flagAsUnreadCalled: Bool {
        return flagAsUnreadCallsCount > 0
    }
    var flagAsUnreadReceivedIsUnread: Bool?
    var flagAsUnreadReceivedInvocations: [Bool] = []

    var flagAsUnreadUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var flagAsUnreadReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return flagAsUnreadUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = flagAsUnreadUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                flagAsUnreadUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    flagAsUnreadUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var flagAsUnreadClosure: ((Bool) async -> Result<Void, RoomProxyError>)?

    func flagAsUnread(_ isUnread: Bool) async -> Result<Void, RoomProxyError> {
        flagAsUnreadCallsCount += 1
        flagAsUnreadReceivedIsUnread = isUnread
        flagAsUnreadReceivedInvocations.append(isUnread)
        if let flagAsUnreadClosure = flagAsUnreadClosure {
            return await flagAsUnreadClosure(isUnread)
        } else {
            return flagAsUnreadReturnValue
        }
    }
    //MARK: - flagAsFavourite

    var flagAsFavouriteUnderlyingCallsCount = 0
    var flagAsFavouriteCallsCount: Int {
        get {
            if Thread.isMainThread {
                return flagAsFavouriteUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = flagAsFavouriteUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                flagAsFavouriteUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    flagAsFavouriteUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var flagAsFavouriteCalled: Bool {
        return flagAsFavouriteCallsCount > 0
    }
    var flagAsFavouriteReceivedIsFavourite: Bool?
    var flagAsFavouriteReceivedInvocations: [Bool] = []

    var flagAsFavouriteUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var flagAsFavouriteReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return flagAsFavouriteUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = flagAsFavouriteUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                flagAsFavouriteUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    flagAsFavouriteUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var flagAsFavouriteClosure: ((Bool) async -> Result<Void, RoomProxyError>)?

    func flagAsFavourite(_ isFavourite: Bool) async -> Result<Void, RoomProxyError> {
        flagAsFavouriteCallsCount += 1
        flagAsFavouriteReceivedIsFavourite = isFavourite
        flagAsFavouriteReceivedInvocations.append(isFavourite)
        if let flagAsFavouriteClosure = flagAsFavouriteClosure {
            return await flagAsFavouriteClosure(isFavourite)
        } else {
            return flagAsFavouriteReturnValue
        }
    }
    //MARK: - powerLevels

    var powerLevelsUnderlyingCallsCount = 0
    var powerLevelsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return powerLevelsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = powerLevelsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                powerLevelsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    powerLevelsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var powerLevelsCalled: Bool {
        return powerLevelsCallsCount > 0
    }

    var powerLevelsUnderlyingReturnValue: Result<RoomPowerLevels, RoomProxyError>!
    var powerLevelsReturnValue: Result<RoomPowerLevels, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return powerLevelsUnderlyingReturnValue
            } else {
                var returnValue: Result<RoomPowerLevels, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = powerLevelsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                powerLevelsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    powerLevelsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var powerLevelsClosure: (() async -> Result<RoomPowerLevels, RoomProxyError>)?

    func powerLevels() async -> Result<RoomPowerLevels, RoomProxyError> {
        powerLevelsCallsCount += 1
        if let powerLevelsClosure = powerLevelsClosure {
            return await powerLevelsClosure()
        } else {
            return powerLevelsReturnValue
        }
    }
    //MARK: - applyPowerLevelChanges

    var applyPowerLevelChangesUnderlyingCallsCount = 0
    var applyPowerLevelChangesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return applyPowerLevelChangesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = applyPowerLevelChangesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                applyPowerLevelChangesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    applyPowerLevelChangesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var applyPowerLevelChangesCalled: Bool {
        return applyPowerLevelChangesCallsCount > 0
    }
    var applyPowerLevelChangesReceivedChanges: RoomPowerLevelChanges?
    var applyPowerLevelChangesReceivedInvocations: [RoomPowerLevelChanges] = []

    var applyPowerLevelChangesUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var applyPowerLevelChangesReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return applyPowerLevelChangesUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = applyPowerLevelChangesUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                applyPowerLevelChangesUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    applyPowerLevelChangesUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var applyPowerLevelChangesClosure: ((RoomPowerLevelChanges) async -> Result<Void, RoomProxyError>)?

    func applyPowerLevelChanges(_ changes: RoomPowerLevelChanges) async -> Result<Void, RoomProxyError> {
        applyPowerLevelChangesCallsCount += 1
        applyPowerLevelChangesReceivedChanges = changes
        applyPowerLevelChangesReceivedInvocations.append(changes)
        if let applyPowerLevelChangesClosure = applyPowerLevelChangesClosure {
            return await applyPowerLevelChangesClosure(changes)
        } else {
            return applyPowerLevelChangesReturnValue
        }
    }
    //MARK: - resetPowerLevels

    var resetPowerLevelsUnderlyingCallsCount = 0
    var resetPowerLevelsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return resetPowerLevelsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = resetPowerLevelsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetPowerLevelsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    resetPowerLevelsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var resetPowerLevelsCalled: Bool {
        return resetPowerLevelsCallsCount > 0
    }

    var resetPowerLevelsUnderlyingReturnValue: Result<RoomPowerLevels, RoomProxyError>!
    var resetPowerLevelsReturnValue: Result<RoomPowerLevels, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return resetPowerLevelsUnderlyingReturnValue
            } else {
                var returnValue: Result<RoomPowerLevels, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = resetPowerLevelsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                resetPowerLevelsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    resetPowerLevelsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var resetPowerLevelsClosure: (() async -> Result<RoomPowerLevels, RoomProxyError>)?

    func resetPowerLevels() async -> Result<RoomPowerLevels, RoomProxyError> {
        resetPowerLevelsCallsCount += 1
        if let resetPowerLevelsClosure = resetPowerLevelsClosure {
            return await resetPowerLevelsClosure()
        } else {
            return resetPowerLevelsReturnValue
        }
    }
    //MARK: - suggestedRole

    var suggestedRoleForUnderlyingCallsCount = 0
    var suggestedRoleForCallsCount: Int {
        get {
            if Thread.isMainThread {
                return suggestedRoleForUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = suggestedRoleForUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                suggestedRoleForUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    suggestedRoleForUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var suggestedRoleForCalled: Bool {
        return suggestedRoleForCallsCount > 0
    }
    var suggestedRoleForReceivedUserID: String?
    var suggestedRoleForReceivedInvocations: [String] = []

    var suggestedRoleForUnderlyingReturnValue: Result<RoomMemberRole, RoomProxyError>!
    var suggestedRoleForReturnValue: Result<RoomMemberRole, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return suggestedRoleForUnderlyingReturnValue
            } else {
                var returnValue: Result<RoomMemberRole, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = suggestedRoleForUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                suggestedRoleForUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    suggestedRoleForUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var suggestedRoleForClosure: ((String) async -> Result<RoomMemberRole, RoomProxyError>)?

    func suggestedRole(for userID: String) async -> Result<RoomMemberRole, RoomProxyError> {
        suggestedRoleForCallsCount += 1
        suggestedRoleForReceivedUserID = userID
        suggestedRoleForReceivedInvocations.append(userID)
        if let suggestedRoleForClosure = suggestedRoleForClosure {
            return await suggestedRoleForClosure(userID)
        } else {
            return suggestedRoleForReturnValue
        }
    }
    //MARK: - updatePowerLevelsForUsers

    var updatePowerLevelsForUsersUnderlyingCallsCount = 0
    var updatePowerLevelsForUsersCallsCount: Int {
        get {
            if Thread.isMainThread {
                return updatePowerLevelsForUsersUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = updatePowerLevelsForUsersUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                updatePowerLevelsForUsersUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    updatePowerLevelsForUsersUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var updatePowerLevelsForUsersCalled: Bool {
        return updatePowerLevelsForUsersCallsCount > 0
    }
    var updatePowerLevelsForUsersReceivedUpdates: [(userID: String, powerLevel: Int64)]?
    var updatePowerLevelsForUsersReceivedInvocations: [[(userID: String, powerLevel: Int64)]] = []

    var updatePowerLevelsForUsersUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var updatePowerLevelsForUsersReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return updatePowerLevelsForUsersUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = updatePowerLevelsForUsersUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                updatePowerLevelsForUsersUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    updatePowerLevelsForUsersUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var updatePowerLevelsForUsersClosure: (([(userID: String, powerLevel: Int64)]) async -> Result<Void, RoomProxyError>)?

    func updatePowerLevelsForUsers(_ updates: [(userID: String, powerLevel: Int64)]) async -> Result<Void, RoomProxyError> {
        updatePowerLevelsForUsersCallsCount += 1
        updatePowerLevelsForUsersReceivedUpdates = updates
        updatePowerLevelsForUsersReceivedInvocations.append(updates)
        if let updatePowerLevelsForUsersClosure = updatePowerLevelsForUsersClosure {
            return await updatePowerLevelsForUsersClosure(updates)
        } else {
            return updatePowerLevelsForUsersReturnValue
        }
    }
    //MARK: - canUser

    var canUserUserIDSendStateEventUnderlyingCallsCount = 0
    var canUserUserIDSendStateEventCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserUserIDSendStateEventUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserUserIDSendStateEventUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserUserIDSendStateEventUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserUserIDSendStateEventUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var canUserUserIDSendStateEventCalled: Bool {
        return canUserUserIDSendStateEventCallsCount > 0
    }
    var canUserUserIDSendStateEventReceivedArguments: (userID: String, event: StateEventType)?
    var canUserUserIDSendStateEventReceivedInvocations: [(userID: String, event: StateEventType)] = []

    var canUserUserIDSendStateEventUnderlyingReturnValue: Result<Bool, RoomProxyError>!
    var canUserUserIDSendStateEventReturnValue: Result<Bool, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return canUserUserIDSendStateEventUnderlyingReturnValue
            } else {
                var returnValue: Result<Bool, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserUserIDSendStateEventUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserUserIDSendStateEventUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserUserIDSendStateEventUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var canUserUserIDSendStateEventClosure: ((String, StateEventType) async -> Result<Bool, RoomProxyError>)?

    func canUser(userID: String, sendStateEvent event: StateEventType) async -> Result<Bool, RoomProxyError> {
        canUserUserIDSendStateEventCallsCount += 1
        canUserUserIDSendStateEventReceivedArguments = (userID: userID, event: event)
        canUserUserIDSendStateEventReceivedInvocations.append((userID: userID, event: event))
        if let canUserUserIDSendStateEventClosure = canUserUserIDSendStateEventClosure {
            return await canUserUserIDSendStateEventClosure(userID, event)
        } else {
            return canUserUserIDSendStateEventReturnValue
        }
    }
    //MARK: - canUserInvite

    var canUserInviteUserIDUnderlyingCallsCount = 0
    var canUserInviteUserIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserInviteUserIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserInviteUserIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserInviteUserIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserInviteUserIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var canUserInviteUserIDCalled: Bool {
        return canUserInviteUserIDCallsCount > 0
    }
    var canUserInviteUserIDReceivedUserID: String?
    var canUserInviteUserIDReceivedInvocations: [String] = []

    var canUserInviteUserIDUnderlyingReturnValue: Result<Bool, RoomProxyError>!
    var canUserInviteUserIDReturnValue: Result<Bool, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return canUserInviteUserIDUnderlyingReturnValue
            } else {
                var returnValue: Result<Bool, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserInviteUserIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserInviteUserIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserInviteUserIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var canUserInviteUserIDClosure: ((String) async -> Result<Bool, RoomProxyError>)?

    func canUserInvite(userID: String) async -> Result<Bool, RoomProxyError> {
        canUserInviteUserIDCallsCount += 1
        canUserInviteUserIDReceivedUserID = userID
        canUserInviteUserIDReceivedInvocations.append(userID)
        if let canUserInviteUserIDClosure = canUserInviteUserIDClosure {
            return await canUserInviteUserIDClosure(userID)
        } else {
            return canUserInviteUserIDReturnValue
        }
    }
    //MARK: - canUserRedactOther

    var canUserRedactOtherUserIDUnderlyingCallsCount = 0
    var canUserRedactOtherUserIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserRedactOtherUserIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserRedactOtherUserIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserRedactOtherUserIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserRedactOtherUserIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var canUserRedactOtherUserIDCalled: Bool {
        return canUserRedactOtherUserIDCallsCount > 0
    }
    var canUserRedactOtherUserIDReceivedUserID: String?
    var canUserRedactOtherUserIDReceivedInvocations: [String] = []

    var canUserRedactOtherUserIDUnderlyingReturnValue: Result<Bool, RoomProxyError>!
    var canUserRedactOtherUserIDReturnValue: Result<Bool, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return canUserRedactOtherUserIDUnderlyingReturnValue
            } else {
                var returnValue: Result<Bool, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserRedactOtherUserIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserRedactOtherUserIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserRedactOtherUserIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var canUserRedactOtherUserIDClosure: ((String) async -> Result<Bool, RoomProxyError>)?

    func canUserRedactOther(userID: String) async -> Result<Bool, RoomProxyError> {
        canUserRedactOtherUserIDCallsCount += 1
        canUserRedactOtherUserIDReceivedUserID = userID
        canUserRedactOtherUserIDReceivedInvocations.append(userID)
        if let canUserRedactOtherUserIDClosure = canUserRedactOtherUserIDClosure {
            return await canUserRedactOtherUserIDClosure(userID)
        } else {
            return canUserRedactOtherUserIDReturnValue
        }
    }
    //MARK: - canUserRedactOwn

    var canUserRedactOwnUserIDUnderlyingCallsCount = 0
    var canUserRedactOwnUserIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserRedactOwnUserIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserRedactOwnUserIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserRedactOwnUserIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserRedactOwnUserIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var canUserRedactOwnUserIDCalled: Bool {
        return canUserRedactOwnUserIDCallsCount > 0
    }
    var canUserRedactOwnUserIDReceivedUserID: String?
    var canUserRedactOwnUserIDReceivedInvocations: [String] = []

    var canUserRedactOwnUserIDUnderlyingReturnValue: Result<Bool, RoomProxyError>!
    var canUserRedactOwnUserIDReturnValue: Result<Bool, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return canUserRedactOwnUserIDUnderlyingReturnValue
            } else {
                var returnValue: Result<Bool, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserRedactOwnUserIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserRedactOwnUserIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserRedactOwnUserIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var canUserRedactOwnUserIDClosure: ((String) async -> Result<Bool, RoomProxyError>)?

    func canUserRedactOwn(userID: String) async -> Result<Bool, RoomProxyError> {
        canUserRedactOwnUserIDCallsCount += 1
        canUserRedactOwnUserIDReceivedUserID = userID
        canUserRedactOwnUserIDReceivedInvocations.append(userID)
        if let canUserRedactOwnUserIDClosure = canUserRedactOwnUserIDClosure {
            return await canUserRedactOwnUserIDClosure(userID)
        } else {
            return canUserRedactOwnUserIDReturnValue
        }
    }
    //MARK: - canUserKick

    var canUserKickUserIDUnderlyingCallsCount = 0
    var canUserKickUserIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserKickUserIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserKickUserIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserKickUserIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserKickUserIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var canUserKickUserIDCalled: Bool {
        return canUserKickUserIDCallsCount > 0
    }
    var canUserKickUserIDReceivedUserID: String?
    var canUserKickUserIDReceivedInvocations: [String] = []

    var canUserKickUserIDUnderlyingReturnValue: Result<Bool, RoomProxyError>!
    var canUserKickUserIDReturnValue: Result<Bool, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return canUserKickUserIDUnderlyingReturnValue
            } else {
                var returnValue: Result<Bool, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserKickUserIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserKickUserIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserKickUserIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var canUserKickUserIDClosure: ((String) async -> Result<Bool, RoomProxyError>)?

    func canUserKick(userID: String) async -> Result<Bool, RoomProxyError> {
        canUserKickUserIDCallsCount += 1
        canUserKickUserIDReceivedUserID = userID
        canUserKickUserIDReceivedInvocations.append(userID)
        if let canUserKickUserIDClosure = canUserKickUserIDClosure {
            return await canUserKickUserIDClosure(userID)
        } else {
            return canUserKickUserIDReturnValue
        }
    }
    //MARK: - canUserBan

    var canUserBanUserIDUnderlyingCallsCount = 0
    var canUserBanUserIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserBanUserIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserBanUserIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserBanUserIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserBanUserIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var canUserBanUserIDCalled: Bool {
        return canUserBanUserIDCallsCount > 0
    }
    var canUserBanUserIDReceivedUserID: String?
    var canUserBanUserIDReceivedInvocations: [String] = []

    var canUserBanUserIDUnderlyingReturnValue: Result<Bool, RoomProxyError>!
    var canUserBanUserIDReturnValue: Result<Bool, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return canUserBanUserIDUnderlyingReturnValue
            } else {
                var returnValue: Result<Bool, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserBanUserIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserBanUserIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserBanUserIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var canUserBanUserIDClosure: ((String) async -> Result<Bool, RoomProxyError>)?

    func canUserBan(userID: String) async -> Result<Bool, RoomProxyError> {
        canUserBanUserIDCallsCount += 1
        canUserBanUserIDReceivedUserID = userID
        canUserBanUserIDReceivedInvocations.append(userID)
        if let canUserBanUserIDClosure = canUserBanUserIDClosure {
            return await canUserBanUserIDClosure(userID)
        } else {
            return canUserBanUserIDReturnValue
        }
    }
    //MARK: - canUserTriggerRoomNotification

    var canUserTriggerRoomNotificationUserIDUnderlyingCallsCount = 0
    var canUserTriggerRoomNotificationUserIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserTriggerRoomNotificationUserIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserTriggerRoomNotificationUserIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserTriggerRoomNotificationUserIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserTriggerRoomNotificationUserIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var canUserTriggerRoomNotificationUserIDCalled: Bool {
        return canUserTriggerRoomNotificationUserIDCallsCount > 0
    }
    var canUserTriggerRoomNotificationUserIDReceivedUserID: String?
    var canUserTriggerRoomNotificationUserIDReceivedInvocations: [String] = []

    var canUserTriggerRoomNotificationUserIDUnderlyingReturnValue: Result<Bool, RoomProxyError>!
    var canUserTriggerRoomNotificationUserIDReturnValue: Result<Bool, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return canUserTriggerRoomNotificationUserIDUnderlyingReturnValue
            } else {
                var returnValue: Result<Bool, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserTriggerRoomNotificationUserIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserTriggerRoomNotificationUserIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserTriggerRoomNotificationUserIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var canUserTriggerRoomNotificationUserIDClosure: ((String) async -> Result<Bool, RoomProxyError>)?

    func canUserTriggerRoomNotification(userID: String) async -> Result<Bool, RoomProxyError> {
        canUserTriggerRoomNotificationUserIDCallsCount += 1
        canUserTriggerRoomNotificationUserIDReceivedUserID = userID
        canUserTriggerRoomNotificationUserIDReceivedInvocations.append(userID)
        if let canUserTriggerRoomNotificationUserIDClosure = canUserTriggerRoomNotificationUserIDClosure {
            return await canUserTriggerRoomNotificationUserIDClosure(userID)
        } else {
            return canUserTriggerRoomNotificationUserIDReturnValue
        }
    }
    //MARK: - kickUser

    var kickUserUnderlyingCallsCount = 0
    var kickUserCallsCount: Int {
        get {
            if Thread.isMainThread {
                return kickUserUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = kickUserUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                kickUserUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    kickUserUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var kickUserCalled: Bool {
        return kickUserCallsCount > 0
    }
    var kickUserReceivedUserID: String?
    var kickUserReceivedInvocations: [String] = []

    var kickUserUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var kickUserReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return kickUserUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = kickUserUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                kickUserUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    kickUserUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var kickUserClosure: ((String) async -> Result<Void, RoomProxyError>)?

    func kickUser(_ userID: String) async -> Result<Void, RoomProxyError> {
        kickUserCallsCount += 1
        kickUserReceivedUserID = userID
        kickUserReceivedInvocations.append(userID)
        if let kickUserClosure = kickUserClosure {
            return await kickUserClosure(userID)
        } else {
            return kickUserReturnValue
        }
    }
    //MARK: - banUser

    var banUserUnderlyingCallsCount = 0
    var banUserCallsCount: Int {
        get {
            if Thread.isMainThread {
                return banUserUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = banUserUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                banUserUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    banUserUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var banUserCalled: Bool {
        return banUserCallsCount > 0
    }
    var banUserReceivedUserID: String?
    var banUserReceivedInvocations: [String] = []

    var banUserUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var banUserReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return banUserUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = banUserUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                banUserUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    banUserUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var banUserClosure: ((String) async -> Result<Void, RoomProxyError>)?

    func banUser(_ userID: String) async -> Result<Void, RoomProxyError> {
        banUserCallsCount += 1
        banUserReceivedUserID = userID
        banUserReceivedInvocations.append(userID)
        if let banUserClosure = banUserClosure {
            return await banUserClosure(userID)
        } else {
            return banUserReturnValue
        }
    }
    //MARK: - unbanUser

    var unbanUserUnderlyingCallsCount = 0
    var unbanUserCallsCount: Int {
        get {
            if Thread.isMainThread {
                return unbanUserUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = unbanUserUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unbanUserUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    unbanUserUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var unbanUserCalled: Bool {
        return unbanUserCallsCount > 0
    }
    var unbanUserReceivedUserID: String?
    var unbanUserReceivedInvocations: [String] = []

    var unbanUserUnderlyingReturnValue: Result<Void, RoomProxyError>!
    var unbanUserReturnValue: Result<Void, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return unbanUserUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = unbanUserUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                unbanUserUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    unbanUserUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var unbanUserClosure: ((String) async -> Result<Void, RoomProxyError>)?

    func unbanUser(_ userID: String) async -> Result<Void, RoomProxyError> {
        unbanUserCallsCount += 1
        unbanUserReceivedUserID = userID
        unbanUserReceivedInvocations.append(userID)
        if let unbanUserClosure = unbanUserClosure {
            return await unbanUserClosure(userID)
        } else {
            return unbanUserReturnValue
        }
    }
    //MARK: - canUserJoinCall

    var canUserJoinCallUserIDUnderlyingCallsCount = 0
    var canUserJoinCallUserIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return canUserJoinCallUserIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserJoinCallUserIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserJoinCallUserIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserJoinCallUserIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var canUserJoinCallUserIDCalled: Bool {
        return canUserJoinCallUserIDCallsCount > 0
    }
    var canUserJoinCallUserIDReceivedUserID: String?
    var canUserJoinCallUserIDReceivedInvocations: [String] = []

    var canUserJoinCallUserIDUnderlyingReturnValue: Result<Bool, RoomProxyError>!
    var canUserJoinCallUserIDReturnValue: Result<Bool, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return canUserJoinCallUserIDUnderlyingReturnValue
            } else {
                var returnValue: Result<Bool, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = canUserJoinCallUserIDUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                canUserJoinCallUserIDUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    canUserJoinCallUserIDUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var canUserJoinCallUserIDClosure: ((String) async -> Result<Bool, RoomProxyError>)?

    func canUserJoinCall(userID: String) async -> Result<Bool, RoomProxyError> {
        canUserJoinCallUserIDCallsCount += 1
        canUserJoinCallUserIDReceivedUserID = userID
        canUserJoinCallUserIDReceivedInvocations.append(userID)
        if let canUserJoinCallUserIDClosure = canUserJoinCallUserIDClosure {
            return await canUserJoinCallUserIDClosure(userID)
        } else {
            return canUserJoinCallUserIDReturnValue
        }
    }
    //MARK: - elementCallWidgetDriver

    var elementCallWidgetDriverUnderlyingCallsCount = 0
    var elementCallWidgetDriverCallsCount: Int {
        get {
            if Thread.isMainThread {
                return elementCallWidgetDriverUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = elementCallWidgetDriverUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                elementCallWidgetDriverUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    elementCallWidgetDriverUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var elementCallWidgetDriverCalled: Bool {
        return elementCallWidgetDriverCallsCount > 0
    }

    var elementCallWidgetDriverUnderlyingReturnValue: ElementCallWidgetDriverProtocol!
    var elementCallWidgetDriverReturnValue: ElementCallWidgetDriverProtocol! {
        get {
            if Thread.isMainThread {
                return elementCallWidgetDriverUnderlyingReturnValue
            } else {
                var returnValue: ElementCallWidgetDriverProtocol? = nil
                DispatchQueue.main.sync {
                    returnValue = elementCallWidgetDriverUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                elementCallWidgetDriverUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    elementCallWidgetDriverUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var elementCallWidgetDriverClosure: (() -> ElementCallWidgetDriverProtocol)?

    func elementCallWidgetDriver() -> ElementCallWidgetDriverProtocol {
        elementCallWidgetDriverCallsCount += 1
        if let elementCallWidgetDriverClosure = elementCallWidgetDriverClosure {
            return elementCallWidgetDriverClosure()
        } else {
            return elementCallWidgetDriverReturnValue
        }
    }
    //MARK: - matrixToPermalink

    var matrixToPermalinkUnderlyingCallsCount = 0
    var matrixToPermalinkCallsCount: Int {
        get {
            if Thread.isMainThread {
                return matrixToPermalinkUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = matrixToPermalinkUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                matrixToPermalinkUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    matrixToPermalinkUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var matrixToPermalinkCalled: Bool {
        return matrixToPermalinkCallsCount > 0
    }

    var matrixToPermalinkUnderlyingReturnValue: Result<URL, RoomProxyError>!
    var matrixToPermalinkReturnValue: Result<URL, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return matrixToPermalinkUnderlyingReturnValue
            } else {
                var returnValue: Result<URL, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = matrixToPermalinkUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                matrixToPermalinkUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    matrixToPermalinkUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var matrixToPermalinkClosure: (() async -> Result<URL, RoomProxyError>)?

    func matrixToPermalink() async -> Result<URL, RoomProxyError> {
        matrixToPermalinkCallsCount += 1
        if let matrixToPermalinkClosure = matrixToPermalinkClosure {
            return await matrixToPermalinkClosure()
        } else {
            return matrixToPermalinkReturnValue
        }
    }
    //MARK: - matrixToEventPermalink

    var matrixToEventPermalinkUnderlyingCallsCount = 0
    var matrixToEventPermalinkCallsCount: Int {
        get {
            if Thread.isMainThread {
                return matrixToEventPermalinkUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = matrixToEventPermalinkUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                matrixToEventPermalinkUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    matrixToEventPermalinkUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var matrixToEventPermalinkCalled: Bool {
        return matrixToEventPermalinkCallsCount > 0
    }
    var matrixToEventPermalinkReceivedEventID: String?
    var matrixToEventPermalinkReceivedInvocations: [String] = []

    var matrixToEventPermalinkUnderlyingReturnValue: Result<URL, RoomProxyError>!
    var matrixToEventPermalinkReturnValue: Result<URL, RoomProxyError>! {
        get {
            if Thread.isMainThread {
                return matrixToEventPermalinkUnderlyingReturnValue
            } else {
                var returnValue: Result<URL, RoomProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = matrixToEventPermalinkUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                matrixToEventPermalinkUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    matrixToEventPermalinkUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var matrixToEventPermalinkClosure: ((String) async -> Result<URL, RoomProxyError>)?

    func matrixToEventPermalink(_ eventID: String) async -> Result<URL, RoomProxyError> {
        matrixToEventPermalinkCallsCount += 1
        matrixToEventPermalinkReceivedEventID = eventID
        matrixToEventPermalinkReceivedInvocations.append(eventID)
        if let matrixToEventPermalinkClosure = matrixToEventPermalinkClosure {
            return await matrixToEventPermalinkClosure(eventID)
        } else {
            return matrixToEventPermalinkReturnValue
        }
    }
}
class RoomSummaryProviderMock: RoomSummaryProviderProtocol {
    var roomListPublisher: CurrentValuePublisher<[RoomSummary], Never> {
        get { return underlyingRoomListPublisher }
        set(value) { underlyingRoomListPublisher = value }
    }
    var underlyingRoomListPublisher: CurrentValuePublisher<[RoomSummary], Never>!
    var statePublisher: CurrentValuePublisher<RoomSummaryProviderState, Never> {
        get { return underlyingStatePublisher }
        set(value) { underlyingStatePublisher = value }
    }
    var underlyingStatePublisher: CurrentValuePublisher<RoomSummaryProviderState, Never>!

    //MARK: - setRoomList

    var setRoomListUnderlyingCallsCount = 0
    var setRoomListCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setRoomListUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setRoomListUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setRoomListUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setRoomListUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setRoomListCalled: Bool {
        return setRoomListCallsCount > 0
    }
    var setRoomListReceivedRoomList: RoomList?
    var setRoomListReceivedInvocations: [RoomList] = []
    var setRoomListClosure: ((RoomList) -> Void)?

    func setRoomList(_ roomList: RoomList) {
        setRoomListCallsCount += 1
        setRoomListReceivedRoomList = roomList
        setRoomListReceivedInvocations.append(roomList)
        setRoomListClosure?(roomList)
    }
    //MARK: - updateVisibleRange

    var updateVisibleRangeUnderlyingCallsCount = 0
    var updateVisibleRangeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return updateVisibleRangeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = updateVisibleRangeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                updateVisibleRangeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    updateVisibleRangeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var updateVisibleRangeCalled: Bool {
        return updateVisibleRangeCallsCount > 0
    }
    var updateVisibleRangeReceivedRange: Range<Int>?
    var updateVisibleRangeReceivedInvocations: [Range<Int>] = []
    var updateVisibleRangeClosure: ((Range<Int>) -> Void)?

    func updateVisibleRange(_ range: Range<Int>) {
        updateVisibleRangeCallsCount += 1
        updateVisibleRangeReceivedRange = range
        updateVisibleRangeReceivedInvocations.append(range)
        updateVisibleRangeClosure?(range)
    }
    //MARK: - setFilter

    var setFilterUnderlyingCallsCount = 0
    var setFilterCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setFilterUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setFilterUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setFilterUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setFilterUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setFilterCalled: Bool {
        return setFilterCallsCount > 0
    }
    var setFilterReceivedFilter: RoomSummaryProviderFilter?
    var setFilterReceivedInvocations: [RoomSummaryProviderFilter] = []
    var setFilterClosure: ((RoomSummaryProviderFilter) -> Void)?

    func setFilter(_ filter: RoomSummaryProviderFilter) {
        setFilterCallsCount += 1
        setFilterReceivedFilter = filter
        setFilterReceivedInvocations.append(filter)
        setFilterClosure?(filter)
    }
}
class RoomTimelineProviderMock: RoomTimelineProviderProtocol {
    var updatePublisher: AnyPublisher<([TimelineItemProxy], PaginationState), Never> {
        get { return underlyingUpdatePublisher }
        set(value) { underlyingUpdatePublisher = value }
    }
    var underlyingUpdatePublisher: AnyPublisher<([TimelineItemProxy], PaginationState), Never>!
    var itemProxies: [TimelineItemProxy] = []
    var paginationState: PaginationState {
        get { return underlyingPaginationState }
        set(value) { underlyingPaginationState = value }
    }
    var underlyingPaginationState: PaginationState!
    var isLive: Bool {
        get { return underlyingIsLive }
        set(value) { underlyingIsLive = value }
    }
    var underlyingIsLive: Bool!
    var membershipChangePublisher: AnyPublisher<Void, Never> {
        get { return underlyingMembershipChangePublisher }
        set(value) { underlyingMembershipChangePublisher = value }
    }
    var underlyingMembershipChangePublisher: AnyPublisher<Void, Never>!

}
class SecureBackupControllerMock: SecureBackupControllerProtocol {
    var recoveryState: CurrentValuePublisher<SecureBackupRecoveryState, Never> {
        get { return underlyingRecoveryState }
        set(value) { underlyingRecoveryState = value }
    }
    var underlyingRecoveryState: CurrentValuePublisher<SecureBackupRecoveryState, Never>!
    var keyBackupState: CurrentValuePublisher<SecureBackupKeyBackupState, Never> {
        get { return underlyingKeyBackupState }
        set(value) { underlyingKeyBackupState = value }
    }
    var underlyingKeyBackupState: CurrentValuePublisher<SecureBackupKeyBackupState, Never>!

    //MARK: - enable

    var enableUnderlyingCallsCount = 0
    var enableCallsCount: Int {
        get {
            if Thread.isMainThread {
                return enableUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = enableUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    enableUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var enableCalled: Bool {
        return enableCallsCount > 0
    }

    var enableUnderlyingReturnValue: Result<Void, SecureBackupControllerError>!
    var enableReturnValue: Result<Void, SecureBackupControllerError>! {
        get {
            if Thread.isMainThread {
                return enableUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, SecureBackupControllerError>? = nil
                DispatchQueue.main.sync {
                    returnValue = enableUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                enableUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    enableUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var enableClosure: (() async -> Result<Void, SecureBackupControllerError>)?

    func enable() async -> Result<Void, SecureBackupControllerError> {
        enableCallsCount += 1
        if let enableClosure = enableClosure {
            return await enableClosure()
        } else {
            return enableReturnValue
        }
    }
    //MARK: - disable

    var disableUnderlyingCallsCount = 0
    var disableCallsCount: Int {
        get {
            if Thread.isMainThread {
                return disableUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = disableUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                disableUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    disableUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var disableCalled: Bool {
        return disableCallsCount > 0
    }

    var disableUnderlyingReturnValue: Result<Void, SecureBackupControllerError>!
    var disableReturnValue: Result<Void, SecureBackupControllerError>! {
        get {
            if Thread.isMainThread {
                return disableUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, SecureBackupControllerError>? = nil
                DispatchQueue.main.sync {
                    returnValue = disableUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                disableUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    disableUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var disableClosure: (() async -> Result<Void, SecureBackupControllerError>)?

    func disable() async -> Result<Void, SecureBackupControllerError> {
        disableCallsCount += 1
        if let disableClosure = disableClosure {
            return await disableClosure()
        } else {
            return disableReturnValue
        }
    }
    //MARK: - generateRecoveryKey

    var generateRecoveryKeyUnderlyingCallsCount = 0
    var generateRecoveryKeyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return generateRecoveryKeyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = generateRecoveryKeyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                generateRecoveryKeyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    generateRecoveryKeyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var generateRecoveryKeyCalled: Bool {
        return generateRecoveryKeyCallsCount > 0
    }

    var generateRecoveryKeyUnderlyingReturnValue: Result<String, SecureBackupControllerError>!
    var generateRecoveryKeyReturnValue: Result<String, SecureBackupControllerError>! {
        get {
            if Thread.isMainThread {
                return generateRecoveryKeyUnderlyingReturnValue
            } else {
                var returnValue: Result<String, SecureBackupControllerError>? = nil
                DispatchQueue.main.sync {
                    returnValue = generateRecoveryKeyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                generateRecoveryKeyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    generateRecoveryKeyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var generateRecoveryKeyClosure: (() async -> Result<String, SecureBackupControllerError>)?

    func generateRecoveryKey() async -> Result<String, SecureBackupControllerError> {
        generateRecoveryKeyCallsCount += 1
        if let generateRecoveryKeyClosure = generateRecoveryKeyClosure {
            return await generateRecoveryKeyClosure()
        } else {
            return generateRecoveryKeyReturnValue
        }
    }
    //MARK: - confirmRecoveryKey

    var confirmRecoveryKeyUnderlyingCallsCount = 0
    var confirmRecoveryKeyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return confirmRecoveryKeyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = confirmRecoveryKeyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                confirmRecoveryKeyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    confirmRecoveryKeyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var confirmRecoveryKeyCalled: Bool {
        return confirmRecoveryKeyCallsCount > 0
    }
    var confirmRecoveryKeyReceivedKey: String?
    var confirmRecoveryKeyReceivedInvocations: [String] = []

    var confirmRecoveryKeyUnderlyingReturnValue: Result<Void, SecureBackupControllerError>!
    var confirmRecoveryKeyReturnValue: Result<Void, SecureBackupControllerError>! {
        get {
            if Thread.isMainThread {
                return confirmRecoveryKeyUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, SecureBackupControllerError>? = nil
                DispatchQueue.main.sync {
                    returnValue = confirmRecoveryKeyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                confirmRecoveryKeyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    confirmRecoveryKeyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var confirmRecoveryKeyClosure: ((String) async -> Result<Void, SecureBackupControllerError>)?

    func confirmRecoveryKey(_ key: String) async -> Result<Void, SecureBackupControllerError> {
        confirmRecoveryKeyCallsCount += 1
        confirmRecoveryKeyReceivedKey = key
        confirmRecoveryKeyReceivedInvocations.append(key)
        if let confirmRecoveryKeyClosure = confirmRecoveryKeyClosure {
            return await confirmRecoveryKeyClosure(key)
        } else {
            return confirmRecoveryKeyReturnValue
        }
    }
    //MARK: - waitForKeyBackupUpload

    var waitForKeyBackupUploadUnderlyingCallsCount = 0
    var waitForKeyBackupUploadCallsCount: Int {
        get {
            if Thread.isMainThread {
                return waitForKeyBackupUploadUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = waitForKeyBackupUploadUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                waitForKeyBackupUploadUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    waitForKeyBackupUploadUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var waitForKeyBackupUploadCalled: Bool {
        return waitForKeyBackupUploadCallsCount > 0
    }

    var waitForKeyBackupUploadUnderlyingReturnValue: Result<Void, SecureBackupControllerError>!
    var waitForKeyBackupUploadReturnValue: Result<Void, SecureBackupControllerError>! {
        get {
            if Thread.isMainThread {
                return waitForKeyBackupUploadUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, SecureBackupControllerError>? = nil
                DispatchQueue.main.sync {
                    returnValue = waitForKeyBackupUploadUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                waitForKeyBackupUploadUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    waitForKeyBackupUploadUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var waitForKeyBackupUploadClosure: (() async -> Result<Void, SecureBackupControllerError>)?

    func waitForKeyBackupUpload() async -> Result<Void, SecureBackupControllerError> {
        waitForKeyBackupUploadCallsCount += 1
        if let waitForKeyBackupUploadClosure = waitForKeyBackupUploadClosure {
            return await waitForKeyBackupUploadClosure()
        } else {
            return waitForKeyBackupUploadReturnValue
        }
    }
}
class SessionVerificationControllerProxyMock: SessionVerificationControllerProxyProtocol {
    var callbacks: PassthroughSubject<SessionVerificationControllerProxyCallback, Never> {
        get { return underlyingCallbacks }
        set(value) { underlyingCallbacks = value }
    }
    var underlyingCallbacks: PassthroughSubject<SessionVerificationControllerProxyCallback, Never>!

    //MARK: - isVerified

    var isVerifiedUnderlyingCallsCount = 0
    var isVerifiedCallsCount: Int {
        get {
            if Thread.isMainThread {
                return isVerifiedUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = isVerifiedUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isVerifiedUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    isVerifiedUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var isVerifiedCalled: Bool {
        return isVerifiedCallsCount > 0
    }

    var isVerifiedUnderlyingReturnValue: Result<Bool, SessionVerificationControllerProxyError>!
    var isVerifiedReturnValue: Result<Bool, SessionVerificationControllerProxyError>! {
        get {
            if Thread.isMainThread {
                return isVerifiedUnderlyingReturnValue
            } else {
                var returnValue: Result<Bool, SessionVerificationControllerProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = isVerifiedUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                isVerifiedUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    isVerifiedUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var isVerifiedClosure: (() async -> Result<Bool, SessionVerificationControllerProxyError>)?

    func isVerified() async -> Result<Bool, SessionVerificationControllerProxyError> {
        isVerifiedCallsCount += 1
        if let isVerifiedClosure = isVerifiedClosure {
            return await isVerifiedClosure()
        } else {
            return isVerifiedReturnValue
        }
    }
    //MARK: - requestVerification

    var requestVerificationUnderlyingCallsCount = 0
    var requestVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return requestVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = requestVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    requestVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var requestVerificationCalled: Bool {
        return requestVerificationCallsCount > 0
    }

    var requestVerificationUnderlyingReturnValue: Result<Void, SessionVerificationControllerProxyError>!
    var requestVerificationReturnValue: Result<Void, SessionVerificationControllerProxyError>! {
        get {
            if Thread.isMainThread {
                return requestVerificationUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, SessionVerificationControllerProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = requestVerificationUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestVerificationUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    requestVerificationUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var requestVerificationClosure: (() async -> Result<Void, SessionVerificationControllerProxyError>)?

    func requestVerification() async -> Result<Void, SessionVerificationControllerProxyError> {
        requestVerificationCallsCount += 1
        if let requestVerificationClosure = requestVerificationClosure {
            return await requestVerificationClosure()
        } else {
            return requestVerificationReturnValue
        }
    }
    //MARK: - startSasVerification

    var startSasVerificationUnderlyingCallsCount = 0
    var startSasVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startSasVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startSasVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startSasVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startSasVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var startSasVerificationCalled: Bool {
        return startSasVerificationCallsCount > 0
    }

    var startSasVerificationUnderlyingReturnValue: Result<Void, SessionVerificationControllerProxyError>!
    var startSasVerificationReturnValue: Result<Void, SessionVerificationControllerProxyError>! {
        get {
            if Thread.isMainThread {
                return startSasVerificationUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, SessionVerificationControllerProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = startSasVerificationUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startSasVerificationUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    startSasVerificationUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var startSasVerificationClosure: (() async -> Result<Void, SessionVerificationControllerProxyError>)?

    func startSasVerification() async -> Result<Void, SessionVerificationControllerProxyError> {
        startSasVerificationCallsCount += 1
        if let startSasVerificationClosure = startSasVerificationClosure {
            return await startSasVerificationClosure()
        } else {
            return startSasVerificationReturnValue
        }
    }
    //MARK: - approveVerification

    var approveVerificationUnderlyingCallsCount = 0
    var approveVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return approveVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = approveVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                approveVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    approveVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var approveVerificationCalled: Bool {
        return approveVerificationCallsCount > 0
    }

    var approveVerificationUnderlyingReturnValue: Result<Void, SessionVerificationControllerProxyError>!
    var approveVerificationReturnValue: Result<Void, SessionVerificationControllerProxyError>! {
        get {
            if Thread.isMainThread {
                return approveVerificationUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, SessionVerificationControllerProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = approveVerificationUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                approveVerificationUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    approveVerificationUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var approveVerificationClosure: (() async -> Result<Void, SessionVerificationControllerProxyError>)?

    func approveVerification() async -> Result<Void, SessionVerificationControllerProxyError> {
        approveVerificationCallsCount += 1
        if let approveVerificationClosure = approveVerificationClosure {
            return await approveVerificationClosure()
        } else {
            return approveVerificationReturnValue
        }
    }
    //MARK: - declineVerification

    var declineVerificationUnderlyingCallsCount = 0
    var declineVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return declineVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = declineVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                declineVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    declineVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var declineVerificationCalled: Bool {
        return declineVerificationCallsCount > 0
    }

    var declineVerificationUnderlyingReturnValue: Result<Void, SessionVerificationControllerProxyError>!
    var declineVerificationReturnValue: Result<Void, SessionVerificationControllerProxyError>! {
        get {
            if Thread.isMainThread {
                return declineVerificationUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, SessionVerificationControllerProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = declineVerificationUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                declineVerificationUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    declineVerificationUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var declineVerificationClosure: (() async -> Result<Void, SessionVerificationControllerProxyError>)?

    func declineVerification() async -> Result<Void, SessionVerificationControllerProxyError> {
        declineVerificationCallsCount += 1
        if let declineVerificationClosure = declineVerificationClosure {
            return await declineVerificationClosure()
        } else {
            return declineVerificationReturnValue
        }
    }
    //MARK: - cancelVerification

    var cancelVerificationUnderlyingCallsCount = 0
    var cancelVerificationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return cancelVerificationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = cancelVerificationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cancelVerificationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    cancelVerificationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var cancelVerificationCalled: Bool {
        return cancelVerificationCallsCount > 0
    }

    var cancelVerificationUnderlyingReturnValue: Result<Void, SessionVerificationControllerProxyError>!
    var cancelVerificationReturnValue: Result<Void, SessionVerificationControllerProxyError>! {
        get {
            if Thread.isMainThread {
                return cancelVerificationUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, SessionVerificationControllerProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = cancelVerificationUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cancelVerificationUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    cancelVerificationUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var cancelVerificationClosure: (() async -> Result<Void, SessionVerificationControllerProxyError>)?

    func cancelVerification() async -> Result<Void, SessionVerificationControllerProxyError> {
        cancelVerificationCallsCount += 1
        if let cancelVerificationClosure = cancelVerificationClosure {
            return await cancelVerificationClosure()
        } else {
            return cancelVerificationReturnValue
        }
    }
}
class TimelineProxyMock: TimelineProxyProtocol {
    var actions: AnyPublisher<TimelineProxyAction, Never> {
        get { return underlyingActions }
        set(value) { underlyingActions = value }
    }
    var underlyingActions: AnyPublisher<TimelineProxyAction, Never>!
    var isLive: Bool {
        get { return underlyingIsLive }
        set(value) { underlyingIsLive = value }
    }
    var underlyingIsLive: Bool!
    var timelineProvider: RoomTimelineProviderProtocol {
        get { return underlyingTimelineProvider }
        set(value) { underlyingTimelineProvider = value }
    }
    var underlyingTimelineProvider: RoomTimelineProviderProtocol!

    //MARK: - subscribeForUpdates

    var subscribeForUpdatesUnderlyingCallsCount = 0
    var subscribeForUpdatesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return subscribeForUpdatesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = subscribeForUpdatesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                subscribeForUpdatesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    subscribeForUpdatesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var subscribeForUpdatesCalled: Bool {
        return subscribeForUpdatesCallsCount > 0
    }
    var subscribeForUpdatesClosure: (() async -> Void)?

    func subscribeForUpdates() async {
        subscribeForUpdatesCallsCount += 1
        await subscribeForUpdatesClosure?()
    }
    //MARK: - cancelSend

    var cancelSendTransactionIDUnderlyingCallsCount = 0
    var cancelSendTransactionIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return cancelSendTransactionIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = cancelSendTransactionIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cancelSendTransactionIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    cancelSendTransactionIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var cancelSendTransactionIDCalled: Bool {
        return cancelSendTransactionIDCallsCount > 0
    }
    var cancelSendTransactionIDReceivedTransactionID: String?
    var cancelSendTransactionIDReceivedInvocations: [String] = []
    var cancelSendTransactionIDClosure: ((String) async -> Void)?

    func cancelSend(transactionID: String) async {
        cancelSendTransactionIDCallsCount += 1
        cancelSendTransactionIDReceivedTransactionID = transactionID
        cancelSendTransactionIDReceivedInvocations.append(transactionID)
        await cancelSendTransactionIDClosure?(transactionID)
    }
    //MARK: - editMessage

    var editMessageHtmlOriginalIntentionalMentionsUnderlyingCallsCount = 0
    var editMessageHtmlOriginalIntentionalMentionsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return editMessageHtmlOriginalIntentionalMentionsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = editMessageHtmlOriginalIntentionalMentionsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                editMessageHtmlOriginalIntentionalMentionsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    editMessageHtmlOriginalIntentionalMentionsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var editMessageHtmlOriginalIntentionalMentionsCalled: Bool {
        return editMessageHtmlOriginalIntentionalMentionsCallsCount > 0
    }
    var editMessageHtmlOriginalIntentionalMentionsReceivedArguments: (message: String, html: String?, eventID: String, intentionalMentions: IntentionalMentions)?
    var editMessageHtmlOriginalIntentionalMentionsReceivedInvocations: [(message: String, html: String?, eventID: String, intentionalMentions: IntentionalMentions)] = []

    var editMessageHtmlOriginalIntentionalMentionsUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var editMessageHtmlOriginalIntentionalMentionsReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return editMessageHtmlOriginalIntentionalMentionsUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = editMessageHtmlOriginalIntentionalMentionsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                editMessageHtmlOriginalIntentionalMentionsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    editMessageHtmlOriginalIntentionalMentionsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var editMessageHtmlOriginalIntentionalMentionsClosure: ((String, String?, String, IntentionalMentions) async -> Result<Void, TimelineProxyError>)?

    func editMessage(_ message: String, html: String?, original eventID: String, intentionalMentions: IntentionalMentions) async -> Result<Void, TimelineProxyError> {
        editMessageHtmlOriginalIntentionalMentionsCallsCount += 1
        editMessageHtmlOriginalIntentionalMentionsReceivedArguments = (message: message, html: html, eventID: eventID, intentionalMentions: intentionalMentions)
        editMessageHtmlOriginalIntentionalMentionsReceivedInvocations.append((message: message, html: html, eventID: eventID, intentionalMentions: intentionalMentions))
        if let editMessageHtmlOriginalIntentionalMentionsClosure = editMessageHtmlOriginalIntentionalMentionsClosure {
            return await editMessageHtmlOriginalIntentionalMentionsClosure(message, html, eventID, intentionalMentions)
        } else {
            return editMessageHtmlOriginalIntentionalMentionsReturnValue
        }
    }
    //MARK: - fetchDetails

    var fetchDetailsForUnderlyingCallsCount = 0
    var fetchDetailsForCallsCount: Int {
        get {
            if Thread.isMainThread {
                return fetchDetailsForUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = fetchDetailsForUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                fetchDetailsForUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    fetchDetailsForUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var fetchDetailsForCalled: Bool {
        return fetchDetailsForCallsCount > 0
    }
    var fetchDetailsForReceivedEventID: String?
    var fetchDetailsForReceivedInvocations: [String] = []
    var fetchDetailsForClosure: ((String) -> Void)?

    func fetchDetails(for eventID: String) {
        fetchDetailsForCallsCount += 1
        fetchDetailsForReceivedEventID = eventID
        fetchDetailsForReceivedInvocations.append(eventID)
        fetchDetailsForClosure?(eventID)
    }
    //MARK: - messageEventContent

    var messageEventContentForUnderlyingCallsCount = 0
    var messageEventContentForCallsCount: Int {
        get {
            if Thread.isMainThread {
                return messageEventContentForUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = messageEventContentForUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                messageEventContentForUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    messageEventContentForUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var messageEventContentForCalled: Bool {
        return messageEventContentForCallsCount > 0
    }
    var messageEventContentForReceivedEventID: String?
    var messageEventContentForReceivedInvocations: [String] = []

    var messageEventContentForUnderlyingReturnValue: RoomMessageEventContentWithoutRelation?
    var messageEventContentForReturnValue: RoomMessageEventContentWithoutRelation? {
        get {
            if Thread.isMainThread {
                return messageEventContentForUnderlyingReturnValue
            } else {
                var returnValue: RoomMessageEventContentWithoutRelation?? = nil
                DispatchQueue.main.sync {
                    returnValue = messageEventContentForUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                messageEventContentForUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    messageEventContentForUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var messageEventContentForClosure: ((String) -> RoomMessageEventContentWithoutRelation?)?

    func messageEventContent(for eventID: String) -> RoomMessageEventContentWithoutRelation? {
        messageEventContentForCallsCount += 1
        messageEventContentForReceivedEventID = eventID
        messageEventContentForReceivedInvocations.append(eventID)
        if let messageEventContentForClosure = messageEventContentForClosure {
            return messageEventContentForClosure(eventID)
        } else {
            return messageEventContentForReturnValue
        }
    }
    //MARK: - retryDecryption

    var retryDecryptionForUnderlyingCallsCount = 0
    var retryDecryptionForCallsCount: Int {
        get {
            if Thread.isMainThread {
                return retryDecryptionForUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = retryDecryptionForUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                retryDecryptionForUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    retryDecryptionForUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var retryDecryptionForCalled: Bool {
        return retryDecryptionForCallsCount > 0
    }
    var retryDecryptionForReceivedSessionID: String?
    var retryDecryptionForReceivedInvocations: [String] = []
    var retryDecryptionForClosure: ((String) async -> Void)?

    func retryDecryption(for sessionID: String) async {
        retryDecryptionForCallsCount += 1
        retryDecryptionForReceivedSessionID = sessionID
        retryDecryptionForReceivedInvocations.append(sessionID)
        await retryDecryptionForClosure?(sessionID)
    }
    //MARK: - retrySend

    var retrySendTransactionIDUnderlyingCallsCount = 0
    var retrySendTransactionIDCallsCount: Int {
        get {
            if Thread.isMainThread {
                return retrySendTransactionIDUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = retrySendTransactionIDUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                retrySendTransactionIDUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    retrySendTransactionIDUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var retrySendTransactionIDCalled: Bool {
        return retrySendTransactionIDCallsCount > 0
    }
    var retrySendTransactionIDReceivedTransactionID: String?
    var retrySendTransactionIDReceivedInvocations: [String] = []
    var retrySendTransactionIDClosure: ((String) async -> Void)?

    func retrySend(transactionID: String) async {
        retrySendTransactionIDCallsCount += 1
        retrySendTransactionIDReceivedTransactionID = transactionID
        retrySendTransactionIDReceivedInvocations.append(transactionID)
        await retrySendTransactionIDClosure?(transactionID)
    }
    //MARK: - paginateBackwards

    var paginateBackwardsRequestSizeUnderlyingCallsCount = 0
    var paginateBackwardsRequestSizeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return paginateBackwardsRequestSizeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = paginateBackwardsRequestSizeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                paginateBackwardsRequestSizeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    paginateBackwardsRequestSizeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var paginateBackwardsRequestSizeCalled: Bool {
        return paginateBackwardsRequestSizeCallsCount > 0
    }
    var paginateBackwardsRequestSizeReceivedRequestSize: UInt16?
    var paginateBackwardsRequestSizeReceivedInvocations: [UInt16] = []

    var paginateBackwardsRequestSizeUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var paginateBackwardsRequestSizeReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return paginateBackwardsRequestSizeUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = paginateBackwardsRequestSizeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                paginateBackwardsRequestSizeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    paginateBackwardsRequestSizeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var paginateBackwardsRequestSizeClosure: ((UInt16) async -> Result<Void, TimelineProxyError>)?

    func paginateBackwards(requestSize: UInt16) async -> Result<Void, TimelineProxyError> {
        paginateBackwardsRequestSizeCallsCount += 1
        paginateBackwardsRequestSizeReceivedRequestSize = requestSize
        paginateBackwardsRequestSizeReceivedInvocations.append(requestSize)
        if let paginateBackwardsRequestSizeClosure = paginateBackwardsRequestSizeClosure {
            return await paginateBackwardsRequestSizeClosure(requestSize)
        } else {
            return paginateBackwardsRequestSizeReturnValue
        }
    }
    //MARK: - paginateForwards

    var paginateForwardsRequestSizeUnderlyingCallsCount = 0
    var paginateForwardsRequestSizeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return paginateForwardsRequestSizeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = paginateForwardsRequestSizeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                paginateForwardsRequestSizeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    paginateForwardsRequestSizeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var paginateForwardsRequestSizeCalled: Bool {
        return paginateForwardsRequestSizeCallsCount > 0
    }
    var paginateForwardsRequestSizeReceivedRequestSize: UInt16?
    var paginateForwardsRequestSizeReceivedInvocations: [UInt16] = []

    var paginateForwardsRequestSizeUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var paginateForwardsRequestSizeReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return paginateForwardsRequestSizeUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = paginateForwardsRequestSizeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                paginateForwardsRequestSizeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    paginateForwardsRequestSizeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var paginateForwardsRequestSizeClosure: ((UInt16) async -> Result<Void, TimelineProxyError>)?

    func paginateForwards(requestSize: UInt16) async -> Result<Void, TimelineProxyError> {
        paginateForwardsRequestSizeCallsCount += 1
        paginateForwardsRequestSizeReceivedRequestSize = requestSize
        paginateForwardsRequestSizeReceivedInvocations.append(requestSize)
        if let paginateForwardsRequestSizeClosure = paginateForwardsRequestSizeClosure {
            return await paginateForwardsRequestSizeClosure(requestSize)
        } else {
            return paginateForwardsRequestSizeReturnValue
        }
    }
    //MARK: - sendAudio

    var sendAudioUrlAudioInfoProgressSubjectRequestHandleUnderlyingCallsCount = 0
    var sendAudioUrlAudioInfoProgressSubjectRequestHandleCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendAudioUrlAudioInfoProgressSubjectRequestHandleUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendAudioUrlAudioInfoProgressSubjectRequestHandleUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendAudioUrlAudioInfoProgressSubjectRequestHandleUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendAudioUrlAudioInfoProgressSubjectRequestHandleUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendAudioUrlAudioInfoProgressSubjectRequestHandleCalled: Bool {
        return sendAudioUrlAudioInfoProgressSubjectRequestHandleCallsCount > 0
    }

    var sendAudioUrlAudioInfoProgressSubjectRequestHandleUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var sendAudioUrlAudioInfoProgressSubjectRequestHandleReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return sendAudioUrlAudioInfoProgressSubjectRequestHandleUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendAudioUrlAudioInfoProgressSubjectRequestHandleUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendAudioUrlAudioInfoProgressSubjectRequestHandleUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendAudioUrlAudioInfoProgressSubjectRequestHandleUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendAudioUrlAudioInfoProgressSubjectRequestHandleClosure: ((URL, AudioInfo, CurrentValueSubject<Double, Never>?, @MainActor (SendAttachmentJoinHandleProtocol) -> Void) async -> Result<Void, TimelineProxyError>)?

    func sendAudio(url: URL, audioInfo: AudioInfo, progressSubject: CurrentValueSubject<Double, Never>?, requestHandle: @MainActor (SendAttachmentJoinHandleProtocol) -> Void) async -> Result<Void, TimelineProxyError> {
        sendAudioUrlAudioInfoProgressSubjectRequestHandleCallsCount += 1
        if let sendAudioUrlAudioInfoProgressSubjectRequestHandleClosure = sendAudioUrlAudioInfoProgressSubjectRequestHandleClosure {
            return await sendAudioUrlAudioInfoProgressSubjectRequestHandleClosure(url, audioInfo, progressSubject, requestHandle)
        } else {
            return sendAudioUrlAudioInfoProgressSubjectRequestHandleReturnValue
        }
    }
    //MARK: - sendFile

    var sendFileUrlFileInfoProgressSubjectRequestHandleUnderlyingCallsCount = 0
    var sendFileUrlFileInfoProgressSubjectRequestHandleCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendFileUrlFileInfoProgressSubjectRequestHandleUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendFileUrlFileInfoProgressSubjectRequestHandleUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendFileUrlFileInfoProgressSubjectRequestHandleUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendFileUrlFileInfoProgressSubjectRequestHandleUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendFileUrlFileInfoProgressSubjectRequestHandleCalled: Bool {
        return sendFileUrlFileInfoProgressSubjectRequestHandleCallsCount > 0
    }

    var sendFileUrlFileInfoProgressSubjectRequestHandleUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var sendFileUrlFileInfoProgressSubjectRequestHandleReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return sendFileUrlFileInfoProgressSubjectRequestHandleUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendFileUrlFileInfoProgressSubjectRequestHandleUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendFileUrlFileInfoProgressSubjectRequestHandleUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendFileUrlFileInfoProgressSubjectRequestHandleUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendFileUrlFileInfoProgressSubjectRequestHandleClosure: ((URL, FileInfo, CurrentValueSubject<Double, Never>?, @MainActor (SendAttachmentJoinHandleProtocol) -> Void) async -> Result<Void, TimelineProxyError>)?

    func sendFile(url: URL, fileInfo: FileInfo, progressSubject: CurrentValueSubject<Double, Never>?, requestHandle: @MainActor (SendAttachmentJoinHandleProtocol) -> Void) async -> Result<Void, TimelineProxyError> {
        sendFileUrlFileInfoProgressSubjectRequestHandleCallsCount += 1
        if let sendFileUrlFileInfoProgressSubjectRequestHandleClosure = sendFileUrlFileInfoProgressSubjectRequestHandleClosure {
            return await sendFileUrlFileInfoProgressSubjectRequestHandleClosure(url, fileInfo, progressSubject, requestHandle)
        } else {
            return sendFileUrlFileInfoProgressSubjectRequestHandleReturnValue
        }
    }
    //MARK: - sendImage

    var sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleUnderlyingCallsCount = 0
    var sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleCalled: Bool {
        return sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleCallsCount > 0
    }

    var sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleClosure: ((URL, URL, ImageInfo, CurrentValueSubject<Double, Never>?, @MainActor (SendAttachmentJoinHandleProtocol) -> Void) async -> Result<Void, TimelineProxyError>)?

    func sendImage(url: URL, thumbnailURL: URL, imageInfo: ImageInfo, progressSubject: CurrentValueSubject<Double, Never>?, requestHandle: @MainActor (SendAttachmentJoinHandleProtocol) -> Void) async -> Result<Void, TimelineProxyError> {
        sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleCallsCount += 1
        if let sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleClosure = sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleClosure {
            return await sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleClosure(url, thumbnailURL, imageInfo, progressSubject, requestHandle)
        } else {
            return sendImageUrlThumbnailURLImageInfoProgressSubjectRequestHandleReturnValue
        }
    }
    //MARK: - sendLocation

    var sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeUnderlyingCallsCount = 0
    var sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeCalled: Bool {
        return sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeCallsCount > 0
    }
    var sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeReceivedArguments: (body: String, geoURI: GeoURI, description: String?, zoomLevel: UInt8?, assetType: AssetType?)?
    var sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeReceivedInvocations: [(body: String, geoURI: GeoURI, description: String?, zoomLevel: UInt8?, assetType: AssetType?)] = []

    var sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeClosure: ((String, GeoURI, String?, UInt8?, AssetType?) async -> Result<Void, TimelineProxyError>)?

    func sendLocation(body: String, geoURI: GeoURI, description: String?, zoomLevel: UInt8?, assetType: AssetType?) async -> Result<Void, TimelineProxyError> {
        sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeCallsCount += 1
        sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeReceivedArguments = (body: body, geoURI: geoURI, description: description, zoomLevel: zoomLevel, assetType: assetType)
        sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeReceivedInvocations.append((body: body, geoURI: geoURI, description: description, zoomLevel: zoomLevel, assetType: assetType))
        if let sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeClosure = sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeClosure {
            return await sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeClosure(body, geoURI, description, zoomLevel, assetType)
        } else {
            return sendLocationBodyGeoURIDescriptionZoomLevelAssetTypeReturnValue
        }
    }
    //MARK: - sendVideo

    var sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleUnderlyingCallsCount = 0
    var sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleCalled: Bool {
        return sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleCallsCount > 0
    }

    var sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleClosure: ((URL, URL, VideoInfo, CurrentValueSubject<Double, Never>?, @MainActor (SendAttachmentJoinHandleProtocol) -> Void) async -> Result<Void, TimelineProxyError>)?

    func sendVideo(url: URL, thumbnailURL: URL, videoInfo: VideoInfo, progressSubject: CurrentValueSubject<Double, Never>?, requestHandle: @MainActor (SendAttachmentJoinHandleProtocol) -> Void) async -> Result<Void, TimelineProxyError> {
        sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleCallsCount += 1
        if let sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleClosure = sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleClosure {
            return await sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleClosure(url, thumbnailURL, videoInfo, progressSubject, requestHandle)
        } else {
            return sendVideoUrlThumbnailURLVideoInfoProgressSubjectRequestHandleReturnValue
        }
    }
    //MARK: - sendVoiceMessage

    var sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleUnderlyingCallsCount = 0
    var sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleCalled: Bool {
        return sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleCallsCount > 0
    }

    var sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleClosure: ((URL, AudioInfo, [UInt16], CurrentValueSubject<Double, Never>?, @MainActor (SendAttachmentJoinHandleProtocol) -> Void) async -> Result<Void, TimelineProxyError>)?

    func sendVoiceMessage(url: URL, audioInfo: AudioInfo, waveform: [UInt16], progressSubject: CurrentValueSubject<Double, Never>?, requestHandle: @MainActor (SendAttachmentJoinHandleProtocol) -> Void) async -> Result<Void, TimelineProxyError> {
        sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleCallsCount += 1
        if let sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleClosure = sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleClosure {
            return await sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleClosure(url, audioInfo, waveform, progressSubject, requestHandle)
        } else {
            return sendVoiceMessageUrlAudioInfoWaveformProgressSubjectRequestHandleReturnValue
        }
    }
    //MARK: - sendReadReceipt

    var sendReadReceiptForTypeUnderlyingCallsCount = 0
    var sendReadReceiptForTypeCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendReadReceiptForTypeUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendReadReceiptForTypeUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendReadReceiptForTypeUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendReadReceiptForTypeUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendReadReceiptForTypeCalled: Bool {
        return sendReadReceiptForTypeCallsCount > 0
    }
    var sendReadReceiptForTypeReceivedArguments: (eventID: String, type: ReceiptType)?
    var sendReadReceiptForTypeReceivedInvocations: [(eventID: String, type: ReceiptType)] = []

    var sendReadReceiptForTypeUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var sendReadReceiptForTypeReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return sendReadReceiptForTypeUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendReadReceiptForTypeUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendReadReceiptForTypeUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendReadReceiptForTypeUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendReadReceiptForTypeClosure: ((String, ReceiptType) async -> Result<Void, TimelineProxyError>)?

    func sendReadReceipt(for eventID: String, type: ReceiptType) async -> Result<Void, TimelineProxyError> {
        sendReadReceiptForTypeCallsCount += 1
        sendReadReceiptForTypeReceivedArguments = (eventID: eventID, type: type)
        sendReadReceiptForTypeReceivedInvocations.append((eventID: eventID, type: type))
        if let sendReadReceiptForTypeClosure = sendReadReceiptForTypeClosure {
            return await sendReadReceiptForTypeClosure(eventID, type)
        } else {
            return sendReadReceiptForTypeReturnValue
        }
    }
    //MARK: - sendMessageEventContent

    var sendMessageEventContentUnderlyingCallsCount = 0
    var sendMessageEventContentCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendMessageEventContentUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendMessageEventContentUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendMessageEventContentUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendMessageEventContentUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendMessageEventContentCalled: Bool {
        return sendMessageEventContentCallsCount > 0
    }
    var sendMessageEventContentReceivedMessageContent: RoomMessageEventContentWithoutRelation?
    var sendMessageEventContentReceivedInvocations: [RoomMessageEventContentWithoutRelation] = []

    var sendMessageEventContentUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var sendMessageEventContentReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return sendMessageEventContentUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendMessageEventContentUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendMessageEventContentUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendMessageEventContentUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendMessageEventContentClosure: ((RoomMessageEventContentWithoutRelation) async -> Result<Void, TimelineProxyError>)?

    func sendMessageEventContent(_ messageContent: RoomMessageEventContentWithoutRelation) async -> Result<Void, TimelineProxyError> {
        sendMessageEventContentCallsCount += 1
        sendMessageEventContentReceivedMessageContent = messageContent
        sendMessageEventContentReceivedInvocations.append(messageContent)
        if let sendMessageEventContentClosure = sendMessageEventContentClosure {
            return await sendMessageEventContentClosure(messageContent)
        } else {
            return sendMessageEventContentReturnValue
        }
    }
    //MARK: - sendMessage

    var sendMessageHtmlInReplyToIntentionalMentionsUnderlyingCallsCount = 0
    var sendMessageHtmlInReplyToIntentionalMentionsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendMessageHtmlInReplyToIntentionalMentionsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendMessageHtmlInReplyToIntentionalMentionsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendMessageHtmlInReplyToIntentionalMentionsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendMessageHtmlInReplyToIntentionalMentionsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendMessageHtmlInReplyToIntentionalMentionsCalled: Bool {
        return sendMessageHtmlInReplyToIntentionalMentionsCallsCount > 0
    }
    var sendMessageHtmlInReplyToIntentionalMentionsReceivedArguments: (message: String, html: String?, eventID: String?, intentionalMentions: IntentionalMentions)?
    var sendMessageHtmlInReplyToIntentionalMentionsReceivedInvocations: [(message: String, html: String?, eventID: String?, intentionalMentions: IntentionalMentions)] = []

    var sendMessageHtmlInReplyToIntentionalMentionsUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var sendMessageHtmlInReplyToIntentionalMentionsReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return sendMessageHtmlInReplyToIntentionalMentionsUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendMessageHtmlInReplyToIntentionalMentionsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendMessageHtmlInReplyToIntentionalMentionsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendMessageHtmlInReplyToIntentionalMentionsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendMessageHtmlInReplyToIntentionalMentionsClosure: ((String, String?, String?, IntentionalMentions) async -> Result<Void, TimelineProxyError>)?

    func sendMessage(_ message: String, html: String?, inReplyTo eventID: String?, intentionalMentions: IntentionalMentions) async -> Result<Void, TimelineProxyError> {
        sendMessageHtmlInReplyToIntentionalMentionsCallsCount += 1
        sendMessageHtmlInReplyToIntentionalMentionsReceivedArguments = (message: message, html: html, eventID: eventID, intentionalMentions: intentionalMentions)
        sendMessageHtmlInReplyToIntentionalMentionsReceivedInvocations.append((message: message, html: html, eventID: eventID, intentionalMentions: intentionalMentions))
        if let sendMessageHtmlInReplyToIntentionalMentionsClosure = sendMessageHtmlInReplyToIntentionalMentionsClosure {
            return await sendMessageHtmlInReplyToIntentionalMentionsClosure(message, html, eventID, intentionalMentions)
        } else {
            return sendMessageHtmlInReplyToIntentionalMentionsReturnValue
        }
    }
    //MARK: - toggleReaction

    var toggleReactionToUnderlyingCallsCount = 0
    var toggleReactionToCallsCount: Int {
        get {
            if Thread.isMainThread {
                return toggleReactionToUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = toggleReactionToUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                toggleReactionToUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    toggleReactionToUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var toggleReactionToCalled: Bool {
        return toggleReactionToCallsCount > 0
    }
    var toggleReactionToReceivedArguments: (reaction: String, eventID: String)?
    var toggleReactionToReceivedInvocations: [(reaction: String, eventID: String)] = []

    var toggleReactionToUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var toggleReactionToReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return toggleReactionToUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = toggleReactionToUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                toggleReactionToUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    toggleReactionToUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var toggleReactionToClosure: ((String, String) async -> Result<Void, TimelineProxyError>)?

    func toggleReaction(_ reaction: String, to eventID: String) async -> Result<Void, TimelineProxyError> {
        toggleReactionToCallsCount += 1
        toggleReactionToReceivedArguments = (reaction: reaction, eventID: eventID)
        toggleReactionToReceivedInvocations.append((reaction: reaction, eventID: eventID))
        if let toggleReactionToClosure = toggleReactionToClosure {
            return await toggleReactionToClosure(reaction, eventID)
        } else {
            return toggleReactionToReturnValue
        }
    }
    //MARK: - createPoll

    var createPollQuestionAnswersPollKindUnderlyingCallsCount = 0
    var createPollQuestionAnswersPollKindCallsCount: Int {
        get {
            if Thread.isMainThread {
                return createPollQuestionAnswersPollKindUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = createPollQuestionAnswersPollKindUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createPollQuestionAnswersPollKindUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    createPollQuestionAnswersPollKindUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var createPollQuestionAnswersPollKindCalled: Bool {
        return createPollQuestionAnswersPollKindCallsCount > 0
    }
    var createPollQuestionAnswersPollKindReceivedArguments: (question: String, answers: [String], pollKind: Poll.Kind)?
    var createPollQuestionAnswersPollKindReceivedInvocations: [(question: String, answers: [String], pollKind: Poll.Kind)] = []

    var createPollQuestionAnswersPollKindUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var createPollQuestionAnswersPollKindReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return createPollQuestionAnswersPollKindUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = createPollQuestionAnswersPollKindUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                createPollQuestionAnswersPollKindUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    createPollQuestionAnswersPollKindUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var createPollQuestionAnswersPollKindClosure: ((String, [String], Poll.Kind) async -> Result<Void, TimelineProxyError>)?

    func createPoll(question: String, answers: [String], pollKind: Poll.Kind) async -> Result<Void, TimelineProxyError> {
        createPollQuestionAnswersPollKindCallsCount += 1
        createPollQuestionAnswersPollKindReceivedArguments = (question: question, answers: answers, pollKind: pollKind)
        createPollQuestionAnswersPollKindReceivedInvocations.append((question: question, answers: answers, pollKind: pollKind))
        if let createPollQuestionAnswersPollKindClosure = createPollQuestionAnswersPollKindClosure {
            return await createPollQuestionAnswersPollKindClosure(question, answers, pollKind)
        } else {
            return createPollQuestionAnswersPollKindReturnValue
        }
    }
    //MARK: - editPoll

    var editPollOriginalQuestionAnswersPollKindUnderlyingCallsCount = 0
    var editPollOriginalQuestionAnswersPollKindCallsCount: Int {
        get {
            if Thread.isMainThread {
                return editPollOriginalQuestionAnswersPollKindUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = editPollOriginalQuestionAnswersPollKindUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                editPollOriginalQuestionAnswersPollKindUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    editPollOriginalQuestionAnswersPollKindUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var editPollOriginalQuestionAnswersPollKindCalled: Bool {
        return editPollOriginalQuestionAnswersPollKindCallsCount > 0
    }
    var editPollOriginalQuestionAnswersPollKindReceivedArguments: (eventID: String, question: String, answers: [String], pollKind: Poll.Kind)?
    var editPollOriginalQuestionAnswersPollKindReceivedInvocations: [(eventID: String, question: String, answers: [String], pollKind: Poll.Kind)] = []

    var editPollOriginalQuestionAnswersPollKindUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var editPollOriginalQuestionAnswersPollKindReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return editPollOriginalQuestionAnswersPollKindUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = editPollOriginalQuestionAnswersPollKindUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                editPollOriginalQuestionAnswersPollKindUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    editPollOriginalQuestionAnswersPollKindUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var editPollOriginalQuestionAnswersPollKindClosure: ((String, String, [String], Poll.Kind) async -> Result<Void, TimelineProxyError>)?

    func editPoll(original eventID: String, question: String, answers: [String], pollKind: Poll.Kind) async -> Result<Void, TimelineProxyError> {
        editPollOriginalQuestionAnswersPollKindCallsCount += 1
        editPollOriginalQuestionAnswersPollKindReceivedArguments = (eventID: eventID, question: question, answers: answers, pollKind: pollKind)
        editPollOriginalQuestionAnswersPollKindReceivedInvocations.append((eventID: eventID, question: question, answers: answers, pollKind: pollKind))
        if let editPollOriginalQuestionAnswersPollKindClosure = editPollOriginalQuestionAnswersPollKindClosure {
            return await editPollOriginalQuestionAnswersPollKindClosure(eventID, question, answers, pollKind)
        } else {
            return editPollOriginalQuestionAnswersPollKindReturnValue
        }
    }
    //MARK: - endPoll

    var endPollPollStartIDTextUnderlyingCallsCount = 0
    var endPollPollStartIDTextCallsCount: Int {
        get {
            if Thread.isMainThread {
                return endPollPollStartIDTextUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = endPollPollStartIDTextUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                endPollPollStartIDTextUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    endPollPollStartIDTextUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var endPollPollStartIDTextCalled: Bool {
        return endPollPollStartIDTextCallsCount > 0
    }
    var endPollPollStartIDTextReceivedArguments: (pollStartID: String, text: String)?
    var endPollPollStartIDTextReceivedInvocations: [(pollStartID: String, text: String)] = []

    var endPollPollStartIDTextUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var endPollPollStartIDTextReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return endPollPollStartIDTextUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = endPollPollStartIDTextUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                endPollPollStartIDTextUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    endPollPollStartIDTextUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var endPollPollStartIDTextClosure: ((String, String) async -> Result<Void, TimelineProxyError>)?

    func endPoll(pollStartID: String, text: String) async -> Result<Void, TimelineProxyError> {
        endPollPollStartIDTextCallsCount += 1
        endPollPollStartIDTextReceivedArguments = (pollStartID: pollStartID, text: text)
        endPollPollStartIDTextReceivedInvocations.append((pollStartID: pollStartID, text: text))
        if let endPollPollStartIDTextClosure = endPollPollStartIDTextClosure {
            return await endPollPollStartIDTextClosure(pollStartID, text)
        } else {
            return endPollPollStartIDTextReturnValue
        }
    }
    //MARK: - sendPollResponse

    var sendPollResponsePollStartIDAnswersUnderlyingCallsCount = 0
    var sendPollResponsePollStartIDAnswersCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendPollResponsePollStartIDAnswersUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendPollResponsePollStartIDAnswersUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendPollResponsePollStartIDAnswersUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendPollResponsePollStartIDAnswersUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendPollResponsePollStartIDAnswersCalled: Bool {
        return sendPollResponsePollStartIDAnswersCallsCount > 0
    }
    var sendPollResponsePollStartIDAnswersReceivedArguments: (pollStartID: String, answers: [String])?
    var sendPollResponsePollStartIDAnswersReceivedInvocations: [(pollStartID: String, answers: [String])] = []

    var sendPollResponsePollStartIDAnswersUnderlyingReturnValue: Result<Void, TimelineProxyError>!
    var sendPollResponsePollStartIDAnswersReturnValue: Result<Void, TimelineProxyError>! {
        get {
            if Thread.isMainThread {
                return sendPollResponsePollStartIDAnswersUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, TimelineProxyError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendPollResponsePollStartIDAnswersUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendPollResponsePollStartIDAnswersUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendPollResponsePollStartIDAnswersUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendPollResponsePollStartIDAnswersClosure: ((String, [String]) async -> Result<Void, TimelineProxyError>)?

    func sendPollResponse(pollStartID: String, answers: [String]) async -> Result<Void, TimelineProxyError> {
        sendPollResponsePollStartIDAnswersCallsCount += 1
        sendPollResponsePollStartIDAnswersReceivedArguments = (pollStartID: pollStartID, answers: answers)
        sendPollResponsePollStartIDAnswersReceivedInvocations.append((pollStartID: pollStartID, answers: answers))
        if let sendPollResponsePollStartIDAnswersClosure = sendPollResponsePollStartIDAnswersClosure {
            return await sendPollResponsePollStartIDAnswersClosure(pollStartID, answers)
        } else {
            return sendPollResponsePollStartIDAnswersReturnValue
        }
    }
}
class UserDiscoveryServiceMock: UserDiscoveryServiceProtocol {

    //MARK: - searchProfiles

    var searchProfilesWithUnderlyingCallsCount = 0
    var searchProfilesWithCallsCount: Int {
        get {
            if Thread.isMainThread {
                return searchProfilesWithUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = searchProfilesWithUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                searchProfilesWithUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    searchProfilesWithUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var searchProfilesWithCalled: Bool {
        return searchProfilesWithCallsCount > 0
    }
    var searchProfilesWithReceivedSearchQuery: String?
    var searchProfilesWithReceivedInvocations: [String] = []

    var searchProfilesWithUnderlyingReturnValue: Result<[UserProfileProxy], UserDiscoveryErrorType>!
    var searchProfilesWithReturnValue: Result<[UserProfileProxy], UserDiscoveryErrorType>! {
        get {
            if Thread.isMainThread {
                return searchProfilesWithUnderlyingReturnValue
            } else {
                var returnValue: Result<[UserProfileProxy], UserDiscoveryErrorType>? = nil
                DispatchQueue.main.sync {
                    returnValue = searchProfilesWithUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                searchProfilesWithUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    searchProfilesWithUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var searchProfilesWithClosure: ((String) async -> Result<[UserProfileProxy], UserDiscoveryErrorType>)?

    func searchProfiles(with searchQuery: String) async -> Result<[UserProfileProxy], UserDiscoveryErrorType> {
        searchProfilesWithCallsCount += 1
        searchProfilesWithReceivedSearchQuery = searchQuery
        searchProfilesWithReceivedInvocations.append(searchQuery)
        if let searchProfilesWithClosure = searchProfilesWithClosure {
            return await searchProfilesWithClosure(searchQuery)
        } else {
            return searchProfilesWithReturnValue
        }
    }
}
class UserIndicatorControllerMock: UserIndicatorControllerProtocol {
    var window: UIWindow?
    var alertInfo: AlertInfo<UUID>?

    //MARK: - submitIndicator

    var submitIndicatorDelayUnderlyingCallsCount = 0
    var submitIndicatorDelayCallsCount: Int {
        get {
            if Thread.isMainThread {
                return submitIndicatorDelayUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = submitIndicatorDelayUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                submitIndicatorDelayUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    submitIndicatorDelayUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var submitIndicatorDelayCalled: Bool {
        return submitIndicatorDelayCallsCount > 0
    }
    var submitIndicatorDelayReceivedArguments: (indicator: UserIndicator, delay: Duration?)?
    var submitIndicatorDelayReceivedInvocations: [(indicator: UserIndicator, delay: Duration?)] = []
    var submitIndicatorDelayClosure: ((UserIndicator, Duration?) -> Void)?

    func submitIndicator(_ indicator: UserIndicator, delay: Duration?) {
        submitIndicatorDelayCallsCount += 1
        submitIndicatorDelayReceivedArguments = (indicator: indicator, delay: delay)
        submitIndicatorDelayReceivedInvocations.append((indicator: indicator, delay: delay))
        submitIndicatorDelayClosure?(indicator, delay)
    }
    //MARK: - retractIndicatorWithId

    var retractIndicatorWithIdUnderlyingCallsCount = 0
    var retractIndicatorWithIdCallsCount: Int {
        get {
            if Thread.isMainThread {
                return retractIndicatorWithIdUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = retractIndicatorWithIdUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                retractIndicatorWithIdUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    retractIndicatorWithIdUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var retractIndicatorWithIdCalled: Bool {
        return retractIndicatorWithIdCallsCount > 0
    }
    var retractIndicatorWithIdReceivedId: String?
    var retractIndicatorWithIdReceivedInvocations: [String] = []
    var retractIndicatorWithIdClosure: ((String) -> Void)?

    func retractIndicatorWithId(_ id: String) {
        retractIndicatorWithIdCallsCount += 1
        retractIndicatorWithIdReceivedId = id
        retractIndicatorWithIdReceivedInvocations.append(id)
        retractIndicatorWithIdClosure?(id)
    }
    //MARK: - retractAllIndicators

    var retractAllIndicatorsUnderlyingCallsCount = 0
    var retractAllIndicatorsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return retractAllIndicatorsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = retractAllIndicatorsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                retractAllIndicatorsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    retractAllIndicatorsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var retractAllIndicatorsCalled: Bool {
        return retractAllIndicatorsCallsCount > 0
    }
    var retractAllIndicatorsClosure: (() -> Void)?

    func retractAllIndicators() {
        retractAllIndicatorsCallsCount += 1
        retractAllIndicatorsClosure?()
    }
    //MARK: - start

    var startUnderlyingCallsCount = 0
    var startCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var startCalled: Bool {
        return startCallsCount > 0
    }
    var startClosure: (() -> Void)?

    func start() {
        startCallsCount += 1
        startClosure?()
    }
    //MARK: - stop

    var stopUnderlyingCallsCount = 0
    var stopCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stopUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stopUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stopUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stopUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var stopCalled: Bool {
        return stopCallsCount > 0
    }
    var stopClosure: (() -> Void)?

    func stop() {
        stopCallsCount += 1
        stopClosure?()
    }
    //MARK: - toPresentable

    var toPresentableUnderlyingCallsCount = 0
    var toPresentableCallsCount: Int {
        get {
            if Thread.isMainThread {
                return toPresentableUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = toPresentableUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                toPresentableUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    toPresentableUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var toPresentableCalled: Bool {
        return toPresentableCallsCount > 0
    }

    var toPresentableUnderlyingReturnValue: AnyView!
    var toPresentableReturnValue: AnyView! {
        get {
            if Thread.isMainThread {
                return toPresentableUnderlyingReturnValue
            } else {
                var returnValue: AnyView? = nil
                DispatchQueue.main.sync {
                    returnValue = toPresentableUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                toPresentableUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    toPresentableUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var toPresentableClosure: (() -> AnyView)?

    func toPresentable() -> AnyView {
        toPresentableCallsCount += 1
        if let toPresentableClosure = toPresentableClosure {
            return toPresentableClosure()
        } else {
            return toPresentableReturnValue
        }
    }
}
class UserNotificationCenterMock: UserNotificationCenterProtocol {
    weak var delegate: UNUserNotificationCenterDelegate?

    //MARK: - add

    var addThrowableError: Error?
    var addUnderlyingCallsCount = 0
    var addCallsCount: Int {
        get {
            if Thread.isMainThread {
                return addUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = addUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                addUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    addUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var addCalled: Bool {
        return addCallsCount > 0
    }
    var addReceivedRequest: UNNotificationRequest?
    var addReceivedInvocations: [UNNotificationRequest] = []
    var addClosure: ((UNNotificationRequest) async throws -> Void)?

    func add(_ request: UNNotificationRequest) async throws {
        if let error = addThrowableError {
            throw error
        }
        addCallsCount += 1
        addReceivedRequest = request
        addReceivedInvocations.append(request)
        try await addClosure?(request)
    }
    //MARK: - requestAuthorization

    var requestAuthorizationOptionsThrowableError: Error?
    var requestAuthorizationOptionsUnderlyingCallsCount = 0
    var requestAuthorizationOptionsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return requestAuthorizationOptionsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = requestAuthorizationOptionsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestAuthorizationOptionsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    requestAuthorizationOptionsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var requestAuthorizationOptionsCalled: Bool {
        return requestAuthorizationOptionsCallsCount > 0
    }
    var requestAuthorizationOptionsReceivedOptions: UNAuthorizationOptions?
    var requestAuthorizationOptionsReceivedInvocations: [UNAuthorizationOptions] = []

    var requestAuthorizationOptionsUnderlyingReturnValue: Bool!
    var requestAuthorizationOptionsReturnValue: Bool! {
        get {
            if Thread.isMainThread {
                return requestAuthorizationOptionsUnderlyingReturnValue
            } else {
                var returnValue: Bool? = nil
                DispatchQueue.main.sync {
                    returnValue = requestAuthorizationOptionsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                requestAuthorizationOptionsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    requestAuthorizationOptionsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var requestAuthorizationOptionsClosure: ((UNAuthorizationOptions) async throws -> Bool)?

    func requestAuthorization(options: UNAuthorizationOptions) async throws -> Bool {
        if let error = requestAuthorizationOptionsThrowableError {
            throw error
        }
        requestAuthorizationOptionsCallsCount += 1
        requestAuthorizationOptionsReceivedOptions = options
        requestAuthorizationOptionsReceivedInvocations.append(options)
        if let requestAuthorizationOptionsClosure = requestAuthorizationOptionsClosure {
            return try await requestAuthorizationOptionsClosure(options)
        } else {
            return requestAuthorizationOptionsReturnValue
        }
    }
    //MARK: - deliveredNotifications

    var deliveredNotificationsUnderlyingCallsCount = 0
    var deliveredNotificationsCallsCount: Int {
        get {
            if Thread.isMainThread {
                return deliveredNotificationsUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = deliveredNotificationsUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                deliveredNotificationsUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    deliveredNotificationsUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var deliveredNotificationsCalled: Bool {
        return deliveredNotificationsCallsCount > 0
    }

    var deliveredNotificationsUnderlyingReturnValue: [UNNotification]!
    var deliveredNotificationsReturnValue: [UNNotification]! {
        get {
            if Thread.isMainThread {
                return deliveredNotificationsUnderlyingReturnValue
            } else {
                var returnValue: [UNNotification]? = nil
                DispatchQueue.main.sync {
                    returnValue = deliveredNotificationsUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                deliveredNotificationsUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    deliveredNotificationsUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var deliveredNotificationsClosure: (() async -> [UNNotification])?

    func deliveredNotifications() async -> [UNNotification] {
        deliveredNotificationsCallsCount += 1
        if let deliveredNotificationsClosure = deliveredNotificationsClosure {
            return await deliveredNotificationsClosure()
        } else {
            return deliveredNotificationsReturnValue
        }
    }
    //MARK: - removeDeliveredNotifications

    var removeDeliveredNotificationsWithIdentifiersUnderlyingCallsCount = 0
    var removeDeliveredNotificationsWithIdentifiersCallsCount: Int {
        get {
            if Thread.isMainThread {
                return removeDeliveredNotificationsWithIdentifiersUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = removeDeliveredNotificationsWithIdentifiersUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                removeDeliveredNotificationsWithIdentifiersUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    removeDeliveredNotificationsWithIdentifiersUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var removeDeliveredNotificationsWithIdentifiersCalled: Bool {
        return removeDeliveredNotificationsWithIdentifiersCallsCount > 0
    }
    var removeDeliveredNotificationsWithIdentifiersReceivedIdentifiers: [String]?
    var removeDeliveredNotificationsWithIdentifiersReceivedInvocations: [[String]] = []
    var removeDeliveredNotificationsWithIdentifiersClosure: (([String]) -> Void)?

    func removeDeliveredNotifications(withIdentifiers identifiers: [String]) {
        removeDeliveredNotificationsWithIdentifiersCallsCount += 1
        removeDeliveredNotificationsWithIdentifiersReceivedIdentifiers = identifiers
        removeDeliveredNotificationsWithIdentifiersReceivedInvocations.append(identifiers)
        removeDeliveredNotificationsWithIdentifiersClosure?(identifiers)
    }
    //MARK: - setNotificationCategories

    var setNotificationCategoriesUnderlyingCallsCount = 0
    var setNotificationCategoriesCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setNotificationCategoriesUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setNotificationCategoriesUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setNotificationCategoriesUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setNotificationCategoriesUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setNotificationCategoriesCalled: Bool {
        return setNotificationCategoriesCallsCount > 0
    }
    var setNotificationCategoriesReceivedCategories: Set<UNNotificationCategory>?
    var setNotificationCategoriesReceivedInvocations: [Set<UNNotificationCategory>] = []
    var setNotificationCategoriesClosure: ((Set<UNNotificationCategory>) -> Void)?

    func setNotificationCategories(_ categories: Set<UNNotificationCategory>) {
        setNotificationCategoriesCallsCount += 1
        setNotificationCategoriesReceivedCategories = categories
        setNotificationCategoriesReceivedInvocations.append(categories)
        setNotificationCategoriesClosure?(categories)
    }
    //MARK: - authorizationStatus

    var authorizationStatusUnderlyingCallsCount = 0
    var authorizationStatusCallsCount: Int {
        get {
            if Thread.isMainThread {
                return authorizationStatusUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = authorizationStatusUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                authorizationStatusUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    authorizationStatusUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var authorizationStatusCalled: Bool {
        return authorizationStatusCallsCount > 0
    }

    var authorizationStatusUnderlyingReturnValue: UNAuthorizationStatus!
    var authorizationStatusReturnValue: UNAuthorizationStatus! {
        get {
            if Thread.isMainThread {
                return authorizationStatusUnderlyingReturnValue
            } else {
                var returnValue: UNAuthorizationStatus? = nil
                DispatchQueue.main.sync {
                    returnValue = authorizationStatusUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                authorizationStatusUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    authorizationStatusUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var authorizationStatusClosure: (() async -> UNAuthorizationStatus)?

    func authorizationStatus() async -> UNAuthorizationStatus {
        authorizationStatusCallsCount += 1
        if let authorizationStatusClosure = authorizationStatusClosure {
            return await authorizationStatusClosure()
        } else {
            return authorizationStatusReturnValue
        }
    }
}
class VoiceMessageCacheMock: VoiceMessageCacheProtocol {
    var urlForRecording: URL {
        get { return underlyingUrlForRecording }
        set(value) { underlyingUrlForRecording = value }
    }
    var underlyingUrlForRecording: URL!

    //MARK: - fileURL

    var fileURLForUnderlyingCallsCount = 0
    var fileURLForCallsCount: Int {
        get {
            if Thread.isMainThread {
                return fileURLForUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = fileURLForUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                fileURLForUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    fileURLForUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var fileURLForCalled: Bool {
        return fileURLForCallsCount > 0
    }
    var fileURLForReceivedMediaSource: MediaSourceProxy?
    var fileURLForReceivedInvocations: [MediaSourceProxy] = []

    var fileURLForUnderlyingReturnValue: URL?
    var fileURLForReturnValue: URL? {
        get {
            if Thread.isMainThread {
                return fileURLForUnderlyingReturnValue
            } else {
                var returnValue: URL?? = nil
                DispatchQueue.main.sync {
                    returnValue = fileURLForUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                fileURLForUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    fileURLForUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var fileURLForClosure: ((MediaSourceProxy) -> URL?)?

    func fileURL(for mediaSource: MediaSourceProxy) -> URL? {
        fileURLForCallsCount += 1
        fileURLForReceivedMediaSource = mediaSource
        fileURLForReceivedInvocations.append(mediaSource)
        if let fileURLForClosure = fileURLForClosure {
            return fileURLForClosure(mediaSource)
        } else {
            return fileURLForReturnValue
        }
    }
    //MARK: - cache

    var cacheMediaSourceUsingMoveUnderlyingCallsCount = 0
    var cacheMediaSourceUsingMoveCallsCount: Int {
        get {
            if Thread.isMainThread {
                return cacheMediaSourceUsingMoveUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = cacheMediaSourceUsingMoveUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cacheMediaSourceUsingMoveUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    cacheMediaSourceUsingMoveUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var cacheMediaSourceUsingMoveCalled: Bool {
        return cacheMediaSourceUsingMoveCallsCount > 0
    }
    var cacheMediaSourceUsingMoveReceivedArguments: (mediaSource: MediaSourceProxy, fileURL: URL, move: Bool)?
    var cacheMediaSourceUsingMoveReceivedInvocations: [(mediaSource: MediaSourceProxy, fileURL: URL, move: Bool)] = []

    var cacheMediaSourceUsingMoveUnderlyingReturnValue: Result<URL, VoiceMessageCacheError>!
    var cacheMediaSourceUsingMoveReturnValue: Result<URL, VoiceMessageCacheError>! {
        get {
            if Thread.isMainThread {
                return cacheMediaSourceUsingMoveUnderlyingReturnValue
            } else {
                var returnValue: Result<URL, VoiceMessageCacheError>? = nil
                DispatchQueue.main.sync {
                    returnValue = cacheMediaSourceUsingMoveUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cacheMediaSourceUsingMoveUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    cacheMediaSourceUsingMoveUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var cacheMediaSourceUsingMoveClosure: ((MediaSourceProxy, URL, Bool) -> Result<URL, VoiceMessageCacheError>)?

    func cache(mediaSource: MediaSourceProxy, using fileURL: URL, move: Bool) -> Result<URL, VoiceMessageCacheError> {
        cacheMediaSourceUsingMoveCallsCount += 1
        cacheMediaSourceUsingMoveReceivedArguments = (mediaSource: mediaSource, fileURL: fileURL, move: move)
        cacheMediaSourceUsingMoveReceivedInvocations.append((mediaSource: mediaSource, fileURL: fileURL, move: move))
        if let cacheMediaSourceUsingMoveClosure = cacheMediaSourceUsingMoveClosure {
            return cacheMediaSourceUsingMoveClosure(mediaSource, fileURL, move)
        } else {
            return cacheMediaSourceUsingMoveReturnValue
        }
    }
    //MARK: - clearCache

    var clearCacheUnderlyingCallsCount = 0
    var clearCacheCallsCount: Int {
        get {
            if Thread.isMainThread {
                return clearCacheUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = clearCacheUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                clearCacheUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    clearCacheUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var clearCacheCalled: Bool {
        return clearCacheCallsCount > 0
    }
    var clearCacheClosure: (() -> Void)?

    func clearCache() {
        clearCacheCallsCount += 1
        clearCacheClosure?()
    }
}
class VoiceMessageMediaManagerMock: VoiceMessageMediaManagerProtocol {

    //MARK: - loadVoiceMessageFromSource

    var loadVoiceMessageFromSourceBodyThrowableError: Error?
    var loadVoiceMessageFromSourceBodyUnderlyingCallsCount = 0
    var loadVoiceMessageFromSourceBodyCallsCount: Int {
        get {
            if Thread.isMainThread {
                return loadVoiceMessageFromSourceBodyUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = loadVoiceMessageFromSourceBodyUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadVoiceMessageFromSourceBodyUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    loadVoiceMessageFromSourceBodyUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var loadVoiceMessageFromSourceBodyCalled: Bool {
        return loadVoiceMessageFromSourceBodyCallsCount > 0
    }
    var loadVoiceMessageFromSourceBodyReceivedArguments: (source: MediaSourceProxy, body: String?)?
    var loadVoiceMessageFromSourceBodyReceivedInvocations: [(source: MediaSourceProxy, body: String?)] = []

    var loadVoiceMessageFromSourceBodyUnderlyingReturnValue: URL!
    var loadVoiceMessageFromSourceBodyReturnValue: URL! {
        get {
            if Thread.isMainThread {
                return loadVoiceMessageFromSourceBodyUnderlyingReturnValue
            } else {
                var returnValue: URL? = nil
                DispatchQueue.main.sync {
                    returnValue = loadVoiceMessageFromSourceBodyUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                loadVoiceMessageFromSourceBodyUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    loadVoiceMessageFromSourceBodyUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var loadVoiceMessageFromSourceBodyClosure: ((MediaSourceProxy, String?) async throws -> URL)?

    func loadVoiceMessageFromSource(_ source: MediaSourceProxy, body: String?) async throws -> URL {
        if let error = loadVoiceMessageFromSourceBodyThrowableError {
            throw error
        }
        loadVoiceMessageFromSourceBodyCallsCount += 1
        loadVoiceMessageFromSourceBodyReceivedArguments = (source: source, body: body)
        loadVoiceMessageFromSourceBodyReceivedInvocations.append((source: source, body: body))
        if let loadVoiceMessageFromSourceBodyClosure = loadVoiceMessageFromSourceBodyClosure {
            return try await loadVoiceMessageFromSourceBodyClosure(source, body)
        } else {
            return loadVoiceMessageFromSourceBodyReturnValue
        }
    }
}
class VoiceMessageRecorderMock: VoiceMessageRecorderProtocol {
    var previewAudioPlayerState: AudioPlayerState?
    var isRecording: Bool {
        get { return underlyingIsRecording }
        set(value) { underlyingIsRecording = value }
    }
    var underlyingIsRecording: Bool!
    var recordingURL: URL?
    var actions: AnyPublisher<VoiceMessageRecorderAction, Never> {
        get { return underlyingActions }
        set(value) { underlyingActions = value }
    }
    var underlyingActions: AnyPublisher<VoiceMessageRecorderAction, Never>!

    //MARK: - startRecording

    var startRecordingUnderlyingCallsCount = 0
    var startRecordingCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startRecordingUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startRecordingUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startRecordingUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startRecordingUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var startRecordingCalled: Bool {
        return startRecordingCallsCount > 0
    }
    var startRecordingClosure: (() async -> Void)?

    func startRecording() async {
        startRecordingCallsCount += 1
        await startRecordingClosure?()
    }
    //MARK: - stopRecording

    var stopRecordingUnderlyingCallsCount = 0
    var stopRecordingCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stopRecordingUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stopRecordingUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stopRecordingUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stopRecordingUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var stopRecordingCalled: Bool {
        return stopRecordingCallsCount > 0
    }
    var stopRecordingClosure: (() async -> Void)?

    func stopRecording() async {
        stopRecordingCallsCount += 1
        await stopRecordingClosure?()
    }
    //MARK: - cancelRecording

    var cancelRecordingUnderlyingCallsCount = 0
    var cancelRecordingCallsCount: Int {
        get {
            if Thread.isMainThread {
                return cancelRecordingUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = cancelRecordingUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                cancelRecordingUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    cancelRecordingUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var cancelRecordingCalled: Bool {
        return cancelRecordingCallsCount > 0
    }
    var cancelRecordingClosure: (() async -> Void)?

    func cancelRecording() async {
        cancelRecordingCallsCount += 1
        await cancelRecordingClosure?()
    }
    //MARK: - startPlayback

    var startPlaybackUnderlyingCallsCount = 0
    var startPlaybackCallsCount: Int {
        get {
            if Thread.isMainThread {
                return startPlaybackUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = startPlaybackUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startPlaybackUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    startPlaybackUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var startPlaybackCalled: Bool {
        return startPlaybackCallsCount > 0
    }

    var startPlaybackUnderlyingReturnValue: Result<Void, VoiceMessageRecorderError>!
    var startPlaybackReturnValue: Result<Void, VoiceMessageRecorderError>! {
        get {
            if Thread.isMainThread {
                return startPlaybackUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, VoiceMessageRecorderError>? = nil
                DispatchQueue.main.sync {
                    returnValue = startPlaybackUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                startPlaybackUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    startPlaybackUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var startPlaybackClosure: (() async -> Result<Void, VoiceMessageRecorderError>)?

    func startPlayback() async -> Result<Void, VoiceMessageRecorderError> {
        startPlaybackCallsCount += 1
        if let startPlaybackClosure = startPlaybackClosure {
            return await startPlaybackClosure()
        } else {
            return startPlaybackReturnValue
        }
    }
    //MARK: - pausePlayback

    var pausePlaybackUnderlyingCallsCount = 0
    var pausePlaybackCallsCount: Int {
        get {
            if Thread.isMainThread {
                return pausePlaybackUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = pausePlaybackUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                pausePlaybackUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    pausePlaybackUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var pausePlaybackCalled: Bool {
        return pausePlaybackCallsCount > 0
    }
    var pausePlaybackClosure: (() -> Void)?

    func pausePlayback() {
        pausePlaybackCallsCount += 1
        pausePlaybackClosure?()
    }
    //MARK: - stopPlayback

    var stopPlaybackUnderlyingCallsCount = 0
    var stopPlaybackCallsCount: Int {
        get {
            if Thread.isMainThread {
                return stopPlaybackUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = stopPlaybackUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                stopPlaybackUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    stopPlaybackUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var stopPlaybackCalled: Bool {
        return stopPlaybackCallsCount > 0
    }
    var stopPlaybackClosure: (() async -> Void)?

    func stopPlayback() async {
        stopPlaybackCallsCount += 1
        await stopPlaybackClosure?()
    }
    //MARK: - seekPlayback

    var seekPlaybackToUnderlyingCallsCount = 0
    var seekPlaybackToCallsCount: Int {
        get {
            if Thread.isMainThread {
                return seekPlaybackToUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = seekPlaybackToUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                seekPlaybackToUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    seekPlaybackToUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var seekPlaybackToCalled: Bool {
        return seekPlaybackToCallsCount > 0
    }
    var seekPlaybackToReceivedProgress: Double?
    var seekPlaybackToReceivedInvocations: [Double] = []
    var seekPlaybackToClosure: ((Double) async -> Void)?

    func seekPlayback(to progress: Double) async {
        seekPlaybackToCallsCount += 1
        seekPlaybackToReceivedProgress = progress
        seekPlaybackToReceivedInvocations.append(progress)
        await seekPlaybackToClosure?(progress)
    }
    //MARK: - deleteRecording

    var deleteRecordingUnderlyingCallsCount = 0
    var deleteRecordingCallsCount: Int {
        get {
            if Thread.isMainThread {
                return deleteRecordingUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = deleteRecordingUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                deleteRecordingUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    deleteRecordingUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var deleteRecordingCalled: Bool {
        return deleteRecordingCallsCount > 0
    }
    var deleteRecordingClosure: (() async -> Void)?

    func deleteRecording() async {
        deleteRecordingCallsCount += 1
        await deleteRecordingClosure?()
    }
    //MARK: - sendVoiceMessage

    var sendVoiceMessageInRoomAudioConverterUnderlyingCallsCount = 0
    var sendVoiceMessageInRoomAudioConverterCallsCount: Int {
        get {
            if Thread.isMainThread {
                return sendVoiceMessageInRoomAudioConverterUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = sendVoiceMessageInRoomAudioConverterUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendVoiceMessageInRoomAudioConverterUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    sendVoiceMessageInRoomAudioConverterUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var sendVoiceMessageInRoomAudioConverterCalled: Bool {
        return sendVoiceMessageInRoomAudioConverterCallsCount > 0
    }
    var sendVoiceMessageInRoomAudioConverterReceivedArguments: (roomProxy: RoomProxyProtocol, audioConverter: AudioConverterProtocol)?
    var sendVoiceMessageInRoomAudioConverterReceivedInvocations: [(roomProxy: RoomProxyProtocol, audioConverter: AudioConverterProtocol)] = []

    var sendVoiceMessageInRoomAudioConverterUnderlyingReturnValue: Result<Void, VoiceMessageRecorderError>!
    var sendVoiceMessageInRoomAudioConverterReturnValue: Result<Void, VoiceMessageRecorderError>! {
        get {
            if Thread.isMainThread {
                return sendVoiceMessageInRoomAudioConverterUnderlyingReturnValue
            } else {
                var returnValue: Result<Void, VoiceMessageRecorderError>? = nil
                DispatchQueue.main.sync {
                    returnValue = sendVoiceMessageInRoomAudioConverterUnderlyingReturnValue
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                sendVoiceMessageInRoomAudioConverterUnderlyingReturnValue = newValue
            } else {
                DispatchQueue.main.sync {
                    sendVoiceMessageInRoomAudioConverterUnderlyingReturnValue = newValue
                }
            }
        }
    }
    var sendVoiceMessageInRoomAudioConverterClosure: ((RoomProxyProtocol, AudioConverterProtocol) async -> Result<Void, VoiceMessageRecorderError>)?

    func sendVoiceMessage(inRoom roomProxy: RoomProxyProtocol, audioConverter: AudioConverterProtocol) async -> Result<Void, VoiceMessageRecorderError> {
        sendVoiceMessageInRoomAudioConverterCallsCount += 1
        sendVoiceMessageInRoomAudioConverterReceivedArguments = (roomProxy: roomProxy, audioConverter: audioConverter)
        sendVoiceMessageInRoomAudioConverterReceivedInvocations.append((roomProxy: roomProxy, audioConverter: audioConverter))
        if let sendVoiceMessageInRoomAudioConverterClosure = sendVoiceMessageInRoomAudioConverterClosure {
            return await sendVoiceMessageInRoomAudioConverterClosure(roomProxy, audioConverter)
        } else {
            return sendVoiceMessageInRoomAudioConverterReturnValue
        }
    }
}
class WindowManagerMock: WindowManagerProtocol {
    var mainWindow: UIWindow!
    var overlayWindow: UIWindow!
    var globalSearchWindow: UIWindow!
    var alternateWindow: UIWindow!
    var windows: [UIWindow] = []

    //MARK: - showGlobalSearch

    var showGlobalSearchUnderlyingCallsCount = 0
    var showGlobalSearchCallsCount: Int {
        get {
            if Thread.isMainThread {
                return showGlobalSearchUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = showGlobalSearchUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                showGlobalSearchUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    showGlobalSearchUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var showGlobalSearchCalled: Bool {
        return showGlobalSearchCallsCount > 0
    }
    var showGlobalSearchClosure: (() -> Void)?

    func showGlobalSearch() {
        showGlobalSearchCallsCount += 1
        showGlobalSearchClosure?()
    }
    //MARK: - hideGlobalSearch

    var hideGlobalSearchUnderlyingCallsCount = 0
    var hideGlobalSearchCallsCount: Int {
        get {
            if Thread.isMainThread {
                return hideGlobalSearchUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = hideGlobalSearchUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                hideGlobalSearchUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    hideGlobalSearchUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var hideGlobalSearchCalled: Bool {
        return hideGlobalSearchCallsCount > 0
    }
    var hideGlobalSearchClosure: (() -> Void)?

    func hideGlobalSearch() {
        hideGlobalSearchCallsCount += 1
        hideGlobalSearchClosure?()
    }
    //MARK: - setOrientation

    var setOrientationUnderlyingCallsCount = 0
    var setOrientationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return setOrientationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = setOrientationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                setOrientationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    setOrientationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var setOrientationCalled: Bool {
        return setOrientationCallsCount > 0
    }
    var setOrientationReceivedOrientation: UIInterfaceOrientationMask?
    var setOrientationReceivedInvocations: [UIInterfaceOrientationMask] = []
    var setOrientationClosure: ((UIInterfaceOrientationMask) -> Void)?

    func setOrientation(_ orientation: UIInterfaceOrientationMask) {
        setOrientationCallsCount += 1
        setOrientationReceivedOrientation = orientation
        setOrientationReceivedInvocations.append(orientation)
        setOrientationClosure?(orientation)
    }
    //MARK: - lockOrientation

    var lockOrientationUnderlyingCallsCount = 0
    var lockOrientationCallsCount: Int {
        get {
            if Thread.isMainThread {
                return lockOrientationUnderlyingCallsCount
            } else {
                var returnValue: Int? = nil
                DispatchQueue.main.sync {
                    returnValue = lockOrientationUnderlyingCallsCount
                }

                return returnValue!
            }
        }
        set {
            if Thread.isMainThread {
                lockOrientationUnderlyingCallsCount = newValue
            } else {
                DispatchQueue.main.sync {
                    lockOrientationUnderlyingCallsCount = newValue
                }
            }
        }
    }
    var lockOrientationCalled: Bool {
        return lockOrientationCallsCount > 0
    }
    var lockOrientationReceivedOrientation: UIInterfaceOrientationMask?
    var lockOrientationReceivedInvocations: [UIInterfaceOrientationMask] = []
    var lockOrientationClosure: ((UIInterfaceOrientationMask) -> Void)?

    func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        lockOrientationCallsCount += 1
        lockOrientationReceivedOrientation = orientation
        lockOrientationReceivedInvocations.append(orientation)
        lockOrientationClosure?(orientation)
    }
}
// swiftlint:enable all
