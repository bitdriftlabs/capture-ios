import Foundation
import ObjectiveC

extension URLSessionTask {
    @objc
    func cap_resume() {
        URLSessionTaskInstrumentation.shared.taskWillResume(self)

        // This doesn't result in a release cycle as `cap_resume` was used to replace `resume`
        // so `self.cap_resume()` call below calls an original implementation of a `resume`.
        self.cap_resume()
    }

    @objc
    func cap_setState(_ state: URLSessionTask.State) {
        URLSessionTaskInstrumentation.shared.task(self, setState: state)

        // This doesn't result in a release cycle as `cap_setResume` was used to replace `setState`
        // so `self.cap_setState(_:)` call below calls an original implementation of a `setState`.
        self.cap_setState(state)
    }

    // MARK: - Helpers

    static func classesToSwizzle(for selector: Selector, class: AnyClass) -> [AnyClass] {
        var currentClass = `class`
        var result = [AnyClass]()

        repeat {
            let superClass = currentClass.superclass()

            let imp = class_getMethodImplementation(currentClass, selector)
            let superImp = superClass.flatMap { class_getMethodImplementation($0, selector) }

            if imp != superImp {
                result.append(currentClass)
            }

            if let superClass {
                currentClass = superClass
            } else {
                break
            }
        } while class_getInstanceMethod(currentClass, selector) != nil

        return result
    }
}
