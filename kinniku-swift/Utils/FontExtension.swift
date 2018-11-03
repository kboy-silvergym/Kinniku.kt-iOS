//
//  FontExtension.swift
//  kinniku-swift
//
//  Created by Kei Fujikawa on 2018/11/03.
//  Copyright © 2018 Barberry Inc. All rights reserved.
//

import UIKit

extension UIFont {
    enum logoG {
        case bold
        case extra
        case light
        case medium
        case ultra
        
        func font(_ size: CGFloat) -> UIFont {
            switch self {
            case .bold:
                return UIFont(name: "LogoGStd-Bold", size: size)!
            case .extra:
                return UIFont(name: "LogoGStd-Extra", size: size)!
            case .light:
                return UIFont(name: "LogoGStd-Light", size: size)!
            case .medium:
                return UIFont(name: "LogoGStd-Medium", size: size)!
            case .ultra:
                return UIFont(name: "LogoGStd-Ultra", size: size)!
            }
        }
    }
}
