//
//  EventCell.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/25.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel! {
        didSet {
            timeLabel.textColor = UIColor.white
            timeLabel.font = UIFont.logoG.medium.font(13)
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.themeBlack
            titleLabel.font = UIFont.logoG.extra.font(28)
        }
    }
    @IBOutlet weak var detailLabel: UILabel! {
        didSet {
            detailLabel.textColor = UIColor.gray
            detailLabel.font = UIFont.logoG.medium.font(15)
        }
    }
    
    var event: Event? {
        didSet{
            timeLabel.text = event?.time
            titleLabel.text = event?.title
            detailLabel.text = event?.description
            detailLabel.setLineSpacing(lineSpacing: 6)
        }
    }
}
