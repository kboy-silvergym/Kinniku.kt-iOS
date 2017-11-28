//
//  Sponsor.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/25.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Unbox

struct Sponsor: Unboxable {
    let name: String
    let type: String
    let imgURL: String
    let title: String
    let url: String
    let description: String
    
    init(unboxer: Unboxer) throws {
        self.name    = unboxer.unbox(key: "name") ?? ""
        self.type    = unboxer.unbox(key: "type") ?? ""
        self.imgURL   = unboxer.unbox(key: "imgURL") ?? ""
        self.title  = unboxer.unbox(key: "title") ?? ""
        self.url = unboxer.unbox(key: "url") ?? ""
        self.description = unboxer.unbox(keyPath: "description") ?? ""
    }
}
