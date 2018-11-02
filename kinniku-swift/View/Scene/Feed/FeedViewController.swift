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
        TwitterAPI.getTweet({ results in
            self.tweets = results?.tweets ?? []
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        })
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        showTweetComposer(self)
    }
    
    func showTweetComposer(_ vc: UIViewController){
        TwitterAPI.showTweetComposer(fromVC: vc, completion: { result in
            switch result {
            case .done:
                break
            case .cancelled:
                break
            }
        })
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
