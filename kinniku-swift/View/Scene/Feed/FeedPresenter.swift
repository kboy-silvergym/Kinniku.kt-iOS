//
//  FeedPresenter.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/29.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

class FeedPresenter {
    
    func getTweet(_ completion: @escaping ([Tweet]) -> Void){
        TwitterAPI.getTweet({ results in
            guard let tweets = results?.tweets else {
                completion([])
                return
            }
            completion(tweets)
        })
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
}
