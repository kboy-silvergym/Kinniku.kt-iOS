//
//  TweetMedia.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/12.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Unbox

struct TweetMedia: Unboxable {
    let id: String
    let url: String
    let type: String
    
    init(unboxer: Unboxer) throws {
        self.id    = unboxer.unbox(key: "id") ?? ""
        self.url   = unboxer.unbox(key: "media_url_https") ?? ""
        self.type  = unboxer.unbox(key: "type") ?? ""
    }
}

