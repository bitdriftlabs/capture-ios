import Capture
import CocoaLumberjack
import os

/// The wrapper around Capture SDK logger that conforms to `DDLogger` protocol from `CocoaLumberjack`
/// library and can be used as a drop-in solution for forwarding `CocoaLumberjack` logs to bitdrift
/// Capture SDK.
final class CaptureDDLogger: NSObject, DDLogger {
    private let osLogger = OSLogger()

    var logFormatter: DDLogFormatter? = nil

    func log(message logMessage: DDLogMessage) {
        guard let level = LogLevel(logMessage.level) else {
            return
        }

        Capture.Logger.log(
            level: level,
            message: logMessage.message
        )
    }

    func didAdd() {
        let isCaptureLoggerConfigured = Capture.Logger.sessionID != nil
        if !isCaptureLoggerConfigured {
            self.osLogger.log(
                level: .error,
                message: "`CaptureDDLogger` added as output target of `DDLogger` before the configuration of Capture SDK. Logs emitted prior to the configuration of the Capture SDK will not be visible to the SDK."
            )
        }
    }
}

extension LogLevel {
    /// Initializes a new instance of Capture log level using provided Cocoa Lumberjack log level.
    ///
    /// - parameter logLevel: Cocoa Lumberjack log level.
    public init?(_ logLevel: DDLogLevel) {
        switch logLevel {
        case .off:
            return nil
        case .error:
            self = .error
        case .warning:
            self = .warning
        case .info:
            self = .info
        case .debug:
            self = .debug
        case .verbose, .all:
            self = .trace
        default:
            self = .trace
        }
    }
}
