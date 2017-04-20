//
//  ViewController.swift
//  testSwiftApp
//
//  Created by Ola Skierbiszewska on 15/04/2017.
//  Copyright © 2017 q. All rights reserved.
//

import UIKit
import Moya
import Result
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red;
        
        self.addTestButton()

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
    
    func addTestButton(){
        let testButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        testButton.backgroundColor = UIColor.red
        self.view.addSubview(testButton)
        testButton.addTarget(self, action:  #selector(makeTestRequest), for: UIControlEvents.touchUpInside)
    }
    
    func makeTestRequest(){
        let provider = MoyaProvider<TestTarget>()
        provider.request(.listOfTopArticles) { result in
            if let val: Response = result.value{
                switch val.statusCode{
                case 200:
                    print("code 200")
                    do {
                        if let json = try JSONSerialization.jsonObject(with: val.data, options: .allowFragments) as? [String: Any] {
                            //Implement your logic
                            
                            let ch = CharactersList(JSON: json)
                            print(json)
                        }
                    } catch {
                        print("error in JSONSerialization")
                    }
                    
                    do{
                        let jsonObject = try JSONSerialization.jsonObject(with: val.data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:AnyObject]
                        let dictionary: Dictionary? = NSKeyedUnarchiver.unarchiveObject(with: val.data) as? [String : Any]
                        let jsonString = String(data: val.data, encoding: .utf8)
                        
                        if let jsonString = jsonString {
                            let ch = CharactersList(JSONString: jsonString)
                            print("...")
                        }
                    }catch{
                            //TODO: handle
                    }
                   
                    break
                case 400, 500:
                    print("code 400, 500")
                    break
                default:
                    print("code - other")
                    break
                }
                
            }
            //handle error response
        }
    }
}

