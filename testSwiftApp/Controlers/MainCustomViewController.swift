//
//  MainCustomViewController.swift
//  testSwiftApp
//
//  Created by Ola Skierbiszewska on 17/04/2017.
//  Copyright © 2017 q. All rights reserved.
//

import UIKit

class MainCustomViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor.purple
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = UIColor.green
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.yellow]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.title = "Yolo"
        
        super.pushViewController(viewController, animated: animated)
    }
}
