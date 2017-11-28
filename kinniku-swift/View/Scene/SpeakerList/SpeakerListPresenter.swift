//
//  SpeakerListPresenter.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/29.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

class SpeakerListPresenter {
    let firestore = CloudFirestore()
    var shouldRankingSort = false
    
    var level1Done = false
    var level2Done = false
    var level3Done = false
    
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
