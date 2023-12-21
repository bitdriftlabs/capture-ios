import Capture
import XCTest

final class CaptureIntegrationTests: XCTestCase {
    func testCapture() {
        Capture.Logger.configure(withAPIKey: "foo", sessionStrategy: .fixed())
        XCTAssertNotNil(Capture.Logger.sessionID)
    }
}
