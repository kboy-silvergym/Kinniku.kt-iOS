//
//  AppDelegate.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/11.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit
import Firebase
import TwitterKit
import UserNotifications
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        TWTRTwitter.sharedInstance().start(withConsumerKey: AppConst.Twitter.consumerKey.rawValue, consumerSecret: AppConst.Twitter.consumerSecret.rawValue)
        
        // プッシュ通知
        UNUserNotificationCenter.current().delegate = self
        Messaging.messaging().delegate = self
        
        // 初回起動のstoryboardを選択する
        var storyboardName: String
        if UserDefaultsStore.shared.getIsRegister() {
            // ２回目以降
            storyboardName = "Main"
        } else {
            // 初回起動
            storyboardName = "Login"
        }
        let storybord: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = storybord.instantiateInitialViewController()
        window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let urlString = url.absoluteString
        if urlString.contains("twitter") {
            return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
        }
        return true
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}

extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        print(fcmToken)
    }
}

