//
//  UIViewControllerExtensions.swift
//  StarterKit
//
//  Created by Kristof Dreier on 05.02.19.
//  Copyright © 2019 Carl Zeiss AG. All rights reserved.
//

import UIKit

public extension UIViewController {
    @objc func themedLoadView() {
        view = SizzledTheme.ThemeView()
    }
    
    private static let swizzleLoadView: Void = {
        let instance: UIViewController = UIViewController()
        let aClass: AnyClass! = object_getClass(instance)
        let originalMethod = class_getInstanceMethod(aClass, #selector(loadView))
        let swizzledMethod = class_getInstanceMethod(aClass, #selector(themedLoadView))
        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }()
    
    static func themeable() {
        _ = self.swizzleLoadView
    }
}
