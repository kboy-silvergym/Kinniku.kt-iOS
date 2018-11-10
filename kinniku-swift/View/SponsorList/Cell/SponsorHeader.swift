//
//  SponsorHeader.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/25.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

class SponsorHeader: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.themeNavy
            titleLabel.font = UIFont.logoG.medium.font(13)
        }
    }
}
