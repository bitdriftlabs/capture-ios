import CaptureSwiftyBeaver
import SwiftyBeaver
import XCTest

final class IntegrationTests: XCTestCase {
    func testAddingCaptureSwiftyBeaverLogger() {
        SwiftyBeaver.addDestination(CaptureSwiftyBeaverLogger())
    }
}
