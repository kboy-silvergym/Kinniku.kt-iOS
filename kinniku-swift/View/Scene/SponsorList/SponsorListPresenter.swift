//
//  SponsorListPresenter.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/29.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import Foundation

class SponsorListPresenter {
    let firestore = CloudFirestore()
    
    func getSponsor(_ completion: @escaping (Error?, [Sponsor]) -> Void){
        firestore.getSponsor({ error, sponsors in
            completion(error, sponsors)
        })
    }
    
    func getPersonalSponsor(_ completion: @escaping (Error?, [PersonalSponsor]) -> Void){
        firestore.getPersonalSponsor({ error, sponsors in
            completion(error, sponsors)
        })
    }
}
