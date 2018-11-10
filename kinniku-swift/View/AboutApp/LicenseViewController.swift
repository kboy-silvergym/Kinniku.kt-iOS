//
//  LicenseViewController.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/20.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

class LicenseViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var licenseText: String?
    var footerText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
}

// MARK: - <#UITableViewDataSource#>
extension LicenseViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        cell.textLabel?.text = licenseText
        cell.detailTextLabel?.text = footerText
        return cell
    }
}
