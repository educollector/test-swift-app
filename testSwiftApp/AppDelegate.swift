//
//  AppDelegate.swift
//  testSwiftApp
//
//  Created by Ola Skierbiszewska on 15/04/2017.
//  Copyright © 2017 q. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SWRevealViewControllerDelegate {

    var window: UIWindow?
    var swreveal: SWRevealViewController?
    var naviController: MainCustomViewController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        naviController = MainCustomViewController()
        let main:ViewController = ViewController.init()
        naviController?.viewControllers = [main]
        
        let sideMenu = SideMenuViewController.init()
//        sideMenu.mainView = main
        
        swreveal = SWRevealViewController.init()
        swreveal?.frontViewController = naviController
        swreveal?.rearViewController = sideMenu
        
        
        
        window?.rootViewController = self.swreveal// ViewController.init()
        self.window!.makeKeyAndVisible()

        let vc = ViewController(nibName: nil, bundle: nil)
        vc.view.backgroundColor = UIColor.yellow
        naviController?.pushViewController(vc, animated: true)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

