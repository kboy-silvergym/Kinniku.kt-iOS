//
//  SchedulePresenter.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/29.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

class SchedulePresenter {
    
    func getEvent(_ completion: @escaping (Error?, [Event]) -> Void){
        CloudFirestore().getEvent({ error, events in
            completion(error, events)
        })
    }
}
