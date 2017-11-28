//
//  SpeakerCell.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/25.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

class SpeakerCell: UITableViewCell {
    @IBOutlet weak var userNameText: UILabel!
    @IBOutlet weak var screenNameButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var voteButton: UIButton!
    
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
            // ポイント
            pointLabel.text = speaker.point.description
        }
    }
    
    var votedEvent: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
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
