//
//  HostViewController.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/11.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class HostViewController: MenuContainerViewController {
    let presenter = HostPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewControllerセットアップ
        self.menuViewController = self.storyboard!.instantiateViewController(withIdentifier: "SideMenuViewController") as! MenuViewController
        self.contentViewControllers = presenter.getContentControllers()
        self.selectContentViewController(contentViewControllers[1])
        
        // 通知セットアップ
        presenter.setupNotification()
    }
}
