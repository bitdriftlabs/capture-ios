import Foundation

// Ensures that the hook installation process happens at most once.
let kInitializeOnce: () = {
    CapturePlatform.installURLSessionTaskHooks()
}()

public enum CapturePlatform {
    public static func enableNetworkInstrumentation() {
        kInitializeOnce

        // TODO(Augustyniak): Remove before merging.
        URLSession.shared
            // swiftlint:disable force_unwrapping
            .dataTask(with: URL(string: "https://google.com")!) { _, _, _ in
                print("Request completion")
            }
            .resume()
    }

    // MARK: - Private

    fileprivate static func installURLSessionTaskHooks() {
        let session = URLSession(configuration: .ephemeral)

        // swiftlint:disable force_unwrapping
        let task = session.dataTask(with: URL(string: "www.bitdrift.io")!)

        let klass = type(of: task)

        self.installURLSessionTaskResumeHook(class: klass)
        self.installURLSessionTaskSetStateHook(class: klass)

        session.invalidateAndCancel()
    }

    private static func installURLSessionTaskResumeHook(class: AnyClass) {
        let selector = #selector(URLSessionTask.resume)
        let classes = URLSessionTask.classesToSwizzle(for: selector, class: `class`)
        for klass in classes {
            replace_methods(
                class: klass,
                selector: selector,
                with: #selector(URLSessionTask.cap_resume)
            )
        }
    }

    private static func installURLSessionTaskSetStateHook(class: AnyClass) {
        let selector = Selector("setState:")
        let classes = URLSessionTask.classesToSwizzle(for: selector, class: `class`)
        for klass in classes {
            replace_methods(
                class: klass,
                selector: selector,
                with: #selector(URLSessionTask.cap_setState(_:))
            )
        }
    }
}
