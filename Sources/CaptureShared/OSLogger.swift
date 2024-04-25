import Foundation
import os

/// A simple wrapper around os logging APIs.
public final class OSLogger {
    private let logging: OSLogging

    /// Initializes a new logger.
    ///
    /// - parameter subsystem: The name of the system the logger should be initialized with.
    ///                        It helps to organize emitted logs. It's prefixed with a "io.bitdrift.capture."
    ///                        string to ensure that all Capture libraries use the same subsystem prefix.
    public init(subsystem: String) {
        if #available(iOS 14.0, *) {
            self.logging = Logger(subsystem: subsystem)
        } else {
            self.logging = LegacyLogger()
        }
    }

    /// Logs a new message.
    ///
    /// - parameter level:   The log severity level.
    /// - parameter message: The log message.
    public func log(level: OSLogType, message: String) {
        self.logging.log(level: level, message: message)
    }
}

private protocol OSLogging {
    func log(level: OSLogType, message: String)
}

@available(iOS 14.0, *)
private final class Logger: OSLogging {
    private let logger: os.Logger

    init(subsystem: String) {
        self.logger = os.Logger(
            subsystem: "io.bitdrift.capture.\(subsystem)",
            category: "logging"
        )
    }

    func log(level: OSLogType, message: String) {
        self.logger.log(level: level, "\(message)")
    }
}

private final class LegacyLogger: OSLogging {
    func log(level: OSLogType, message: String) {
        // The formatting string below allows us to logs `String`s as opposed to `StaticString`s that
        // are normally accessed by the `os_log`.
        os_log("%{public}@", log: .default, type: level, message as NSString)
    }
}
