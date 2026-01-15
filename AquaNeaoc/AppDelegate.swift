//
//  AppDelegate.swift
//  AquaNeaoc
//
//  Created by mumu on 2026/1/15.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = ANEAOQUVALCMainNavigationHub()// ANEAOQUVALCLoginViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

