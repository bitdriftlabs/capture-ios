import CaptureSwiftyBeaver
import SwiftyBeaver
import XCTest

final class CaptureSwiftyBeaverIntegrationTests: XCTestCase {
    func testAddingCaptureSwiftyBeaverLogger() {
        SwiftyBeaver.addDestination(CaptureSwiftyBeaverLogger())

        SwiftyBeaver.verbose("Verbose")
        SwiftyBeaver.debug("Debug")
        SwiftyBeaver.info("Info")
        SwiftyBeaver.warning("Warning")
        SwiftyBeaver.error("Error")
    }
}
