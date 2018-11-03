//
//  name.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/12.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Foundation

extension Date {
    static let normalFormat = "yyyy/MM/dd HH:mm:ss"
    static let twitterFormat = "EEE MMM dd HH:mm:ss Z yyyy"
    
    func toString(format: String) -> String {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateStringFormatter.dateFormat = format
        return dateStringFormatter.string(from: self)
    }
    
    //何日前かをStringで取得する(例：１日前、３時間前)
    func getSpanStringFromNow() -> String {
        let date = self
        let span = Date().timeIntervalSince(date)
        
        let minuteSpan = span/60
        let hourSpan = span/60/60
        let daySpan = span/60/60/24
        let monthSpan = span/60/60/24/30
        
        if minuteSpan < 1 {
            return "たった今"
        }else if hourSpan < 1 {
            return Int(floor(minuteSpan)).description + "分前"
        }else if daySpan < 1 {
            return Int(floor(hourSpan)).description + "時間前"
        }else if monthSpan < 1{
            return Int(ceil(daySpan)).description + "日前"
        }else{
            return Int(floor(monthSpan)).description + "ヶ月前"
        }
    }
}

