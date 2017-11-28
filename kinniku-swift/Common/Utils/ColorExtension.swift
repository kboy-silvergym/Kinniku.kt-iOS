//
//  ColorExtension.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/13.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(rgb: rgb, alpha: 1.0)
    }
    
    convenience init(rgb: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    static var theme: UIColor {
        return UIColor(rgb: 0xFC2F23)
    }
    
    static var themeMiddle: UIColor {
        return UIColor(rgb: 0xff00b8)
    }
    
    static var themeLight: UIColor {
        return UIColor(rgb: 0xffd400)
    }
    
    static var clearWhite: UIColor {
        return UIColor(rgb: 0xffffff, alpha: 0.5)
    }
}

