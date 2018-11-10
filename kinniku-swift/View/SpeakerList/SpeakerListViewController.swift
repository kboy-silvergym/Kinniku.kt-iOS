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
    @IBOutlet weak var segmentControl: UISegmentedControl! {
        didSet {
            segmentControl.setTitleTextAttributes([
                NSAttributedString.Key.font: UIFont.logoG.medium.font(15),
                NSAttributedString.Key.foregroundColor: UIColor.themeNavy
                ]
                , for: .normal)
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    var speakers: [Speaker] = []
    
    let firestore = CloudFirestore()
    var shouldRankingSort = false
    
    var level1Done = false
    var level2Done = false
    var level3Done = false
    
    private lazy var feedback = UINotificationFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.registerNib(SpeakerCell.self)
        tableView.registerNib(ComingSoonCell.self)
        
        getSpeakerRealtime({ error, speakers in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.speakers = speakers
            self.reloadData()
        })
        
        feedback.prepare()
    }
    
    // ソートしてリロード
    func reloadData(){
        self.speakers = sort(self.speakers)
        self.tableView.reloadData()
    }
    
    // 投票アラート
    func showVoteAlert(sourceRect: CGRect, name: String,
                       level1Action: @escaping (() -> Void),
                       level2Action: @escaping (() -> Void),
                       level3Action: @escaping (() -> Void)){
        
        let alert = getVoteAlert(sourceRect: sourceRect, name: name, view: self.view,
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
        shouldRankingSort = sender.selectedSegmentIndex == 1
        self.reloadData()
    }
}

// MARK: - <#UITableViewDataSource#>
extension SpeakerListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if speakers.count == 0 {
            return 1
        }
        return speakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if speakers.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ComingSoonCell.self), for: indexPath)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SpeakerCell.self), for: indexPath) as! SpeakerCell
        cell.speaker = speakers[indexPath.row]
        cell.votedEvent = {
            
            self.showVoteAlert(sourceRect: cell.frame, name: self.speakers[indexPath.row].name,
               level1Action: {
                let speaker = self.speakers[indexPath.row]
                let currentPoint = speaker.point
                self.voteSpeaker(id: speaker.id, newCount: currentPoint+1)
                
                self.feedback.notificationOccurred(.success)
            }, level2Action: {
                let speaker = self.speakers[indexPath.row]
                let currentPoint = self.speakers[indexPath.row].point
                self.voteSpeaker(id: speaker.id, newCount: currentPoint+2)
                
                self.feedback.notificationOccurred(.success)
            }, level3Action: {
                let speaker = self.speakers[indexPath.row]
                let currentPoint = speaker.point
                self.voteSpeaker(id: speaker.id, newCount: currentPoint+3)
                
                self.feedback.notificationOccurred(.success)
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

extension SpeakerListViewController {
    
    func getSpeakerRealtime(_ completion: @escaping (Error?, [Speaker]) -> Void){
        firestore.getSpeakerRealtime({ error, speakers in
            completion(error, speakers)
        })
    }
    
    func sort(_ speakers: [Speaker]) -> [Speaker] {
        let sortedSpeakers: [Speaker] = speakers.sorted(by: { speakerA, speakerB in
            
            if self.shouldRankingSort {
                // ランキング降順
                return speakerA.point > speakerB.point
            } else {
                // 発表昇順
                if let a = speakerA.order, let b = speakerB.order {
                    return a < b
                }
                return false
            }
        })
        return sortedSpeakers
    }
    
    func getVoteAlert(sourceRect: CGRect, name: String, view: UIView,
                      level1Action: @escaping (() -> Void),
                      level2Action: @escaping (() -> Void),
                      level3Action: @escaping (() -> Void)) -> UIAlertController {
        
        let alert = UIAlertController(title: "\(name)の筋肉は？", message: nil, preferredStyle: .actionSheet)
        let level3 = UIAlertAction(title: "デカイ！(3reps)", style: .destructive, handler: { action in
            level3Action()
            self.level3Done = true
        })
        let level2 = UIAlertAction(title: "肩メロン！(2reps)", style: .default, handler: { action in
            level2Action()
            self.level2Done = true
        })
        let level1 = UIAlertAction(title: "キレてる！(1reps)", style: .default, handler: { action in
            level1Action()
            self.level1Done = true
        })
        let cancel = UIAlertAction(title: "まだまだ", style: .cancel, handler: nil)
        
        if !level3Done {
            alert.addAction(level3)
        }
        if !level2Done {
            alert.addAction(level2)
        }
        if !level1Done {
            alert.addAction(level1)
        }
        alert.popoverPresentationController?.sourceView = view
        alert.popoverPresentationController?.sourceRect = sourceRect
        alert.addAction(cancel)
        return alert
    }
    
    func voteSpeaker(id: String?, newCount: Int){
        firestore.voteSpeaker(id: id, newCount: newCount)
    }
}

