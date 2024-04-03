import CaptureSwiftyBeaver
import SwiftyBeaver
import XCTest

final class CaptureSwiftyBeaverIntegrationTests: XCTestCase {
    func testAddingCaptureSwiftyBeaverLogger() {
        SwiftyBeaver.addDestination(CaptureSwiftyBeaverLogger())
    }
}
