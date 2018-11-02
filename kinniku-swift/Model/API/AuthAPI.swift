//
//  AuthAPI.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/13.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import TwitterKit
import Firebase

class AuthAPI {
    
    static var isLogined: Bool {
        return Auth.auth().currentUser != nil
    }
    
    static func login(_ completion: @escaping (Error?) -> Void){
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            
            if let session = session {
                authFirebase(session, completion: { error in
                    completion(error)
                })
                return
            }
            completion(error)
        })
    }
    
    static func authFirebase(_ session: TWTRSession,
                                     completion: @escaping (Error?) -> Void){
        let credential = TwitterAuthProvider.credential(withToken: session.authToken,secret: session.authTokenSecret)
        // firebaseにサインイン
        Auth.auth().signIn(with: credential) { (user, error) in
            completion(error)
        }
    }
    
}
