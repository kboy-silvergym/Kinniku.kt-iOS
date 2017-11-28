//
//  Speaker.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/25.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Unbox

class Speaker: Unboxable {
    var id: String?
    let name: String
    let screenName: String
    let imgURL: String
    let title: String
    let point: Int
    let order: Int?
    
    required init(unboxer: Unboxer) throws {
        self.name       = unboxer.unbox(key: "name") ?? ""
        self.screenName = unboxer.unbox(key: "screenName") ?? ""
        self.imgURL     = unboxer.unbox(key: "imgURL") ?? ""
        self.title      = unboxer.unbox(key: "title") ?? "発表内容がここに表示されます"
        self.point      = unboxer.unbox(key: "point") ?? 0
        self.order      = unboxer.unbox(key: "order")
    }
    
    func setId(_ id: String){
        self.id = id
    }
}
