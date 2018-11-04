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
    
    static var themeBlack: UIColor {
        return UIColor(rgb: 0x2b2b2b)
    }
    
    static var themePurple: UIColor {
        return UIColor(rgb: 0x493293)
    }
    
    static var themeNavy: UIColor {
        return UIColor(rgb: 0x346ea6)
    }
    
    static var themeOrange: UIColor {
        return UIColor(rgb: 0xfe8812)
    }
    
    static var themePink: UIColor {
        return UIColor(rgb: 0xf43c98)
    }
}

