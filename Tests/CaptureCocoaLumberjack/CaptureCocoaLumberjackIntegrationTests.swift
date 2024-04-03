import CaptureCocoaLumberjack
import CocoaLumberjackSwift
import XCTest

final class IntegrationTests: XCTestCase {
    func testAddingCaptureDDLogger() {
        DDLog.add(CaptureDDLogger())
    }
}
