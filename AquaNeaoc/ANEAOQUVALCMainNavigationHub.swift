//
//  ANEAOQUVALCMainNavigationHub.swift
//  AquaNeaoc
//
//  Created by  on 2026/1/15.
//

import UIKit

class ANEAOQUVALCMainNavigationHub: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ANEAOQUVALCInitializeStageMatrix()
        ANEAOQUVALCConfigureTabVibe()
    }

    private func ANEAOQUVALCInitializeStageMatrix() {
        let ANEAOQUVALCHomeRoot = ANEAOQUVALCFestivalPortalController()
        let ANEAOQUVALCVideoRoot = ANEAOQUVALCDiscoveryPortalController() // Placeholder
        let ANEAOQUVALCMusicRoot = ANEAOQUVALCFeedsStreamController() // Placeholder
        let ANEAOQUVALCChatRoot = ANEAOQUVALCMessageHubController()  // Placeholder
        let ANEAOQUVALCUserRoot = ANEAOQUVALCProfileHubController()  // Placeholder

        viewControllers = [
            ANEAOQUVALCWrapInNav(ANEAOQUVALCHomeRoot, "ANEAOQUVALChome"),
            ANEAOQUVALCWrapInNav(ANEAOQUVALCVideoRoot, "ANEAOQUVALCplay"),
            ANEAOQUVALCWrapInNav(ANEAOQUVALCMusicRoot, "ANEAOQUVALCcenter"),
            ANEAOQUVALCWrapInNav(ANEAOQUVALCChatRoot, "ANEAOQUVALCmsg"),
            ANEAOQUVALCWrapInNav(ANEAOQUVALCUserRoot, "ANEAOQUVALCwo")
        ]
    }

    private func ANEAOQUVALCWrapInNav(_ ANEAOQUVALCRoot: UIViewController, _ ANEAOQUVALCIcon: String) -> UINavigationController {
        let ANEAOQUVALCNav = UINavigationController(rootViewController: ANEAOQUVALCRoot)
        ANEAOQUVALCNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: ANEAOQUVALCIcon)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: ANEAOQUVALCIcon + "1")?.withRenderingMode(.alwaysOriginal))
        ANEAOQUVALCNav.navigationBar.isHidden = true
        return ANEAOQUVALCNav
    }

    private func ANEAOQUVALCConfigureTabVibe() {
        tabBar.tintColor = UIColor(red: 1.00, green: 0.30, blue: 0.58, alpha: 1.00)
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tabBar.isTranslucent = false
        let apperr = UITabBarAppearance.init()
        apperr.backgroundColor = .black
        tabBar.standardAppearance  = apperr
    }
}
