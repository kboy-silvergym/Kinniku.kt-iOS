//
//  SpeakerCell.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/25.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

class SpeakerCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameText: UILabel! {
        didSet {
            userNameText.textColor = UIColor.themeBlack
            userNameText.font = UIFont.logoG.medium.font(17)
        }
    }
    @IBOutlet weak var titleText: UILabel! {
        didSet {
            titleText.textColor = UIColor.themeBlack
            titleText.font = UIFont.logoG.extra.font(21)
        }
    }
    @IBOutlet weak var pointLabel: UILabel! {
        didSet {
            pointLabel.textColor = UIColor.themeBlack
            pointLabel.font = UIFont.logoG.extra.font(30)
        }
    }
    @IBOutlet weak var screenNameButton: UIButton! {
        didSet {
            screenNameButton.setTitleColor(.themeNavy, for: .normal)
            screenNameButton.titleLabel?.font = UIFont.logoG.medium.font(11)
        }
    }
    @IBOutlet weak var voteButton: UIButton! {
        didSet {
            voteButton.tintColor = .themeNavy
        }
    }
    
    var speaker: Speaker? {
        didSet{
            guard let speaker = speaker else {
                return
            }
            // conpass名
            userNameText.text = speaker.name
            
            // twitter名
            if speaker.screenName.isEmpty {
                screenNameButton.setTitle("", for: .normal)
            } else {
                screenNameButton.setTitle("@\(speaker.screenName)", for: .normal)
            }
            // サムネ
            let profileImageURL = URL(string: speaker.imgURL)
            profileImage.sd_setImage(with: profileImageURL)
            
            // タイトル
            if speaker.title.isEmpty {
                titleText.text = "未定"
            } else {
                titleText.text = speaker.title
            }
            titleText.setLineSpacing(lineSpacing: 8)
            // ポイント
            pointLabel.text = speaker.point.description
        }
    }
    
    var votedEvent: (() -> Void)?
    
    @IBAction func screenNameButtonTapped(_ sender: Any) {
        guard let screenName = speaker?.screenName else { return }
        let urlString = "https://twitter.com/\(screenName)"
        
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func voteButtonTapped(_ sender: Any) {
        self.votedEvent?()
    }
    
}
