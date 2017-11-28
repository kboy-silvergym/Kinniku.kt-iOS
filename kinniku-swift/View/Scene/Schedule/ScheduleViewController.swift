//
//  ScheduleViewController.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/13.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class ScheduleViewController: UIViewController {
    let presenter = SchedulePresenter()
    
    @IBOutlet weak var tableView: UITableView!
    
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.tableFooterView = UIView()

        let nib = UINib(nibName: String(describing: EventCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: EventCell.self))
        
        presenter.getEvent({ error, events in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.events = events
            self.tableView.reloadData()
        })
    }

    @IBAction func menuButtonTapped(_ sender: Any) {
        if let navigationViewController = self.navigationController as? SideMenuItemContent {
            navigationViewController.showSideMenu()
        }
    }
}

// MARK: - <#UITableViewDataSource#>
extension ScheduleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EventCell.self), for: indexPath) as! EventCell
        cell.event = events[indexPath.row]
        return cell
    }
}

