//
//  PersonalSponsorCell.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/25.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

class PersonalSponsorCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var screenNameButton: UIButton!
    
    var sponsor: PersonalSponsor? {
        didSet{
            guard let sponsor = sponsor else {
                return
            }
            // twitter名
            if sponsor.screenName.isEmpty {
                screenNameButton.setTitle("", for: .normal)
            } else {
                screenNameButton.setTitle("@\(sponsor.screenName)", for: .normal)
            }
            // サムネ
            let imageURL = URL(string: sponsor.imgURL)
            profileImage.sd_setImage(with: imageURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func screenNameButtonTapped(_ sender: Any) {
        guard let screenName = sponsor?.screenName else { return }
        let urlString = "https://twitter.com/\(screenName)"

        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}
