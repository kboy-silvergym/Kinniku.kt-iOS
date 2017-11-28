//
//  AboutAppViewController.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/13.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SafariServices

class AboutAppViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let menuString: [String] = ["バージョン", "github", "謝辞"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }

    @IBAction func menuButtonTapped(_ sender: Any) {
        if let navigationViewController = self.navigationController as? SideMenuItemContent {
            navigationViewController.showSideMenu()
        }
    }
}

// MARK: - <#UITableViewDataSource#>
extension AboutAppViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = menuString[indexPath.row]
        
        if menuString[indexPath.row] == "バージョン" {
            if let verString: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
                cell.detailTextLabel?.text = verString
            }
        }
        return cell
    }
}


// MARK: - <#UITableViewDelegate#>
extension AboutAppViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            // バージョン
            break
        case 1:
            // github
            let urlString = "https://github.com/kboy-silvergym/KinnikuSwift"
            if let url = URL(string: urlString) {
                let safariViewController = SFSafariViewController(url: url)
                self.present(safariViewController, animated: true, completion: nil)
            }
        case 2:
            // 謝辞
            performSegue(withIdentifier: "toAcknowledgements", sender: self)
        default:
            break
        }
    }
}
