//
//  AcknowledgementsViewController.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/20.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//
// 以下を参考に作成
// https://qiita.com/DiceK08/items/1121e60673c2ecd3a51b

import UIKit

class AcknowledgementsViewController: UIViewController {
    
    var items: [Any] = []
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = Bundle.url(forResource: "Acknowledgements",
                                 withExtension: "plist",
                                 subdirectory: nil,
                                 in: Bundle.main.url(forResource: "Settings", withExtension: "bundle")!) {
            
            let dic = NSDictionary(contentsOf: path)!
            self.items = dic["PreferenceSpecifiers"] as! [Any]
            
            // 最初と最後以外が必要な情報
            self.items.removeFirst()
            self.items.removeLast()
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - <#UITableViewDataSource#>
extension AcknowledgementsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        
        if let item = self.items[indexPath.row] as? [String : String] {
            cell.textLabel?.text = item["Title"]
            cell.textLabel?.font = UIFont.logoG.medium.font(17)
            cell.textLabel?.textColor = UIColor.themeBlack
        }
        return cell
    }
}


// MARK: - <#UITableViewDelegate#>
extension AcknowledgementsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toLicense", sender: self)
    }
}

extension AcknowledgementsViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LicenseViewController,
            let row = tableView.indexPathForSelectedRow?.row,
            let item = self.items[row] as? [String : String] {
            vc.title = item["Title"]
            vc.licenseText = item["License"]
            vc.footerText = item["FooterText"]
        }
    }
}
