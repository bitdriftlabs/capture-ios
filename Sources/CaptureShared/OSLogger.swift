import os

protocol OSLogging {
    func log(level: OSLogType, message: StaticString)
}

/// A simple wrapper around os logging APIs.
final class OSLogger: OSLogging {
    private let logging: OSLogging

    init() {
        if #available(iOS 14.0, *) {
            self.logging = Logger()
        } else {
            self.logging = LegacyLogger()
        }
    }

    func log(level: OSLogType, message: StaticString) {
        self.logging.log(level: level, message: message)
    }
}

@available(iOS 14.0, *)
private final class Logger: OSLogging {
    private let logger = os.Logger(
        subsystem: "io.bitdrift.capture.cocoa_lumberjack_integration",
        category: "logging"
    )

    func log(level: OSLogType, message: StaticString) {
        self.logger.log(level: level, "\(message)")
    }
}

private final class LegacyLogger: OSLogging {
    func log(level: OSLogType, message: StaticString) {
        os_log(level, message)
    }
}
