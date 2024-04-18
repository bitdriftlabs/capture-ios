import Capture
import Foundation

private var kInstrumentationEnabledKey: UInt8 = 0
private var kRequestInfoKey: UInt8 = 0

extension URLSessionTask {
    var instrumentationEnabled: Bool {
        self.getAssociatedObject(&kInstrumentationEnabledKey) as? Bool ?? true
    }

    var requestInfo: HTTPRequestInfo? {
        get { self.getAssociatedObject(&kRequestInfoKey) as? HTTPRequestInfo }
        set { self.setAssociatedObject(&kRequestInfoKey, value: newValue) }
    }
}
