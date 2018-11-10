//
//  UITableView+Extensions.swift
//  kinniku-swift
//
//  Created by Kei Fujikawa on 2018/11/11.
//  Copyright © 2018 Barberry Inc. All rights reserved.
//

import UIKit

extension UITableView {
    func registerNib<T: UITableViewCell>(_ cellType: T.Type){
        let nibName = String(describing: cellType)
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: nibName)
    }
}
