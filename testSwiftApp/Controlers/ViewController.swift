//
//  ViewController.swift
//  testSwiftApp
//
//  Created by Ola Skierbiszewska on 15/04/2017.
//  Copyright © 2017 q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red;


        if let panRec = self.revealViewController()?.panGestureRecognizer(){
            self.view.addGestureRecognizer(panRec)
            
            let menuItem = UIBarButtonItem(image: UIImage.init(named: "ico_menu"), style: .plain, target: self.revealViewController(), action: #selector(self.revealViewController()?.revealToggle(_:)))
            
            self.navigationItem.leftBarButtonItems = [menuItem]
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

    func backButtonTapped() {
        let vc = ViewController(nibName: nil, bundle: nil)
        vc.view.backgroundColor = UIColor.orange
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showMessage() {
        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in print("yolo")}))
        present(alertController, animated: true, completion: nil)
    }

    func somehandler(alert: UIAlertAction!){
        
    }
}

