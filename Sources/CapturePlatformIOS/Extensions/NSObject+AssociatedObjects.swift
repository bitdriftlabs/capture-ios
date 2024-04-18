import Foundation

extension NSObject {
    func getAssociatedObject(_ key: UnsafeRawPointer) -> Any? {
        objc_getAssociatedObject(self, key)
    }

    func setAssociatedObject(_ key: UnsafeRawPointer, value: Any?) {
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
