import CaptureCocoaLumberjack
import CocoaLumberjackSwift
import XCTest

final class CaptureCocoaLumberjackIntegrationTests: XCTestCase {
    func testAddingCaptureDDLogger() {
        DDLog.add(CaptureDDLogger())

        DDLogVerbose("Verbose")
        DDLogDebug("Debug")
        DDLogInfo("Info")
        DDLogWarn("Warn")
        DDLogError("Error")
    }
}
