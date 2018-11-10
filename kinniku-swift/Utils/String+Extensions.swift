//
//  StringExtension.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/13.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Foundation

extension String {
    func toDate(dateFormat: String) -> Date?{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = dateFormat
        return formatter.date(from: self)
    }
}
