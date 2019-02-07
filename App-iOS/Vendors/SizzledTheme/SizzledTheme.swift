//
//  SizzledTheme.swift
//  StarterKit
//
//  Created by Kristof Dreier on 05.02.19.
//  Copyright © 2019 Carl Zeiss AG. All rights reserved.
//

import UIKit

struct SizzledTheme {
    static func enable() {
        UIViewController.themeable()
    }
    
    class ThemeView: UIView {}
}
