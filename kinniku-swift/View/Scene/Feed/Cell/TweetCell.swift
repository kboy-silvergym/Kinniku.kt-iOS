//
//  TweetCell.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/12.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit
import SDWebImage

class TweetCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var userNameText: UILabel! {
        didSet {
            userNameText.textColor = .themeBlack
            userNameText.font = UIFont.logoG.extra.font(17)
        }
    }
    @IBOutlet weak var tweetText: UILabel! {
        didSet {
            tweetText.textColor = .themeBlack
            tweetText.font = UIFont.logoG.medium.font(17)
        }
    }
    @IBOutlet weak var dateText: UILabel! {
        didSet {
            dateText.textColor = .themeBlack
            dateText.font = UIFont.logoG.medium.font(11)
        }
    }
    @IBOutlet weak var screenNameButton: UIButton! {
        didSet {
            screenNameButton.setTitleColor(.themeNavy, for: .normal)
            screenNameButton.titleLabel?.font = UIFont.logoG.medium.font(11)
        }
    }
    
    var tweet: Tweet? {
        didSet{
            guard let tweet = tweet else { return }
            tweetText.text = tweet.text
            tweetText.setLineSpacing(lineSpacing: 6)
            
            // 3日前などのフォーマットに変換
            let dateSpan = tweet
                .createdAt
                .toDate(dateFormat: Date.twitterFormat)?
                .getSpanStringFromNow() ?? ""
            dateText.text = dateSpan
            
            if let user = tweet.user {
                userNameText.text = user.name
                screenNameButton.setTitle("@\(user.screenName)", for: .normal)
                let profileImageURL = URL(string: user.imageUrl)
                profileImage.sd_setImage(with: profileImageURL)
            }
            
            if tweet.tweetMedias.count > 0 {
                contentImageView.isHidden = false
                let imageUrl = URL(string: tweet.tweetMedias.first!.url)
                contentImageView.sd_setImage(with: imageUrl)
            } else {
                contentImageView.isHidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func screenNameButtonTapped(_ sender: Any) {
        guard let screenName = tweet?.user?.screenName else { return }
        let urlString = "https://twitter.com/\(screenName)"
        
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func jumpTweetButtonTapped(_ sender: Any) {
        guard let screenName = tweet?.user?.screenName else { return }
        guard let tweetId = tweet?.id else { return }
        let urlString = "https://twitter.com/\(screenName)/status/\(tweetId)"
        
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
