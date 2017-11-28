//
//  UserDefaultsStore.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/13.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Foundation

class UserDefaultsStore {
    
    static var shared = UserDefaultsStore()
    private init(){}
    
    let userDefaults = UserDefaults.standard
    
    let isRegister: String = "isRegister"
    
    func saveRegister(){
        userDefaults.set(true, forKey: self.isRegister)
        userDefaults.synchronize()
    }
    
    func getIsRegister() -> Bool {
        let isRegister = userDefaults.bool(forKey: self.isRegister)
        return isRegister
    }
    
}
