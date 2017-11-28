//
//  TweetUser.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/12.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Unbox

struct TweetUser: Unboxable {
    let id: String
    let name: String
    let screenName: String
    let description: String
    let imageUrl: String
    
    init(unboxer: Unboxer) throws {
        self.id          = unboxer.unbox(key: "id") ?? ""
        self.name        = unboxer.unbox(key: "name") ?? ""
        self.screenName  = unboxer.unbox(key: "screen_name") ?? ""
        self.description = unboxer.unbox(keyPath: "description") ?? ""
        self.imageUrl    = unboxer.unbox(keyPath: "profile_image_url_https") ?? ""
    }
}
