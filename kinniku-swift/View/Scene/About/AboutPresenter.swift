//
//  AboutPresenter.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/29.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Foundation

class AboutPresenter {
    
    func getRequest() -> URLRequest {
        let url = URL(string: "https://kinniku-swift.connpass.com/event/69438/")
        let request = URLRequest(url: url!)
        return request
    }
}
