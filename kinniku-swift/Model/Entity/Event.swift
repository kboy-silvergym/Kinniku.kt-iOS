//
//  Event.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/25.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Unbox

struct Event: Unboxable {
    let time: String
    let title: String
    let description: String
    
    init(unboxer: Unboxer) throws {
        self.time  = unboxer.unbox(key: "time") ?? ""
        self.title  = unboxer.unbox(key: "title") ?? ""
        self.description = unboxer.unbox(key: "description") ?? ""
    }
}
