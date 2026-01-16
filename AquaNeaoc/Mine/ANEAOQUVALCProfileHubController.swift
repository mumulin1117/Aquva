//
//  ANEAOQUVALCProfileHubController.swift
//  AquaNeaoc
//
//  Created by mumu on 2026/1/16.
//

import UIKit

class ANEAOQUVALCProfileHubController: UIViewController {

    private let ANEAOQUVALCMainScroller = UIScrollView()
    private let ANEAOQUVALCPortraitOrb = UIImageView()
    private let ANEAOQUVALCNameTag = UILabel()
    private let ANEAOQUVALCStatusBridge = UIStackView()
    private let ANEAOQUVALCToggleBar = UIStackView()
    private let ANEAOQUVALCGridDisplay: UIImageView = {
        let ANEAOQUVALCLayout = UIImageView.init(image: UIImage.init(named: "aneaoquvalc_empty_msg"))
        return ANEAOQUVALCLayout
    }()
    
    private var ANEAOQUVALCActiveSegment: Int = 0
//    private let ANEAOQUVALCMockGrids = Array(repeating: "placeholder", count: 12)

    
    lazy var ANEAOQUVALCEditButton:UIButton = {
        let ANEAOQUVALCMainPulse = UIButton(type: .custom)
        ANEAOQUVALCMainPulse.setImage(UIImage.init(named: "ANEAOQUVALCedit"), for: .normal)
        ANEAOQUVALCMainPulse.imageView?.contentMode = .scaleAspectFit
        ANEAOQUVALCMainPulse.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainPulse.addTarget(self, action: #selector(ANEAOQUVALCstartToggle), for: .touchUpInside)
        
        return ANEAOQUVALCMainPulse
    }()
    
    
    @objc func ANEAOQUVALCstartToggle(){
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.98, green: 0.97, blue: 0.95, alpha: 1.00)
        ANEAOQUVALCBuildIdentityInterface()
        ANEAOQUVALCConfigureActionEvents()
    }

    private func ANEAOQUVALCBuildIdentityInterface() {
        ANEAOQUVALCMainScroller.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCMainScroller)

        let ANEAOQUVALCHeaderBox = UIView()
        ANEAOQUVALCHeaderBox.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainScroller.addSubview(ANEAOQUVALCHeaderBox)

        let ANEAOQUVALCBigTitle = UIImageView(image: UIImage.init(named: "ANEAOQUVALCMine"))
        ANEAOQUVALCBigTitle.contentMode = .scaleAspectFill
        ANEAOQUVALCBigTitle.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderBox.addSubview(ANEAOQUVALCBigTitle)

        ANEAOQUVALCPortraitOrb.layer.cornerRadius = 75
        ANEAOQUVALCPortraitOrb.layer.borderWidth = 4
        ANEAOQUVALCPortraitOrb.layer.borderColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00).cgColor
        ANEAOQUVALCPortraitOrb.clipsToBounds = true
        //
//        ANEAOQUVALCPortraitOrb.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "aneaoquvalc_user_avatar")
        ANEAOQUVALCPortraitOrb.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderBox.addSubview(ANEAOQUVALCPortraitOrb)

        ANEAOQUVALCNameTag.text = "SoundFlick"
        ANEAOQUVALCNameTag.font = UIFont.systemFont(ofSize: 28, weight: .black)
        ANEAOQUVALCNameTag.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderBox.addSubview(ANEAOQUVALCNameTag)
        
        ANEAOQUVALCHeaderBox.addSubview(ANEAOQUVALCEditButton)

        let ANEAOQUVALCQuickStack = UIStackView()
        ANEAOQUVALCQuickStack.axis = .horizontal
        ANEAOQUVALCQuickStack.spacing = 15
        ANEAOQUVALCQuickStack.distribution = .fillEqually
        ANEAOQUVALCQuickStack.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderBox.addSubview(ANEAOQUVALCQuickStack)

        let ANEAOQUVALCWalletBtn = ANEAOQUVALCBuildUtilityBtn(title: "Wallet", icon: "ANEAOQUVALCwallot", color: UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00))
        let ANEAOQUVALCSetBtn = ANEAOQUVALCBuildUtilityBtn(title: "Settings", icon: "ANEAOQUVALCset", color: UIColor(red: 1.00, green: 0.18, blue: 0.55, alpha: 1.00))
        ANEAOQUVALCQuickStack.addArrangedSubview(ANEAOQUVALCWalletBtn)
        ANEAOQUVALCQuickStack.addArrangedSubview(ANEAOQUVALCSetBtn)

        ANEAOQUVALCStatusBridge.axis = .horizontal
        ANEAOQUVALCStatusBridge.distribution = .equalCentering
        ANEAOQUVALCStatusBridge.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderBox.addSubview(ANEAOQUVALCStatusBridge)
        
        let ANEAOQUVALCStats = [("0", "Following"), ("0", "Followers"), ("0", "Like")]
        for (index, item) in ANEAOQUVALCStats.enumerated() {
            let btn = ANEAOQUVALCBuildStatNode(count: item.0, label: item.1, tag: index)
            ANEAOQUVALCStatusBridge.addArrangedSubview(btn)
        }

        ANEAOQUVALCToggleBar.axis = .horizontal
        ANEAOQUVALCToggleBar.spacing = 12
        ANEAOQUVALCToggleBar.distribution = .fillEqually
        ANEAOQUVALCToggleBar.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderBox.addSubview(ANEAOQUVALCToggleBar)
        
        let ANEAOQUVALCSections = ["Post", "Activity", "Collect"]
        for (index, title) in ANEAOQUVALCSections.enumerated() {
            let btn = UIButton(type: .custom)
            btn.setTitle(title, for: .normal)
            btn.layer.cornerRadius = 14
            btn.layer.borderWidth = 1.5
            btn.layer.borderColor = UIColor.black.cgColor
            btn.tag = index
            btn.addTarget(self, action: #selector(ANEAOQUVALCSwitchTab(_:)), for: .touchUpInside)
            ANEAOQUVALCToggleBar.addArrangedSubview(btn)
            ANEAOQUVALCRefreshTabStyle(btn, active: index == 0)
        }

        
        ANEAOQUVALCGridDisplay.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainScroller.addSubview(ANEAOQUVALCGridDisplay)

        NSLayoutConstraint.activate([
            ANEAOQUVALCMainScroller.topAnchor.constraint(equalTo: view.topAnchor),
            ANEAOQUVALCMainScroller.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ANEAOQUVALCMainScroller.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCMainScroller.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            ANEAOQUVALCHeaderBox.topAnchor.constraint(equalTo: ANEAOQUVALCMainScroller.topAnchor),
            ANEAOQUVALCHeaderBox.widthAnchor.constraint(equalTo: ANEAOQUVALCMainScroller.widthAnchor),

            ANEAOQUVALCBigTitle.topAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.topAnchor, constant: 20),
            ANEAOQUVALCBigTitle.leadingAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.leadingAnchor, constant: 20),

            ANEAOQUVALCPortraitOrb.topAnchor.constraint(equalTo: ANEAOQUVALCBigTitle.bottomAnchor, constant: 20),
            ANEAOQUVALCPortraitOrb.centerXAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.centerXAnchor),
            ANEAOQUVALCPortraitOrb.widthAnchor.constraint(equalToConstant: 150),
            ANEAOQUVALCPortraitOrb.heightAnchor.constraint(equalToConstant: 150),
            ANEAOQUVALCEditButton.widthAnchor.constraint(equalToConstant: 35),
            ANEAOQUVALCEditButton.heightAnchor.constraint(equalToConstant: 35),
            ANEAOQUVALCEditButton.bottomAnchor.constraint(equalTo: ANEAOQUVALCPortraitOrb.bottomAnchor),
            ANEAOQUVALCEditButton.trailingAnchor.constraint(equalTo: ANEAOQUVALCPortraitOrb.trailingAnchor),
            
            
            
            ANEAOQUVALCNameTag.topAnchor.constraint(equalTo: ANEAOQUVALCPortraitOrb.bottomAnchor, constant: 15),
            ANEAOQUVALCNameTag.centerXAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.centerXAnchor),

            ANEAOQUVALCQuickStack.topAnchor.constraint(equalTo: ANEAOQUVALCNameTag.bottomAnchor, constant: 25),
            ANEAOQUVALCQuickStack.leadingAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.leadingAnchor, constant: 20),
            ANEAOQUVALCQuickStack.trailingAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.trailingAnchor, constant: -20),
            ANEAOQUVALCQuickStack.heightAnchor.constraint(equalToConstant: 60),

            ANEAOQUVALCStatusBridge.topAnchor.constraint(equalTo: ANEAOQUVALCQuickStack.bottomAnchor, constant: 25),
            ANEAOQUVALCStatusBridge.leadingAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.leadingAnchor, constant: 50),
            ANEAOQUVALCStatusBridge.trailingAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.trailingAnchor, constant: -50),

            ANEAOQUVALCToggleBar.topAnchor.constraint(equalTo: ANEAOQUVALCStatusBridge.bottomAnchor, constant: 30),
            ANEAOQUVALCToggleBar.leadingAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.leadingAnchor, constant: 20),
            ANEAOQUVALCToggleBar.trailingAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.trailingAnchor, constant: -20),
            ANEAOQUVALCToggleBar.heightAnchor.constraint(equalToConstant: 45),
            ANEAOQUVALCToggleBar.bottomAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.bottomAnchor, constant: -10),

            ANEAOQUVALCGridDisplay.topAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.bottomAnchor, constant: 15),
            ANEAOQUVALCGridDisplay.centerXAnchor.constraint(equalTo: ANEAOQUVALCMainScroller.centerXAnchor),
            ANEAOQUVALCGridDisplay.heightAnchor.constraint(equalToConstant: 150),
            ANEAOQUVALCGridDisplay.bottomAnchor.constraint(equalTo: ANEAOQUVALCMainScroller.bottomAnchor)
        ])
    }

    private func ANEAOQUVALCBuildUtilityBtn(title: String, icon: String, color: UIColor) -> UIButton {
        let btn = UIButton()
        btn.backgroundColor = color
        btn.setTitle(" \(title)", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.setImage(UIImage(named: icon), for: .normal)
        btn.tintColor = .black
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.layer.cornerRadius = 18
        return btn
    }

    private func ANEAOQUVALCBuildStatNode(count: String, label: String, tag: Int) -> UIButton {
        let btn = UIButton(type: .custom)
        let attr = NSMutableAttributedString(string: "\(count)\n", attributes: [.font: UIFont.systemFont(ofSize: 22, weight: .black), .foregroundColor: UIColor.black])
        attr.append(NSAttributedString(string: label, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray]))
        btn.setAttributedTitle(attr, for: .normal)
        btn.titleLabel?.numberOfLines = 2
        btn.titleLabel?.textAlignment = .center
        btn.tag = tag
        btn.addTarget(self, action: #selector(ANEAOQUVALCEnterSubsonicLayer(_:)), for: .touchUpInside)
        return btn
    }

    @objc private func ANEAOQUVALCEnterSubsonicLayer(_ sender: UIButton) {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.title = "Details"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func ANEAOQUVALCSwitchTab(_ sender: UIButton) {
        ANEAOQUVALCActiveSegment = sender.tag
        ANEAOQUVALCToggleBar.arrangedSubviews.forEach {
            if let b = $0 as? UIButton { ANEAOQUVALCRefreshTabStyle(b, active: b.tag == sender.tag) }
        }
        
    }

    private func ANEAOQUVALCRefreshTabStyle(_ btn: UIButton, active: Bool) {
        btn.backgroundColor = active ? .black : .white
        btn.setTitleColor(active ? UIColor(red: 0.86, green: 1, blue: 0, alpha: 1) : .black, for: .normal)
    }

    private func ANEAOQUVALCConfigureActionEvents() {}
}

