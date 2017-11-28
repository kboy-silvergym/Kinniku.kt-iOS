//
//  SponsorCell.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/25.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

class SponsorCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sponcerTypeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var sponsor: Sponsor? {
        didSet{
            guard let sponsor = sponsor else {
                return
            }
            nameLabel.text = sponsor.name
            sponcerTypeLabel.text = sponsor.type
            descriptionLabel.text = sponsor.description
            
            // サムネ
            let imageURL = URL(string: sponsor.imgURL)
            thumbnailImageView.sd_setImage(with: imageURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
