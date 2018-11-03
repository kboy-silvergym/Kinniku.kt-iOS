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
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.themeBlack
        }
    }
    @IBOutlet weak var detailLabel: UILabel! {
        didSet {
            detailLabel.textColor = UIColor.gray
        }
    }
    
    var event: Event? {
        didSet{
            timeLabel.text = event?.time
            titleLabel.text = event?.title
            detailLabel.text = event?.description
        }
    }
}
