//
//  PersonalSponsor.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/25.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Unbox

struct PersonalSponsor: Unboxable {
    let screenName: String
    let imgURL: String
    
    init(unboxer: Unboxer) throws {
        self.screenName  = unboxer.unbox(key: "screenName") ?? ""
        self.imgURL    = unboxer.unbox(keyPath: "imgURL") ?? ""
    }
}
