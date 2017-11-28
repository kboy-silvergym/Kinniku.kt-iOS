//
//  Results.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/13.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Unbox

struct Results: Unboxable {
    let tweets: [Tweet]
    
    init(unboxer: Unboxer) throws {
        tweets = unboxer.unbox(keyPath: "statuses") ?? []
    }
}
