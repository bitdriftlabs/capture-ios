import Capture
import Foundation

private var kRequestInfoKey: UInt8 = 0

extension URLSessionTask {
    var isCaptureAPI: Bool {
        self.originalRequest?.allHTTPHeaderFields?["x-capture-api"] == "true"
    }

    var requestInfo: HTTPRequestInfo? {
        get { self.getAssociatedObject(&kRequestInfoKey) as? HTTPRequestInfo }
        set { self.setAssociatedObject(&kRequestInfoKey, value: newValue) }
    }
}
