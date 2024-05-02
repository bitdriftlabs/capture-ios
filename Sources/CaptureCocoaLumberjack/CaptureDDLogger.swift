import Capture
#if SWIFT_PACKAGE
    import CocoaLumberjackSwift
#else
    import CocoaLumberjack
#endif
import os

extension Integration {
    /// An Capture SDK integration that forwards all of the logs emitted with the use of the `CocoaLumberjack`
    /// logging framework to Capture SDK.
    ///
    /// - returns: The `CocoaLumberjack` Capture Logger SDK integration.
    public static func cocoaLumberjack() -> Integration {
        return Integration { logger in
            DDLog.add(CaptureDDLogger(logger: logger))
        }
    }
}

/// The wrapper around Capture SDK logger that conforms to `DDLogger` protocol from `CocoaLumberjack`
/// library and can be used as a drop-in solution for forwarding `CocoaLumberjack` logs to bitdrift
/// Capture SDK.
final class CaptureDDLogger: NSObject, DDLogger {
    private let logger: Logging
    private let osLogger = OSLogger()

    var logFormatter: DDLogFormatter?

    init(logger: Logging) {
        self.logger = logger
        super.init()
    }

    func log(message logMessage: DDLogMessage) {
        guard let level = LogLevel(logMessage.level) else {
            return
        }

        self.logger.log(
            level: level,
            message: logMessage.message,
            file: logMessage.file,
            line: Int(logMessage.line),
            function: logMessage.function,
            fields: [
                "source": "CocoaLumberjack",
                "thread": logMessage.threadID,
            ],
            error: nil
        )
    }

    func didAdd() {
        let isCaptureLoggerConfigured = Capture.Logger.sessionID != nil
        if !isCaptureLoggerConfigured {
            // swiftlint:disable line_length
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
            self = .debug
        }
    }
}
