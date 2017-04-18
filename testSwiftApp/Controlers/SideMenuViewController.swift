//
//  SideMenuViewController.swift
//  testSwiftApp
//
//  Created by Ola Skierbiszewska on 17/04/2017.
//  Copyright © 2017 q. All rights reserved.
//

import UIKit
import SnapKit

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView?

    override func loadView() {
        super.loadView()
        tableView = UITableView.init()
        self.view.addSubview(tableView!)
        tableView?.backgroundColor = UIColor.green
        tableView?.snp.makeConstraints { (make) -> Void in
            make.left.bottom.right.top.equalTo(self.view)
        }
        tableView?.tableFooterView = UIView.init(frame: CGRect.zero)
        tableView?.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: (tableView?.frame.size.width)!, height: 64))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell : UITableViewCell = tableView .dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "menuCell")
        
        cell.textLabel!.text = "menu item \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
