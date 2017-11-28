//
//  LoginPresenter.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/29.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    func login(_ completion: @escaping (Error?) -> Void){
        AuthAPI.login({ error in
            UserDefaultsStore.shared.saveRegister()
            completion(error)
        })
    }
    
}
