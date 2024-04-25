import Foundation

func replace_methods(class: AnyClass, selector: Selector, with toSelector: Selector) {
    guard let method = class_getInstanceMethod(`class`, selector) else {
        return kLogger.log(
            level: .error,
            message: "method replacing field: failed to find \(selector) in \(`class`) class"
        )
    }

    guard let toMethod = class_getInstanceMethod(`class`, toSelector) else {
        return kLogger.log(
            level: .error,
            message: "method replacing field: failed to find \(toSelector) in \(`class`) class"
        )
    }

    method_exchangeImplementations(method, toMethod)
}
