//
//  SpeakerListViewController.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/11.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class SpeakerListViewController: UIViewController {
    let presenter = SpeakerListPresenter()
    
    @IBOutlet weak var tableView: UITableView!
    
    var speakers: [Speaker] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        let nib = UINib(nibName: String(describing: SpeakerCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: SpeakerCell.self))
        
        presenter.getSpeakerRealtime({ error, speakers in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.speakers = speakers
            self.reloadData()
        })
    }
    
    // ソートしてリロード
    func reloadData(){
        self.speakers = presenter.sort(self.speakers)
        self.tableView.reloadData()
    }
    
    // 投票アラート
    func showVoteAlert(sourceRect: CGRect, name: String,
                       level1Action: @escaping (() -> Void),
                       level2Action: @escaping (() -> Void),
                       level3Action: @escaping (() -> Void)){
        
        let alert = presenter.getVoteAlert(sourceRect: sourceRect, name: name, view: self.view,
                                           level1Action:level1Action,
                                           level2Action:level2Action,
                                           level3Action:level3Action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        if let navigationViewController = self.navigationController as? SideMenuItemContent {
            navigationViewController.showSideMenu()
        }
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        presenter.shouldRankingSort = sender.selectedSegmentIndex == 1
        self.reloadData()
    }
}

// MARK: - <#UITableViewDataSource#>
extension SpeakerListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SpeakerCell.self), for: indexPath) as! SpeakerCell
        cell.speaker = speakers[indexPath.row]
        cell.votedEvent = {
            
            self.showVoteAlert(sourceRect: cell.frame, name: self.speakers[indexPath.row].name,
               level1Action: {
                let speaker = self.speakers[indexPath.row]
                let currentPoint = speaker.point
                self.presenter.voteSpeaker(id: speaker.id, newCount: currentPoint+1)
            }, level2Action: {
                let speaker = self.speakers[indexPath.row]
                let currentPoint = self.speakers[indexPath.row].point
                self.presenter.voteSpeaker(id: speaker.id, newCount: currentPoint+2)
            }, level3Action: {
                let speaker = self.speakers[indexPath.row]
                let currentPoint = speaker.point
                self.presenter.voteSpeaker(id: speaker.id, newCount: currentPoint+3)
            })
        }
        return cell
    }
}

extension SpeakerListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
