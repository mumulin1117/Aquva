//
//  ANEAOQUVALCDiscoveryPortalController.swift
//  AquaNeaoc
//
//  Created by mumu on 2026/1/16.
//

import UIKit

class ANEAOQUVALCDiscoveryPortalController: UIViewController {

    private let ANEAOQUVALCMainScrollPlane = UIScrollView()
    private let ANEAOQUVALCContentStack = UIStackView()
    
    private var ANEAOQUVALCSonicInsightBuffer: [[String:Any]] = []
    private var ANEAOQUVALCVisualMotionBuffer: [[String:Any]] = []

    // MARK: - Data Synchronization
    private func ANEAOQUVALCInitiateSonicFetch() {
        // 用户推荐请求
        ANEAOQUVALCFestivalRadioDispatcher.ANEAOQUVALCTransmitSonicWave(ANEAOQUVALCRoute: "/ugaburemkz/xixnfhnmkrydo", ANEAOQUVALCPayload: ["ANEAOQUVALCacousticVibe":"59350823"], ANEAOQUVALCOnSuccess: { [weak self] ANEAOQUVALdata in
            guard let MITTBuilsddata = ANEAOQUVALdata as? [String:Any], let result = MITTBuilsddata["data"] as? [[String:Any]] else { return }
            self?.ANEAOQUVALCSonicInsightBuffer = result
            DispatchQueue.main.async {
               
            }
        }, ANEAOQUVALCOnFailure: nil)
        
        // video数据请求
        ANEAOQUVALCFestivalRadioDispatcher.ANEAOQUVALCTransmitSonicWave(ANEAOQUVALCRoute: "/yqsrvbkcnz/pidfjq", ANEAOQUVALCPayload: ["ANEAOQUVALCbootleg":"59350823","ANEAOQUVALCcampground":20,"ANEAOQUVALCbroadcast":1], ANEAOQUVALCOnSuccess: { [weak self] ANEAOQUVALdata in
            guard let MITTBuilsddata = ANEAOQUVALdata as? [String:Any], let result = MITTBuilsddata["data"] as? [[String:Any]] else { return }
            self?.ANEAOQUVALCVisualMotionBuffer = result.filter({ allmo in
                allmo["ANEAOQUVALCdanceFloor"] as? String != nil
            })
            DispatchQueue.main.async {
               
            }
        }, ANEAOQUVALCOnFailure: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.98, green: 0.97, blue: 0.95, alpha: 1.00)
        ANEAOQUVALCInitializeDiscoveryCanvas()
        ANEAOQUVALCSyncRemoteDiscoveryWaves()
    }

    private func ANEAOQUVALCInitializeDiscoveryCanvas() {
        ANEAOQUVALCMainScrollPlane.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainScrollPlane.alwaysBounceVertical = true
        view.addSubview(ANEAOQUVALCMainScrollPlane)

        ANEAOQUVALCContentStack.axis = .vertical
        ANEAOQUVALCContentStack.spacing = 35
        ANEAOQUVALCContentStack.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainScrollPlane.addSubview(ANEAOQUVALCContentStack)

        NSLayoutConstraint.activate([
            ANEAOQUVALCMainScrollPlane.topAnchor.constraint(equalTo: view.topAnchor),
            ANEAOQUVALCMainScrollPlane.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ANEAOQUVALCMainScrollPlane.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCMainScrollPlane.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            ANEAOQUVALCContentStack.topAnchor.constraint(equalTo: ANEAOQUVALCMainScrollPlane.contentLayoutGuide.topAnchor),
            ANEAOQUVALCContentStack.leadingAnchor.constraint(equalTo: ANEAOQUVALCMainScrollPlane.contentLayoutGuide.leadingAnchor),
            ANEAOQUVALCContentStack.trailingAnchor.constraint(equalTo: ANEAOQUVALCMainScrollPlane.contentLayoutGuide.trailingAnchor),
            ANEAOQUVALCContentStack.bottomAnchor.constraint(equalTo: ANEAOQUVALCMainScrollPlane.contentLayoutGuide.bottomAnchor),
            ANEAOQUVALCContentStack.widthAnchor.constraint(equalTo: ANEAOQUVALCMainScrollPlane.frameLayoutGuide.widthAnchor)
        ])
    }

    private func ANEAOQUVALCSyncRemoteDiscoveryWaves() {
        // Mocking network latency and data fetching
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.ANEAOQUVALCSonicInsightBuffer = [
                ["tag": "Techno", "likes": "923 Likes"],
                ["tag": "Drum & Bass", "likes": "923 Likes"],
                ["tag": "House", "likes": "1.2k Likes"]
            ]
            self.ANEAOQUVALCVisualMotionBuffer = [
                ["prompt": "Rave mode: ON 🔥"],
                ["prompt": "Sunset Vibe 🌅"],
                ["prompt": "Midnight Sonic ⚡️"]
            ]
            self.ANEAOQUVALCConstructDiscoverySections()
        }
    }

    private func ANEAOQUVALCConstructDiscoverySections() {
        ANEAOQUVALCContentStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        ANEAOQUVALCAssembleExploreHeader()
        ANEAOQUVALCAssembleInsightCarousel()
        ANEAOQUVALCAssembleMotionCarousel()
    }

    private func ANEAOQUVALCAssembleExploreHeader() {
        let ANEAOQUVALCHeaderRow = UIView()
        ANEAOQUVALCHeaderRow.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        let ANEAOQUVALCTitleLabel = UIImageView(image: UIImage.init(named: "Aquvavidetitle"))
        ANEAOQUVALCTitleLabel.contentMode = .scaleAspectFit
        ANEAOQUVALCTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderRow.addSubview(ANEAOQUVALCTitleLabel)
        
        let ANEAOQUVALCAddAction = UIButton(type: .custom)
        ANEAOQUVALCAddAction.backgroundColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00)
        ANEAOQUVALCAddAction.layer.cornerRadius = 25
        ANEAOQUVALCAddAction.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .bold)), for: .normal)
        ANEAOQUVALCAddAction.tintColor = .black
        ANEAOQUVALCAddAction.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderRow.addSubview(ANEAOQUVALCAddAction)

        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCHeaderRow)
        
        NSLayoutConstraint.activate([
            ANEAOQUVALCTitleLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCHeaderRow.leadingAnchor, constant: 20),
            ANEAOQUVALCTitleLabel.bottomAnchor.constraint(equalTo: ANEAOQUVALCHeaderRow.bottomAnchor, constant: -10),
            ANEAOQUVALCAddAction.trailingAnchor.constraint(equalTo: ANEAOQUVALCHeaderRow.trailingAnchor, constant: -20),
            ANEAOQUVALCAddAction.centerYAnchor.constraint(equalTo: ANEAOQUVALCTitleLabel.centerYAnchor),
            ANEAOQUVALCAddAction.widthAnchor.constraint(equalToConstant: 50),
            ANEAOQUVALCAddAction.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Music Insights (Horizontal Scroll)
    private func ANEAOQUVALCAssembleInsightCarousel() {
        let ANEAOQUVALCSectionWrapper = UIStackView()
        ANEAOQUVALCSectionWrapper.axis = .vertical
        ANEAOQUVALCSectionWrapper.spacing = 15
        
        let ANEAOQUVALCLabel = UILabel()
        ANEAOQUVALCLabel.text = "Music Insights"
        ANEAOQUVALCLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        ANEAOQUVALCLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let ANEAOQUVALCContainer = UIView()
        ANEAOQUVALCContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let ANEAOQUVALCInsightScroll = UIScrollView()
        ANEAOQUVALCInsightScroll.showsHorizontalScrollIndicator = false
        ANEAOQUVALCInsightScroll.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCContainer.addSubview(ANEAOQUVALCInsightScroll)
        
        let ANEAOQUVALCItemTrack = UIStackView()
        ANEAOQUVALCItemTrack.axis = .horizontal
        ANEAOQUVALCItemTrack.spacing = 12
        ANEAOQUVALCItemTrack.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        ANEAOQUVALCItemTrack.isLayoutMarginsRelativeArrangement = true
        ANEAOQUVALCItemTrack.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCInsightScroll.addSubview(ANEAOQUVALCItemTrack)

        for (i,ANEAOQUVALCData) in (ANEAOQUVALCSonicInsightBuffer.enumerated()) {
            ANEAOQUVALCItemTrack.addArrangedSubview(ANEAOQUVALCBuildInsightPill(ANEAOQUVALCData, tag: i))
        }

        ANEAOQUVALCSectionWrapper.addArrangedSubview(ANEAOQUVALCBuildLabelContainer(ANEAOQUVALCLabel))
        ANEAOQUVALCSectionWrapper.addArrangedSubview(ANEAOQUVALCContainer)
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCSectionWrapper)

        NSLayoutConstraint.activate([
            ANEAOQUVALCInsightScroll.topAnchor.constraint(equalTo: ANEAOQUVALCContainer.topAnchor),
            ANEAOQUVALCInsightScroll.leadingAnchor.constraint(equalTo: ANEAOQUVALCContainer.leadingAnchor),
            ANEAOQUVALCInsightScroll.trailingAnchor.constraint(equalTo: ANEAOQUVALCContainer.trailingAnchor),
            ANEAOQUVALCInsightScroll.bottomAnchor.constraint(equalTo: ANEAOQUVALCContainer.bottomAnchor),
            ANEAOQUVALCItemTrack.topAnchor.constraint(equalTo: ANEAOQUVALCInsightScroll.topAnchor),
            ANEAOQUVALCItemTrack.bottomAnchor.constraint(equalTo: ANEAOQUVALCInsightScroll.bottomAnchor),
            ANEAOQUVALCItemTrack.leadingAnchor.constraint(equalTo: ANEAOQUVALCInsightScroll.leadingAnchor),
            ANEAOQUVALCItemTrack.trailingAnchor.constraint(equalTo: ANEAOQUVALCInsightScroll.trailingAnchor),
            ANEAOQUVALCItemTrack.heightAnchor.constraint(equalTo: ANEAOQUVALCInsightScroll.heightAnchor)
        ])
    }

    private func ANEAOQUVALCBuildInsightPill(_ ANEAOQUVALCDict: [String: Any],tag:Int) -> UIView {
        let ANEAOQUVALCPill = UIView()
        ANEAOQUVALCPill.backgroundColor = .black
        ANEAOQUVALCPill.layer.cornerRadius = 45
        ANEAOQUVALCPill.widthAnchor.constraint(equalToConstant: 220).isActive = true
        ANEAOQUVALCPill.tag = tag
        ANEAOQUVALCPill.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ANEAOQUVALCIUserEnter(taoerture:))))
        let ANEAOQUVALCIcon = UIImageView()
        ANEAOQUVALCIcon.layer.cornerRadius = 35
        ANEAOQUVALCIcon.clipsToBounds = true
        ANEAOQUVALCIcon.layer.borderWidth = 2
        ANEAOQUVALCIcon.layer.borderColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00).cgColor
        ANEAOQUVALCIcon.ANEAOQUVALCSyncOrganicVibe(from: ANEAOQUVALCDict["ANEAOQUVALCafterParty"] as? String ?? "")
        ANEAOQUVALCIcon.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCPill.addSubview(ANEAOQUVALCIcon)
        
        let ANEAOQUVALCTag = UILabel()
        ANEAOQUVALCTag.text = ANEAOQUVALCDict["ANEAOQUVALCafterHours"] as? String
        ANEAOQUVALCTag.textColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00)
        ANEAOQUVALCTag.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        ANEAOQUVALCTag.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCPill.addSubview(ANEAOQUVALCTag)
        
        let ANEAOQUVALCLikes = UILabel()
        ANEAOQUVALCLikes.text = "★ \(ANEAOQUVALCDict["ANEAOQUVALCbodySurfing"] as? Int ?? 0)"
        ANEAOQUVALCLikes.textColor = .white
        ANEAOQUVALCLikes.font = UIFont.systemFont(ofSize: 13)
        ANEAOQUVALCLikes.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCPill.addSubview(ANEAOQUVALCLikes)

        NSLayoutConstraint.activate([
            ANEAOQUVALCIcon.leadingAnchor.constraint(equalTo: ANEAOQUVALCPill.leadingAnchor, constant: 5),
            ANEAOQUVALCIcon.centerYAnchor.constraint(equalTo: ANEAOQUVALCPill.centerYAnchor),
            ANEAOQUVALCIcon.widthAnchor.constraint(equalToConstant: 75),
            ANEAOQUVALCIcon.heightAnchor.constraint(equalToConstant: 75),
            ANEAOQUVALCTag.leadingAnchor.constraint(equalTo: ANEAOQUVALCIcon.trailingAnchor, constant: 12),
            ANEAOQUVALCTag.topAnchor.constraint(equalTo: ANEAOQUVALCPill.topAnchor, constant: 25),
            ANEAOQUVALCLikes.leadingAnchor.constraint(equalTo: ANEAOQUVALCTag.leadingAnchor),
            ANEAOQUVALCLikes.topAnchor.constraint(equalTo: ANEAOQUVALCTag.bottomAnchor, constant: 4)
        ])
        return ANEAOQUVALCPill
    }



    private func ANEAOQUVALCBuildMotionCard(_ ANEAOQUVALCDict: [String: Any],tag:Int) -> UIView {
        let ANEAOQUVALCCard = UIView()
        ANEAOQUVALCCard.widthAnchor.constraint(equalToConstant: 280).isActive = true
        ANEAOQUVALCCard.tag = tag
        ANEAOQUVALCCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ANEAOQUVALCIactiveyEnter(taoerture:))))
        let ANEAOQUVALCImage = UIImageView()
        ANEAOQUVALCImage.contentMode = .scaleAspectFill
        ANEAOQUVALCImage.clipsToBounds = true
        ANEAOQUVALCImage.layer.cornerRadius = 35
        ANEAOQUVALCImage.backgroundColor = .blue
        ANEAOQUVALCImage.ANEAOQUVALCSyncOrganicVibe(from: ANEAOQUVALCDict["ANEAOQUVALCdanceFloor"] as? String ?? "")
        ANEAOQUVALCImage.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(ANEAOQUVALCImage)
        
        
        let userAvator = UIImageView()
        userAvator.contentMode = .scaleAspectFill
        userAvator.clipsToBounds = true
        userAvator.layer.cornerRadius = 25
        userAvator.backgroundColor = .blue
        userAvator.layer.borderWidth = 1
        userAvator.layer.borderColor = UIColor(red: 0.86, green: 1, blue: 0, alpha: 1).cgColor
        userAvator.ANEAOQUVALCSyncOrganicVibe(from: ANEAOQUVALCDict["ANEAOQUVALCcityFestival"] as? String ?? "")
        userAvator.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(userAvator)
        
        // Overlay Controls
        let ANEAOQUVALCPlayBtn = UIButton()
        ANEAOQUVALCPlayBtn.setBackgroundImage(UIImage.init(named: "GroupcellPplay"), for: .normal)
        ANEAOQUVALCPlayBtn.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(ANEAOQUVALCPlayBtn)
        
        let ANEAOQUVALCDesc = UILabel()
        ANEAOQUVALCDesc.text = ANEAOQUVALCDict["ANEAOQUVALCchillWave"] as? String ?? ""
        ANEAOQUVALCDesc.textColor = .white
        ANEAOQUVALCDesc.font = UIFont.systemFont(ofSize: 22, weight: .black)
        ANEAOQUVALCDesc.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(ANEAOQUVALCDesc)

        
        let ANEAOQUVALCreadyHeasr = UIImageView.init(image: UIImage.init(named: "ANEAOQUVALCreadyHeasr"))
        ANEAOQUVALCreadyHeasr.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(ANEAOQUVALCreadyHeasr)
        
        let ANEAOQUVALCReportBackdrop = UIButton.init()
        ANEAOQUVALCReportBackdrop.setImage(UIImage.init(named: "nokikonhreporet"), for: .normal)
        ANEAOQUVALCReportBackdrop.addTarget(self, action: #selector(ANEAOQUVALCExecuteContentAudit), for: .touchUpInside)
            
        ANEAOQUVALCReportBackdrop.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(ANEAOQUVALCReportBackdrop)
        
        
        NSLayoutConstraint.activate([
            ANEAOQUVALCImage.topAnchor.constraint(equalTo: ANEAOQUVALCCard.topAnchor),
            ANEAOQUVALCImage.leadingAnchor.constraint(equalTo: ANEAOQUVALCCard.leadingAnchor),
            ANEAOQUVALCImage.trailingAnchor.constraint(equalTo: ANEAOQUVALCCard.trailingAnchor),
            ANEAOQUVALCImage.bottomAnchor.constraint(equalTo: ANEAOQUVALCCard.bottomAnchor),
            
            userAvator.widthAnchor.constraint(equalToConstant: 50),
            userAvator.heightAnchor.constraint(equalToConstant: 50),
            userAvator.leadingAnchor.constraint(equalTo: ANEAOQUVALCCard.leadingAnchor,constant: 15),
            userAvator.topAnchor.constraint(equalTo:  ANEAOQUVALCCard.topAnchor,constant: 15),
            
            ANEAOQUVALCPlayBtn.bottomAnchor.constraint(equalTo: ANEAOQUVALCCard.bottomAnchor, constant: -19),
            ANEAOQUVALCPlayBtn.trailingAnchor.constraint(equalTo: ANEAOQUVALCCard.trailingAnchor,constant: -16),
            ANEAOQUVALCPlayBtn.widthAnchor.constraint(equalToConstant: 186),
            ANEAOQUVALCPlayBtn.heightAnchor.constraint(equalToConstant: 50),
            
            ANEAOQUVALCDesc.bottomAnchor.constraint(equalTo: ANEAOQUVALCPlayBtn.topAnchor, constant: -20),
            ANEAOQUVALCDesc.leadingAnchor.constraint(equalTo: ANEAOQUVALCCard.leadingAnchor, constant: 25),
            
            ANEAOQUVALCreadyHeasr.widthAnchor.constraint(equalToConstant:50),
            ANEAOQUVALCreadyHeasr.heightAnchor.constraint(equalToConstant: 50),
            ANEAOQUVALCreadyHeasr.leadingAnchor.constraint(equalTo: ANEAOQUVALCCard.leadingAnchor,constant: 15),
            ANEAOQUVALCreadyHeasr.centerYAnchor.constraint(equalTo: ANEAOQUVALCPlayBtn.centerYAnchor),
            
            
            ANEAOQUVALCReportBackdrop.widthAnchor.constraint(equalToConstant: 32),
            ANEAOQUVALCReportBackdrop.heightAnchor.constraint(equalToConstant: 32),
            ANEAOQUVALCReportBackdrop.trailingAnchor.constraint(equalTo: ANEAOQUVALCCard.trailingAnchor,constant: -15),
            ANEAOQUVALCReportBackdrop.topAnchor.constraint(equalTo:  ANEAOQUVALCCard.topAnchor,constant: 15),
        ])
        return ANEAOQUVALCCard
    }

    private func ANEAOQUVALCBuildLabelContainer(_ ANEAOQUVALCLabel: UILabel) -> UIView {
        let ANEAOQUVALCView = UIView()
        ANEAOQUVALCView.addSubview(ANEAOQUVALCLabel)
        ANEAOQUVALCLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ANEAOQUVALCLabel.topAnchor.constraint(equalTo: ANEAOQUVALCView.topAnchor),
            ANEAOQUVALCLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCView.leadingAnchor, constant: 20),
            ANEAOQUVALCLabel.bottomAnchor.constraint(equalTo: ANEAOQUVALCView.bottomAnchor)
        ])
        return ANEAOQUVALCView
    }
    
    @objc private func ANEAOQUVALCExecuteContentAudit() {
        let ANEAOQUVALCAlert = UIAlertController(title: "Report", message: "Thank you for your feedback. We will review this content shortly.", preferredStyle: .alert)
        ANEAOQUVALCAlert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(ANEAOQUVALCAlert, animated: true)
        
    }
}



// 继承 UIScrollViewDelegate 以获取滚动回调
extension ANEAOQUVALCDiscoveryPortalController: UIScrollViewDelegate {

    // MARK: - 精细化走马灯构建
    private func ANEAOQUVALCAssembleMotionCarousel() {
        let ANEAOQUVALCSectionWrapper = UIStackView()
        ANEAOQUVALCSectionWrapper.axis = .vertical
        ANEAOQUVALCSectionWrapper.spacing = 15
        
        let ANEAOQUVALCLabel = UILabel()
        ANEAOQUVALCLabel.text = "Video"
        ANEAOQUVALCLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
        let ANEAOQUVALCHorizontalScroll = UIScrollView()
        ANEAOQUVALCHorizontalScroll.isPagingEnabled = false
        ANEAOQUVALCHorizontalScroll.showsHorizontalScrollIndicator = false
        ANEAOQUVALCHorizontalScroll.delegate = self // 关键：设置代理
        ANEAOQUVALCHorizontalScroll.decelerationRate = .fast // 提高停顿感
        ANEAOQUVALCHorizontalScroll.heightAnchor.constraint(equalToConstant: 450).isActive = true
        
        let ANEAOQUVALCCardTrack = UIStackView()
        ANEAOQUVALCCardTrack.axis = .horizontal
        ANEAOQUVALCCardTrack.spacing = -20 // 适度负间距
        // 左右留白，确保第一张和最后一张能居中
        let ANEAOQUVALCInset = (UIScreen.main.bounds.width - 280) / 2
        ANEAOQUVALCCardTrack.layoutMargins = UIEdgeInsets(top: 0, left: ANEAOQUVALCInset, bottom: 0, right: ANEAOQUVALCInset)
        ANEAOQUVALCCardTrack.isLayoutMarginsRelativeArrangement = true
        ANEAOQUVALCCardTrack.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHorizontalScroll.addSubview(ANEAOQUVALCCardTrack)

        for (i,ANEAOQUVALCData) in ANEAOQUVALCVisualMotionBuffer.enumerated() {
            let ANEAOQUVALCCard = ANEAOQUVALCBuildMotionCard(ANEAOQUVALCData, tag: i)
            ANEAOQUVALCCardTrack.addArrangedSubview(ANEAOQUVALCCard)
        }

        ANEAOQUVALCSectionWrapper.addArrangedSubview(ANEAOQUVALCBuildLabelContainer(ANEAOQUVALCLabel))
        ANEAOQUVALCSectionWrapper.addArrangedSubview(ANEAOQUVALCHorizontalScroll)
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCSectionWrapper)

        NSLayoutConstraint.activate([
            ANEAOQUVALCCardTrack.topAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.topAnchor),
            ANEAOQUVALCCardTrack.bottomAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.bottomAnchor),
            ANEAOQUVALCCardTrack.leadingAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.leadingAnchor),
            ANEAOQUVALCCardTrack.trailingAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.trailingAnchor),
            ANEAOQUVALCCardTrack.heightAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.heightAnchor)
        ])
        
        // 初始化时执行一次缩放计算
        DispatchQueue.main.async {
            self.scrollViewDidScroll(ANEAOQUVALCHorizontalScroll)
        }
    }

    // MARK: - 实时缩放核心算法 (ANEAOQUVALCLogic)
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 仅处理 Video 模块的滚动视图
        guard let ANEAOQUVALCStack = scrollView.subviews.first as? UIStackView else { return }
        
        let ANEAOQUVALCCenterX = scrollView.contentOffset.x + scrollView.bounds.width / 2.0
        
        for ANEAOQUVALCItem in ANEAOQUVALCStack.arrangedSubviews {
            // 计算卡片中心与屏幕中心的距离
            let ANEAOQUVALCItemCenter = ANEAOQUVALCItem.convert(CGPoint(x: ANEAOQUVALCItem.bounds.midX, y: ANEAOQUVALCItem.bounds.midY), to: scrollView).x
            let ANEAOQUVALCDistance = abs(ANEAOQUVALCCenterX - ANEAOQUVALCItemCenter)
            
            // 设置缩放阈值：距离中心越近缩放倍率越高 (Max 1.0, Min 0.85)
            let ANEAOQUVALCScaleBase: CGFloat = 0.85
            let ANEAOQUVALCScaleRange: CGFloat = 0.15
            let ANEAOQUVALCActiveDistance: CGFloat = 200.0
            
            let ANEAOQUVALCPercentage = max(0, min(1, (ANEAOQUVALCActiveDistance - ANEAOQUVALCDistance) / ANEAOQUVALCActiveDistance))
            let ANEAOQUVALCFinalScale = ANEAOQUVALCScaleBase + (ANEAOQUVALCScaleRange * ANEAOQUVALCPercentage)
            
            // 应用缩放变换
            ANEAOQUVALCItem.transform = CGAffineTransform(scaleX: ANEAOQUVALCFinalScale, y: ANEAOQUVALCFinalScale)
            
            // 应用透明度变化 (Max 1.0, Min 0.6)
            ANEAOQUVALCItem.alpha = 0.6 + (0.4 * ANEAOQUVALCPercentage)
        }
    }
    
    // 实现吸附居中效果 (Snap Effect)
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let ANEAOQUVALCStack = scrollView.subviews.first as? UIStackView else { return }
        
        let ANEAOQUVALCItemWidth: CGFloat = 280 - 20 // 卡片宽 + 负间距
        let ANEAOQUVALCHalfWidth = ANEAOQUVALCItemWidth / 2
        
        var ANEAOQUVALCExpectedIndex = round(targetContentOffset.pointee.x / ANEAOQUVALCItemWidth)
        
        // 根据速度调整索引
        if velocity.x > 0.5 {
            ANEAOQUVALCExpectedIndex += 1
        } else if velocity.x < -0.5 {
            ANEAOQUVALCExpectedIndex -= 1
        }
        
        let ANEAOQUVALCMaxIndex = CGFloat(ANEAOQUVALCStack.arrangedSubviews.count - 1)
        let ANEAOQUVALCIndex = max(0, min(ANEAOQUVALCMaxIndex, ANEAOQUVALCExpectedIndex))
        
        targetContentOffset.pointee.x = ANEAOQUVALCIndex * ANEAOQUVALCItemWidth
    }
    
    
//用户点击
    @objc private func ANEAOQUVALCIUserEnter(taoerture:UITapGestureRecognizer) {
    let fenderData = ANEAOQUVALCSonicInsightBuffer[ taoerture.view?.tag ?? 0]["ANEAOQUVALCactiveListener"]  as? Int ?? 0
    
    let pageContetnt = ANEAOQUVALCStagePortalBridge.init(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCAttendeeBackstage.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: "\(fenderData)"))
    pageContetnt.hidesBottomBarWhenPushed = true
    self.navigationController?.pushViewController(pageContetnt, animated: true)
}


//video点击
 @objc private func ANEAOQUVALCIactiveyEnter(taoerture:UITapGestureRecognizer) {
     let fenderData = ANEAOQUVALCVisualMotionBuffer[ taoerture.view?.tag ?? 0][""]  as? Int ?? 0
     
     let pageContetnt = ANEAOQUVALCStagePortalBridge.init(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCMomentDeepDive.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: "\(fenderData)&type=2"))
     pageContetnt.hidesBottomBarWhenPushed = true
     self.navigationController?.pushViewController(pageContetnt, animated: true)
 }



//add video
@objc private func ANEAOQUVALCADDactiveyEnter(){
     
     let pageContetnt = ANEAOQUVALCStagePortalBridge.init(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCStudioUploader.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: ""))
     pageContetnt.hidesBottomBarWhenPushed = true
     self.navigationController?.pushViewController(pageContetnt, animated: true)
 }
}
