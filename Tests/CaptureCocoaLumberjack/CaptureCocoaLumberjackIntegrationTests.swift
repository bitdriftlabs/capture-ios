import CaptureCocoaLumberjack
import CocoaLumberjackSwift
import XCTest

final class CaptureCocoaLumberjackIntegrationTests: XCTestCase {
    func testAddingCaptureDDLogger() {
        DDLog.add(CaptureDDLogger())
    }
}
