//
//  ANEAOQUVALCFestivalPortalController.swift
//  AquaNeaoc
//
//  Created by mumu on 2026/1/15.
//

import UIKit

import UIKit

class ANEAOQUVALCFestivalPortalController: UIViewController {
    @objc private func ANEAOQUVALCExecuteContentAudit() {
        let ANEAOQUVALCAlert = UIAlertController(title: "Report", message: "Thank you for your feedback. We will review this content shortly.", preferredStyle: .alert)
        ANEAOQUVALCAlert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(ANEAOQUVALCAlert, animated: true)
        
    }
    private let ANEAOQUVALCMainScrollPlane = UIScrollView()
    private let ANEAOQUVALCContentStack = UIStackView()
    
    // 动态数据容器
    private var ANEAOQUVALCEventStageData: [[String: String]] = []
    private var ANEAOQUVALCPotentialPeerData: [[String: String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.98, green: 0.96, blue: 0.94, alpha: 1)
        ANEAOQUVALCSetupBasicHierarchy()
        ANEAOQUVALCFetchLatestSonicWaves()
    }

    private func ANEAOQUVALCSetupBasicHierarchy() {
            // 1. 设置滚动视图
            ANEAOQUVALCMainScrollPlane.translatesAutoresizingMaskIntoConstraints = false
            // 确保垂直方向始终可以弹动，方便调试
            ANEAOQUVALCMainScrollPlane.alwaysBounceVertical = true
            view.addSubview(ANEAOQUVALCMainScrollPlane)
            
            // 2. 设置内容堆栈
            ANEAOQUVALCContentStack.axis = .vertical
            ANEAOQUVALCContentStack.spacing = 15
            ANEAOQUVALCContentStack.distribution = .fill // 确保内容自然拉伸
            ANEAOQUVALCContentStack.alignment = .fill
            ANEAOQUVALCContentStack.translatesAutoresizingMaskIntoConstraints = false
            ANEAOQUVALCMainScrollPlane.addSubview(ANEAOQUVALCContentStack)

            // 3. 核心约束：决定能否滚动的关键
            let ANEAOQUVALCContentGuide = ANEAOQUVALCMainScrollPlane.contentLayoutGuide
            let ANEAOQUVALCFrameGuide = ANEAOQUVALCMainScrollPlane.frameLayoutGuide

            NSLayoutConstraint.activate([
                // ScrollView 占据全屏
                ANEAOQUVALCMainScrollPlane.topAnchor.constraint(equalTo: view.topAnchor),
                ANEAOQUVALCMainScrollPlane.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                ANEAOQUVALCMainScrollPlane.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                ANEAOQUVALCMainScrollPlane.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                // StackView 紧贴 ScrollView 的 ContentLayoutGuide (决定滚动范围)
                ANEAOQUVALCContentStack.topAnchor.constraint(equalTo: ANEAOQUVALCContentGuide.topAnchor),
                ANEAOQUVALCContentStack.leadingAnchor.constraint(equalTo: ANEAOQUVALCContentGuide.leadingAnchor),
                ANEAOQUVALCContentStack.trailingAnchor.constraint(equalTo: ANEAOQUVALCContentGuide.trailingAnchor),
                ANEAOQUVALCContentStack.bottomAnchor.constraint(equalTo: ANEAOQUVALCContentGuide.bottomAnchor),

                // 锁定宽度：使 StackView 宽度等于 ScrollView 的屏幕宽度 (禁止横向滚动)
                ANEAOQUVALCContentStack.widthAnchor.constraint(equalTo: ANEAOQUVALCFrameGuide.widthAnchor)
            ])
        }

    // MARK: - 网络数据模拟刷新
    private func ANEAOQUVALCFetchLatestSonicWaves() {
        // 模拟网络请求
        ANEAOQUVALCFestivalRadioDispatcher.ANEAOQUVALCTransmitSonicWave(ANEAOQUVALCRoute: "/portal/sync", ANEAOQUVALCPayload: [:], ANEAOQUVALCOnSuccess: { [weak self] _ in
            // 模拟返回数据
            self?.ANEAOQUVALCEventStageData = [
                ["title": "SoundRush", "host": "Nina", "members": "42"],
                ["title": "Electric Night", "host": "Chaser", "members": "36"]
            ]
            self?.ANEAOQUVALCPotentialPeerData = [
                ["name": "Olivia", "fans": "13.9k", "posts": "53"],
                ["name": "Hailey", "fans": "12.4k", "posts": "48"]
            ]
            self?.ANEAOQUVALCRebuildDynamicInterface()
        }, ANEAOQUVALCOnFailure: nil)
    }

    private func ANEAOQUVALCRebuildDynamicInterface() {
        ANEAOQUVALCContentStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        ANEAOQUVALCInjectHeaderVisuals()
        ANEAOQUVALCInjectMusicEventSection()
        ANEAOQUVALCInjectPeerRecommendationSection()
    }
    // MARK: - Header Visual Component
        
    private func ANEAOQUVALCInjectHeaderVisuals() {
        let ANEAOQUVALCHeaderContainer = UIView()
        ANEAOQUVALCHeaderContainer.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderContainer.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        // App Logo Label
        let ANEAOQUVALCLogoLabel = UIImageView(image: UIImage.init(named: "AquvaHomtitle"))
        ANEAOQUVALCLogoLabel.contentMode = .scaleAspectFit
        ANEAOQUVALCLogoLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderContainer.addSubview(ANEAOQUVALCLogoLabel)
        
        // Plus/Add Action Trigger
        let ANEAOQUVALCAddVibeTrigger = UIButton(type: .custom)
        ANEAOQUVALCAddVibeTrigger.backgroundColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00)
        ANEAOQUVALCAddVibeTrigger.layer.cornerRadius = 25
        let ANEAOQUVALCPlusIcon = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .bold))
        ANEAOQUVALCAddVibeTrigger.setImage(ANEAOQUVALCPlusIcon, for: .normal)
        ANEAOQUVALCAddVibeTrigger.tintColor = .black
        ANEAOQUVALCAddVibeTrigger.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderContainer.addSubview(ANEAOQUVALCAddVibeTrigger)
        
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCHeaderContainer)
        
        NSLayoutConstraint.activate([
            ANEAOQUVALCLogoLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCHeaderContainer.leadingAnchor, constant: 20),
            ANEAOQUVALCLogoLabel.centerYAnchor.constraint(equalTo: ANEAOQUVALCHeaderContainer.centerYAnchor),
            ANEAOQUVALCLogoLabel.widthAnchor.constraint(equalToConstant: 125),
            ANEAOQUVALCLogoLabel.heightAnchor.constraint(equalToConstant: 52),
            
            
            
            ANEAOQUVALCAddVibeTrigger.trailingAnchor.constraint(equalTo: ANEAOQUVALCHeaderContainer.trailingAnchor, constant: -20),
            ANEAOQUVALCAddVibeTrigger.centerYAnchor.constraint(equalTo: ANEAOQUVALCHeaderContainer.centerYAnchor),
            ANEAOQUVALCAddVibeTrigger.widthAnchor.constraint(equalToConstant: 50),
            ANEAOQUVALCAddVibeTrigger.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Inject a subtle background vibe if needed
        let ANEAOQUVALCBackdropImg = UIImageView(frame: view.bounds)
        ANEAOQUVALCBackdropImg.contentMode = .scaleAspectFill
        // 使用 中的资源解密逻辑获取背景
        ANEAOQUVALCBackdropImg.image = ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "aneaoquvalc_portal_bg")
        ANEAOQUVALCBackdropImg.alpha = 0.05
        view.insertSubview(ANEAOQUVALCBackdropImg, at: 0)
        }
    // MARK: - Music Event 模块 (带渐变背景)
    private func ANEAOQUVALCInjectMusicEventSection() {
        let ANEAOQUVALCSectionContainer = UIView()
        
        // 1. 创建渐变背景
        let ANEAOQUVALCGradientLayer = CAGradientLayer()
        ANEAOQUVALCGradientLayer.colors = [
            UIColor(red: 1.00, green: 0.95, blue: 0.96, alpha: 1.0).cgColor,
            UIColor.white.cgColor
        ]
        ANEAOQUVALCGradientLayer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 380)
        ANEAOQUVALCSectionContainer.layer.insertSublayer(ANEAOQUVALCGradientLayer, at: 0)

        let ANEAOQUVALCTitleLabel = UILabel()
        ANEAOQUVALCTitleLabel.text = "Music events"
        ANEAOQUVALCTitleLabel.font = UIFont.systemFont(ofSize: 28, weight: .black)
        ANEAOQUVALCTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCSectionContainer.addSubview(ANEAOQUVALCTitleLabel)

        let ANEAOQUVALCHorizontalGallery = UIScrollView()
        ANEAOQUVALCHorizontalGallery.showsHorizontalScrollIndicator = false
        ANEAOQUVALCHorizontalGallery.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCSectionContainer.addSubview(ANEAOQUVALCHorizontalGallery)

        let ANEAOQUVALCCardTrack = UIStackView()
        ANEAOQUVALCCardTrack.axis = .horizontal
        ANEAOQUVALCCardTrack.spacing = 15
        ANEAOQUVALCCardTrack.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        ANEAOQUVALCCardTrack.isLayoutMarginsRelativeArrangement = true
        ANEAOQUVALCCardTrack.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHorizontalGallery.addSubview(ANEAOQUVALCCardTrack)

        // 填充动态卡片
        for ANEAOQUVALCInfo in ANEAOQUVALCEventStageData {
            let ANEAOQUVALCCard = ANEAOQUVALCAssembleEventUnit(ANEAOQUVALCInfo)
            ANEAOQUVALCCardTrack.addArrangedSubview(ANEAOQUVALCCard)
        }

        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCSectionContainer)

        NSLayoutConstraint.activate([
            ANEAOQUVALCSectionContainer.heightAnchor.constraint(equalToConstant: 375),
            ANEAOQUVALCTitleLabel.topAnchor.constraint(equalTo: ANEAOQUVALCSectionContainer.topAnchor, constant: 17),
            ANEAOQUVALCTitleLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCSectionContainer.leadingAnchor, constant: 20),
            
            ANEAOQUVALCHorizontalGallery.topAnchor.constraint(equalTo: ANEAOQUVALCTitleLabel.bottomAnchor, constant: 10),
            ANEAOQUVALCHorizontalGallery.leadingAnchor.constraint(equalTo: ANEAOQUVALCSectionContainer.leadingAnchor),
            ANEAOQUVALCHorizontalGallery.trailingAnchor.constraint(equalTo: ANEAOQUVALCSectionContainer.trailingAnchor),
            ANEAOQUVALCHorizontalGallery.bottomAnchor.constraint(equalTo: ANEAOQUVALCSectionContainer.bottomAnchor),
            
            ANEAOQUVALCCardTrack.centerYAnchor.constraint(equalTo: ANEAOQUVALCHorizontalGallery.centerYAnchor),
            ANEAOQUVALCCardTrack.leadingAnchor.constraint(equalTo: ANEAOQUVALCHorizontalGallery.leadingAnchor),
            ANEAOQUVALCCardTrack.trailingAnchor.constraint(equalTo: ANEAOQUVALCHorizontalGallery.trailingAnchor)
        ])
    }

    private func ANEAOQUVALCAssembleEventUnit(_ ANEAOQUVALCData: [String: String]) -> UIView {
            let ANEAOQUVALCUnit = UIView()
            ANEAOQUVALCUnit.backgroundColor = UIColor(red: 0.99, green: 0.96, blue: 0.91, alpha: 1.00) // 浅米色背景
            ANEAOQUVALCUnit.layer.cornerRadius = 24
            ANEAOQUVALCUnit.translatesAutoresizingMaskIntoConstraints = false
            ANEAOQUVALCUnit.widthAnchor.constraint(equalToConstant: 200).isActive = true
            ANEAOQUVALCUnit.heightAnchor.constraint(equalToConstant: 280).isActive = true

            // 1. 主视觉海报
            let ANEAOQUVALCPoster = UIImageView()
            ANEAOQUVALCPoster.layer.cornerRadius = 20
            ANEAOQUVALCPoster.clipsToBounds = true
            ANEAOQUVALCPoster.contentMode = .scaleAspectFill
            ANEAOQUVALCPoster.image = ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "aneaoquvalc_stage_mock")
            ANEAOQUVALCPoster.translatesAutoresizingMaskIntoConstraints = false
            ANEAOQUVALCUnit.addSubview(ANEAOQUVALCPoster)

            // 2. 活动标题
            let ANEAOQUVALCMainTitle = UILabel()
            ANEAOQUVALCMainTitle.text = ANEAOQUVALCData["title"] ?? "Unknown"
            ANEAOQUVALCMainTitle.font = UIFont.systemFont(ofSize: 18, weight: .black)
            ANEAOQUVALCMainTitle.translatesAutoresizingMaskIntoConstraints = false
            ANEAOQUVALCUnit.addSubview(ANEAOQUVALCMainTitle)
            
            // 3. 参与者层叠头像组与人数 (+39)
            let ANEAOQUVALCParticipantStack = UIStackView()
            ANEAOQUVALCParticipantStack.axis = .horizontal
            ANEAOQUVALCParticipantStack.spacing = -8 // 负间距实现重叠效果
            ANEAOQUVALCParticipantStack.translatesAutoresizingMaskIntoConstraints = false
            ANEAOQUVALCUnit.addSubview(ANEAOQUVALCParticipantStack)
            
            for _ in 0..<3 {
                let ANEAOQUVALCMiniAvatar = UIImageView()
                ANEAOQUVALCMiniAvatar.backgroundColor = .systemGray5
                ANEAOQUVALCMiniAvatar.layer.cornerRadius = 10
                ANEAOQUVALCMiniAvatar.layer.borderWidth = 1.5
                ANEAOQUVALCMiniAvatar.layer.borderColor = ANEAOQUVALCUnit.backgroundColor?.cgColor
                ANEAOQUVALCMiniAvatar.clipsToBounds = true
                ANEAOQUVALCMiniAvatar.widthAnchor.constraint(equalToConstant: 20).isActive = true
                ANEAOQUVALCMiniAvatar.heightAnchor.constraint(equalToConstant: 20).isActive = true
                ANEAOQUVALCParticipantStack.addArrangedSubview(ANEAOQUVALCMiniAvatar)
            }
            
            let ANEAOQUVALCCountLabel = UILabel()
            ANEAOQUVALCCountLabel.text = "+\(ANEAOQUVALCData["members"] ?? "0")"
            ANEAOQUVALCCountLabel.font = UIFont.systemFont(ofSize: 11, weight: .bold)
            ANEAOQUVALCCountLabel.textColor = .black
            ANEAOQUVALCCountLabel.translatesAutoresizingMaskIntoConstraints = false
            ANEAOQUVALCUnit.addSubview(ANEAOQUVALCCountLabel)

            // 4. Enter 按钮
            let ANEAOQUVALCEnterBtn = UIButton()
            ANEAOQUVALCEnterBtn.setTitle("Enter", for: .normal)
            ANEAOQUVALCEnterBtn.backgroundColor = .black
            ANEAOQUVALCEnterBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .black)
            ANEAOQUVALCEnterBtn.layer.cornerRadius = 15
            ANEAOQUVALCEnterBtn.translatesAutoresizingMaskIntoConstraints = false
            ANEAOQUVALCUnit.addSubview(ANEAOQUVALCEnterBtn)
            
            // 5. 底部发起人栏 (头像 + 名字 + 警告图标)
            let ANEAOQUVALCHostAvatar = UIImageView()
            ANEAOQUVALCHostAvatar.layer.cornerRadius = 12
            ANEAOQUVALCHostAvatar.clipsToBounds = true
            ANEAOQUVALCHostAvatar.backgroundColor = .systemGray4
            ANEAOQUVALCHostAvatar.translatesAutoresizingMaskIntoConstraints = false
            ANEAOQUVALCUnit.addSubview(ANEAOQUVALCHostAvatar)
            
            let ANEAOQUVALCHostName = UILabel()
            ANEAOQUVALCHostName.text = ANEAOQUVALCData["host"]
            ANEAOQUVALCHostName.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            ANEAOQUVALCHostName.textColor = .gray
            ANEAOQUVALCHostName.translatesAutoresizingMaskIntoConstraints = false
            ANEAOQUVALCUnit.addSubview(ANEAOQUVALCHostName)
            
            let ANEAOQUVALCAlertIcon = UIImageView(image: UIImage(systemName: "exclamationmark.circle"))
            ANEAOQUVALCAlertIcon.tintColor = .lightGray
            ANEAOQUVALCAlertIcon.translatesAutoresizingMaskIntoConstraints = false
            ANEAOQUVALCUnit.addSubview(ANEAOQUVALCAlertIcon)

            // MARK: - 约束布局 (严格对应 UI 设计图)
            NSLayoutConstraint.activate([
                ANEAOQUVALCPoster.topAnchor.constraint(equalTo: ANEAOQUVALCUnit.topAnchor, constant: 6),
                ANEAOQUVALCPoster.leadingAnchor.constraint(equalTo: ANEAOQUVALCUnit.leadingAnchor, constant: 6),
                ANEAOQUVALCPoster.trailingAnchor.constraint(equalTo: ANEAOQUVALCUnit.trailingAnchor, constant: -6),
                ANEAOQUVALCPoster.heightAnchor.constraint(equalToConstant: 160),
                
                ANEAOQUVALCMainTitle.topAnchor.constraint(equalTo: ANEAOQUVALCPoster.bottomAnchor, constant: 10),
                ANEAOQUVALCMainTitle.leadingAnchor.constraint(equalTo: ANEAOQUVALCUnit.leadingAnchor, constant: 12),
                
                ANEAOQUVALCParticipantStack.topAnchor.constraint(equalTo: ANEAOQUVALCMainTitle.bottomAnchor, constant: 8),
                ANEAOQUVALCParticipantStack.leadingAnchor.constraint(equalTo: ANEAOQUVALCUnit.leadingAnchor, constant: 12),
                
                ANEAOQUVALCCountLabel.centerYAnchor.constraint(equalTo: ANEAOQUVALCParticipantStack.centerYAnchor),
                ANEAOQUVALCCountLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCParticipantStack.trailingAnchor, constant: 4),
                
                ANEAOQUVALCEnterBtn.centerYAnchor.constraint(equalTo: ANEAOQUVALCParticipantStack.centerYAnchor),
                ANEAOQUVALCEnterBtn.trailingAnchor.constraint(equalTo: ANEAOQUVALCUnit.trailingAnchor, constant: -12),
                ANEAOQUVALCEnterBtn.widthAnchor.constraint(equalToConstant: 65),
                ANEAOQUVALCEnterBtn.heightAnchor.constraint(equalToConstant: 30),
                
                ANEAOQUVALCHostAvatar.leadingAnchor.constraint(equalTo: ANEAOQUVALCUnit.leadingAnchor, constant: 12),
                ANEAOQUVALCHostAvatar.bottomAnchor.constraint(equalTo: ANEAOQUVALCUnit.bottomAnchor, constant: -15),
                ANEAOQUVALCHostAvatar.widthAnchor.constraint(equalToConstant: 24),
                ANEAOQUVALCHostAvatar.heightAnchor.constraint(equalToConstant: 24),
                
                ANEAOQUVALCHostName.centerYAnchor.constraint(equalTo: ANEAOQUVALCHostAvatar.centerYAnchor),
                ANEAOQUVALCHostName.leadingAnchor.constraint(equalTo: ANEAOQUVALCHostAvatar.trailingAnchor, constant: 8),
                
                ANEAOQUVALCAlertIcon.centerYAnchor.constraint(equalTo: ANEAOQUVALCHostAvatar.centerYAnchor),
                ANEAOQUVALCAlertIcon.trailingAnchor.constraint(equalTo: ANEAOQUVALCUnit.trailingAnchor, constant: -12),
                ANEAOQUVALCAlertIcon.widthAnchor.constraint(equalToConstant: 18),
                ANEAOQUVALCAlertIcon.heightAnchor.constraint(equalToConstant: 18)
            ])
            
            return ANEAOQUVALCUnit
        }
    // MARK: - Maybe you like 模块 (精细化列表)
    private func ANEAOQUVALCInjectPeerRecommendationSection() {
        let ANEAOQUVALCRecommendationContainer = UIStackView()
        ANEAOQUVALCRecommendationContainer.axis = .vertical
        ANEAOQUVALCRecommendationContainer.spacing = 18
        ANEAOQUVALCRecommendationContainer.isLayoutMarginsRelativeArrangement = true
        ANEAOQUVALCRecommendationContainer.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 30, right: 20)

        let ANEAOQUVALCHeaderStack = UIStackView()
        let ANEAOQUVALCLabel = UILabel()
        ANEAOQUVALCLabel.text = "Maybe you like"
        ANEAOQUVALCLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        let ANEAOQUVALCMore = UIButton()
        ANEAOQUVALCMore.setBackgroundImage(UIImage.init(named: "ANEAOQUVALCIconlyMore"), for: .normal)
        
        
        ANEAOQUVALCHeaderStack.addArrangedSubview(ANEAOQUVALCLabel)
        ANEAOQUVALCHeaderStack.addArrangedSubview(ANEAOQUVALCMore)
        ANEAOQUVALCRecommendationContainer.addArrangedSubview(ANEAOQUVALCHeaderStack)

        for ANEAOQUVALCUserData in ANEAOQUVALCPotentialPeerData {
            let ANEAOQUVALCUserUnit = ANEAOQUVALCConstructPeerUnit(ANEAOQUVALCUserData)
            ANEAOQUVALCRecommendationContainer.addArrangedSubview(ANEAOQUVALCUserUnit)
        }
        
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCRecommendationContainer)
    }

    private func ANEAOQUVALCConstructPeerUnit(_ ANEAOQUVALCObject: [String: String]) -> UIView {
        let ANEAOQUVALCBox = UIStackView()
        ANEAOQUVALCBox.spacing = 16
        ANEAOQUVALCBox.alignment = .center

        // 头像与状态圆点
        let ANEAOQUVALCAvatarFrame = UIView()
        ANEAOQUVALCAvatarFrame.translatesAutoresizingMaskIntoConstraints = false
        let ANEAOQUVALCPic = UIImageView()
        ANEAOQUVALCPic.layer.cornerRadius = 40
        ANEAOQUVALCPic.clipsToBounds = true
        ANEAOQUVALCPic.backgroundColor = .systemGray6
        ANEAOQUVALCPic.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCAvatarFrame.addSubview(ANEAOQUVALCPic)
        
        let ANEAOQUVALCStatusDot = UIView()
        ANEAOQUVALCStatusDot.backgroundColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00)
        ANEAOQUVALCStatusDot.layer.cornerRadius = 8
        ANEAOQUVALCStatusDot.layer.borderWidth = 2
        ANEAOQUVALCStatusDot.layer.borderColor = UIColor.white.cgColor
        ANEAOQUVALCStatusDot.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCAvatarFrame.addSubview(ANEAOQUVALCStatusDot)

        let ANEAOQUVALCInfoStack = UIStackView()
        ANEAOQUVALCInfoStack.axis = .vertical
        ANEAOQUVALCInfoStack.spacing = 4
        let ANEAOQUVALCName = UILabel()
        ANEAOQUVALCName.text = ANEAOQUVALCObject["name"]
        ANEAOQUVALCName.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        let ANEAOQUVALCStat = UILabel()
        ANEAOQUVALCStat.text = "\(ANEAOQUVALCObject["fans"] ?? "0") Fans | \(ANEAOQUVALCObject["posts"] ?? "0") Posts"
        ANEAOQUVALCStat.font = UIFont.systemFont(ofSize: 14)
        ANEAOQUVALCStat.textColor = .lightGray
        ANEAOQUVALCInfoStack.addArrangedSubview(ANEAOQUVALCName)
        ANEAOQUVALCInfoStack.addArrangedSubview(ANEAOQUVALCStat)

        let ANEAOQUVALCVideoTrigger = UIButton()
        ANEAOQUVALCVideoTrigger.setImage(UIImage(named: "ANEAOQUVALCIconlyPlus"), for: .normal)
        ANEAOQUVALCVideoTrigger.tintColor = .black
        ANEAOQUVALCVideoTrigger.backgroundColor = .systemGray6
        ANEAOQUVALCVideoTrigger.layer.cornerRadius = 20
        ANEAOQUVALCVideoTrigger.widthAnchor.constraint(equalToConstant: 45).isActive = true
        ANEAOQUVALCVideoTrigger.heightAnchor.constraint(equalToConstant: 45).isActive = true

        let ANEAOQUVALCFollowTrigger = UIButton()
        ANEAOQUVALCFollowTrigger.setTitle("Follow", for: .normal)
        ANEAOQUVALCFollowTrigger.backgroundColor = UIColor(red: 1.00, green: 0.30, blue: 0.58, alpha: 1.00)
        ANEAOQUVALCFollowTrigger.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        ANEAOQUVALCFollowTrigger.layer.cornerRadius = 18
        ANEAOQUVALCFollowTrigger.widthAnchor.constraint(equalToConstant: 75).isActive = true
        ANEAOQUVALCFollowTrigger.heightAnchor.constraint(equalToConstant: 36).isActive = true

        ANEAOQUVALCBox.addArrangedSubview(ANEAOQUVALCAvatarFrame)
        ANEAOQUVALCBox.addArrangedSubview(ANEAOQUVALCInfoStack)
        ANEAOQUVALCBox.addArrangedSubview(ANEAOQUVALCVideoTrigger)
        ANEAOQUVALCBox.addArrangedSubview(ANEAOQUVALCFollowTrigger)

        NSLayoutConstraint.activate([
            ANEAOQUVALCPic.widthAnchor.constraint(equalToConstant: 80),
            ANEAOQUVALCPic.heightAnchor.constraint(equalToConstant: 80),
            ANEAOQUVALCPic.topAnchor.constraint(equalTo: ANEAOQUVALCAvatarFrame.topAnchor),
            ANEAOQUVALCPic.bottomAnchor.constraint(equalTo: ANEAOQUVALCAvatarFrame.bottomAnchor),
            ANEAOQUVALCPic.leadingAnchor.constraint(equalTo: ANEAOQUVALCAvatarFrame.leadingAnchor),
            ANEAOQUVALCPic.trailingAnchor.constraint(equalTo: ANEAOQUVALCAvatarFrame.trailingAnchor),
            
            ANEAOQUVALCStatusDot.widthAnchor.constraint(equalToConstant: 16),
            ANEAOQUVALCStatusDot.heightAnchor.constraint(equalToConstant: 16),
            ANEAOQUVALCStatusDot.trailingAnchor.constraint(equalTo: ANEAOQUVALCAvatarFrame.trailingAnchor, constant: -4),
            ANEAOQUVALCStatusDot.bottomAnchor.constraint(equalTo: ANEAOQUVALCAvatarFrame.bottomAnchor, constant: -4)
        ])
        return ANEAOQUVALCBox
    }
}
