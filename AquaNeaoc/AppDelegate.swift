//
//  AppDelegate.swift
//  AquaNeaoc
//
//  Created by  on 2026/1/15.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        if   let upage =  UserDefaults.standard.object(forKey: "ANEAOQUVALCfolkRock") as? Int{
            window?.rootViewController = ANEAOQUVALCMainNavigationHub()
        }else{
            let guideing = UINavigationController(rootViewController: ANEAOQUVALCLoginViewController())
            guideing.navigationBar.isHidden = true
            window?.rootViewController = guideing
        }
        
        window?.makeKeyAndVisible()
        return true
    }

}

