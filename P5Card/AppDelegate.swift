//
//  AppDelegate.swift
//  P5Card
//
//  Created by INnoVation on 2018/11/10.
//  Copyright © 2018 INnoVation. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = P5ViewController()
        
        
        return true
    }
 


}

