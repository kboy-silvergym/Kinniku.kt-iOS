//
//  HostPresenter.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/29.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit
import UserNotifications

class HostPresenter {
    
    func getContentControllers() -> [UIViewController] {
        let about = getController("About")
        let feed = getController("Feed")
        let schedule = getController("Schedule")
        let speaker = getController("SpeakerList")
        let sponsor = getController("SponsorList")
        let aboutApp = getController("AboutApp")
        
        return [about,
                feed,
                schedule,
                speaker,
                sponsor,
                aboutApp]
    }
    
    func setupNotification(){
        // プッシュ通知許可
        let authOptions: UNAuthorizationOptions = [.alert, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { granted, error in
        })
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    private func getController(_ storyboardName: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()!
        return vc
    }
}
