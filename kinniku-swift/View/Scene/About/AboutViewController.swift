//
//  AboutViewController.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/11.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import WebKit

class AboutViewController: UIViewController {
    lazy var webView: WKWebView! = WKWebView()

    override func loadView() {
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(getRequest())
    }
    
    private func getRequest() -> URLRequest {
        let url = URL(string: "https://kinniku-swift.connpass.com/event/69438/")
        let request = URLRequest(url: url!)
        return request
    }

    @IBAction func menuButtonTapped(_ sender: Any) {
        if let navigationViewController = self.navigationController as? SideMenuItemContent {
            navigationViewController.showSideMenu()
        }
    }
}
