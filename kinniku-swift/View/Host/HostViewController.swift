//
//  HostViewController.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/11.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import UserNotifications

class HostViewController: MenuContainerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewControllerセットアップ
        self.menuViewController = self.storyboard!.instantiateViewController(withIdentifier: "SideMenuViewController") as? MenuViewController
        self.contentViewControllers = getContentControllers()
        self.selectContentViewController(contentViewControllers[1])
        
        // 通知セットアップ
        setupNotification()
    }
    
    private func getContentControllers() -> [UIViewController] {
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
    
    private func setupNotification(){
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
