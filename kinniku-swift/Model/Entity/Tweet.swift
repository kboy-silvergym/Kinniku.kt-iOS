//
//  Tweet.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/12.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Unbox

struct Tweet: Unboxable {
    let id: String
    let user: TweetUser?
    let text: String
    let createdAt: String
    var tweetMedias: [TweetMedia] = []
    
    init(unboxer: Unboxer) throws {
        self.id          = unboxer.unbox(key: "id") ?? ""
        self.createdAt   = unboxer.unbox(key: "created_at") ?? ""
        self.text        = unboxer.unbox(key: "text") ?? ""
        self.user        = unboxer.unbox(key: "user")
        self.tweetMedias = unboxer.unbox(keyPath: "entities.media") ?? []
    }
}
