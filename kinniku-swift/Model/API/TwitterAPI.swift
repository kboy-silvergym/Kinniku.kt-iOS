//
//  TwitterAPI.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/11.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//
import TwitterKit
import Unbox

class TwitterAPI {
    
    static func getTweet(sinceId: String? = nil, _ completed: @escaping (Results?) -> Void){
        let endpoint = "https://api.twitter.com/1.1/search/tweets.json"
        let keyword = "#筋肉swift"
        
        // MARK: - param作成
        var params: [String: String] = [:]
        params["q"] = "\(keyword) -filter:retweets"
        params["count"] = "30"
        
        if let sinceId = sinceId {
            params["since_id"] = sinceId
        }
        
        // MARK: - リクエスト
        let client = TWTRAPIClient()
        let request = client.urlRequest(withMethod: "GET",
                                        urlString: endpoint,
                                        parameters: params,
                                        error: nil)
        print(request.url)
        client.sendTwitterRequest(request){ response, data, connectionError in
            guard let data = data else {
                completed(nil)
                return
            }
            let results: Results? = try? unbox(data: data)
            completed(results)
        }
    }
    
    static func showTweetComposer(fromVC: UIViewController, completion: @escaping (TWTRComposerResult) -> Void){
        let composer = TWTRComposer()
        composer.setText("\n\n#筋肉swift")
        composer.show(from: fromVC) { result in
            completion(result)
        }
    }
}

