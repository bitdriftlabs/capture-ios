import Capture
import Foundation

private var kAssociatedObjectRequestInfoKey: UInt8 = 0

final class URLSessionTaskInstrumentation {
    static let shared = URLSessionTaskInstrumentation()

    func taskWillResume(_ task: URLSessionTask) {
        // This enables us not to instrument requests performed by Capture SDK.
        if task.isCaptureAPI {
            return
        }

        guard task.state == .suspended else {
            return
        }

        guard task.originalRequest != nil else {
            return
        }

        let requestInfo = HTTPRequestInfo(task: task)
        task.requestInfo = requestInfo

        Logger.log(requestInfo)
    }

    func task(_ task: URLSessionTask, setState newState: URLSessionTask.State) {
        guard let requestInfo = task.requestInfo else {
            return
        }

        if task.state == .running && newState != .running {
            let httpResponse = HTTPResponse(httpURLResponse: task.response, error: task.error)
            let responseInfo = HTTPResponseInfo(requestInfo: requestInfo, response: httpResponse)
            Logger.log(responseInfo)
        }
    }
}
