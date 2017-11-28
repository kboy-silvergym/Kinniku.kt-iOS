//
//  FeedViewController.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/11.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class FeedViewController: UIViewController {
    let presenter = FeedPresenter()
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl?
    
    var tweets: [Tweet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(type(of: self).refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        let nib = UINib(nibName: String(describing: TweetCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: TweetCell.self))
        
        getTweet()
    }
    
    @objc func refresh(){
        getTweet()
    }
    
    func getTweet(){
        presenter.getTweet({ tweets in
            self.tweets = tweets
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        })
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        presenter.showTweetComposer(self)
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        if let navigationViewController = self.navigationController as? SideMenuItemContent {
            navigationViewController.showSideMenu()
        }
    }
}

// MARK: - <#UITableViewDataSource#>
extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TweetCell.self), for: indexPath) as! TweetCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }
}
