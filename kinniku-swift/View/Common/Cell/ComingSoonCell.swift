//
//  ComingSoonCell.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/13.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

class ComingSoonCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.logoG.extra.font(32)
        }
    }
}
