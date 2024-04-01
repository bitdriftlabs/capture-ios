import Capture
import SwiftyBeaver

/// The wrapper around Capture SDK logger that conforms to `BaseDestination` protocol from `SwiftyBeaver`
/// library and can be used as a drop-in solution for forwarding `SwiftyBeaver` logs to bitdrift
/// Capture SDK.
final class CaptureSwiftyBeaverLogger: BaseDestination {
    override func send(
        _ level: SwiftyBeaver.Level,
        msg: String,
        thread: String,
        file: String,
        function: String,
        line: Int,
        context: Any? = nil
    ) -> String? {
        Capture.Logger.log(
            level: LogLevel(level),
            message: msg
        )

        return super.send(
            level,
            msg: msg,
            thread: thread,
            file: file,
            function: function,
            line: line,
            context: context
        )
    }
}

extension Capture.LogLevel {
    /// Initializes a new instance of Capture log level using provided Swifty Beaver log level.
    ///
    /// - parameter logLevel: Swifty Beaver log level.
    init(_ logLevel: SwiftyBeaver.Level) {
        switch logLevel {
        case .verbose:
            self = .trace
        case .debug:
            self = .debug
        case .info:
            self = .info
        case .warning:
            self = .warning
        case .error:
            self = .error
        }
    }
}
