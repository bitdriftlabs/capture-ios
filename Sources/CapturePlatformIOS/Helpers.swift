import Foundation

func replace_methods(class: AnyClass, selector: Selector, with toSelector: Selector) {
    guard let method = class_getInstanceMethod(`class`, selector),
          let toMethod = class_getInstanceMethod(`class`, toSelector) else
    {
        return
    }

    method_exchangeImplementations(method, toMethod)
}
