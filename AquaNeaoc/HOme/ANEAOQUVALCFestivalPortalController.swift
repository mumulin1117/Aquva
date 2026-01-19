import UIKit

class ANEAOQUVALCFestivalPortalController: UIViewController {
    
    // MARK: - UI Components
    private let ANEAOQUVALCMainScrollPlane = UIScrollView()
    private let ANEAOQUVALCContentStack = UIStackView()
    
    // 预设槽位容器：确保顺序的核心
    private let ANEAOQUVALCEventSlot = UIView()
    private let ANEAOQUVALCPeerSlot = UIView()
    
    private var ANEAOQUVALCEventStageData = Array<Dictionary<String,Any>>()
    private var ANEAOQUVALCPotentialPeerData = Array<Dictionary<String,Any>>()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.98, green: 0.96, blue: 0.94, alpha: 1)
        
        ANEAOQUVALCAssembleSkeletonLayout()
        ANEAOQUVALCInitiateSonicFetch()
    }

    // MARK: - Hierarchy Setup
    private func ANEAOQUVALCAssembleSkeletonLayout() {
        ANEAOQUVALCMainScrollPlane.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainScrollPlane.alwaysBounceVertical = true
        view.addSubview(ANEAOQUVALCMainScrollPlane)
        
        ANEAOQUVALCContentStack.axis = .vertical
        ANEAOQUVALCContentStack.spacing = 15
        ANEAOQUVALCContentStack.distribution = .fill
        ANEAOQUVALCContentStack.alignment = .fill
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

        // 严格按顺序注入
        ANEAOQUVALCInjectHeaderVisuals()        // 1. 头部
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCEventSlot) // 2. 活动区槽位
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCPeerSlot)  // 3. 用户区槽位
        
        // 初始背景背景处理
        let ANEAOQUVALCBackdropImg = UIImageView(frame: view.bounds)
        ANEAOQUVALCBackdropImg.contentMode = .scaleAspectFill
        ANEAOQUVALCBackdropImg.image = ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "aneaoquvalc_portal_bg")
        ANEAOQUVALCBackdropImg.alpha = 0.05
        view.insertSubview(ANEAOQUVALCBackdropImg, at: 0)
    }

    // MARK: - Data Synchronization
    private func ANEAOQUVALCInitiateSonicFetch() {
        ANEAOQUVALCHudComponent.shared.ANEAOQUVALCBeginLoading(with: "Loading...")
        ANEAOQUVALCFestivalRadioDispatcher.ANEAOQUVALCTransmitSonicWave(ANEAOQUVALCRoute: "/lctgaxlgkxxpqz/uzzgksft", ANEAOQUVALCPayload: ["ANEAOQUVALCliveChat":"59350823"], ANEAOQUVALCOnSuccess: { [weak self] ANEAOQUVALdata in
            guard let MITTBuilsddata = ANEAOQUVALdata as? [String:Any], let result = MITTBuilsddata["data"] as? [[String:Any]] else { return }
            self?.ANEAOQUVALCEventStageData = result
            ANEAOQUVALCHudComponent.shared.ANEAOQUVALCDismissLoading()
            DispatchQueue.main.async { self?.ANEAOQUVALCRefreshEventInterface() }
        }, ANEAOQUVALCOnFailure: nil)
        
        // 用户推荐请求
        ANEAOQUVALCFestivalRadioDispatcher.ANEAOQUVALCTransmitSonicWave(ANEAOQUVALCRoute: "/ugaburemkz/xixnfhnmkrydo", ANEAOQUVALCPayload: ["ANEAOQUVALCacousticVibe":"59350823"], ANEAOQUVALCOnSuccess: { [weak self] ANEAOQUVALdata in
            guard let MITTBuilsddata = ANEAOQUVALdata as? [String:Any], let result = MITTBuilsddata["data"] as? [[String:Any]] else { return }
            self?.ANEAOQUVALCPotentialPeerData = result
            DispatchQueue.main.async { self?.ANEAOQUVALCRefreshPeerInterface() }
        }, ANEAOQUVALCOnFailure: nil)
    }

    // MARK: - Interface Refinement
    private func ANEAOQUVALCRefreshEventInterface() {
        ANEAOQUVALCEventSlot.subviews.forEach { $0.removeFromSuperview() }
        ANEAOQUVALCInjectMusicEventSection()
    }

    private func ANEAOQUVALCRefreshPeerInterface() {
        ANEAOQUVALCPeerSlot.subviews.forEach { $0.removeFromSuperview() }
        ANEAOQUVALCInjectPeerRecommendationSection()
    }

    // MARK: - Original UI Modules
    private func ANEAOQUVALCInjectHeaderVisuals() {
        let ANEAOQUVALCHeaderContainer = UIView()
        ANEAOQUVALCHeaderContainer.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderContainer.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        let ANEAOQUVALCLogoLabel = UIImageView(image: UIImage(named: "AquvaHomtitle"))
        ANEAOQUVALCLogoLabel.contentMode = .scaleAspectFit
        ANEAOQUVALCLogoLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderContainer.addSubview(ANEAOQUVALCLogoLabel)
        
        let ANEAOQUVALCAddVibeTrigger = UIButton(type: .custom)
        ANEAOQUVALCAddVibeTrigger.backgroundColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00)
        ANEAOQUVALCAddVibeTrigger.layer.cornerRadius = 25
        ANEAOQUVALCAddVibeTrigger.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .bold)), for: .normal)
        ANEAOQUVALCAddVibeTrigger.tintColor = .black
        ANEAOQUVALCAddVibeTrigger.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCAddVibeTrigger.addTarget(self, action: #selector(ANEAOQUVALCADDactiveyEnter), for: .touchUpInside)
        ANEAOQUVALCHeaderContainer.addSubview(ANEAOQUVALCAddVibeTrigger)
        
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
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCHeaderContainer)
    }

    private func ANEAOQUVALCInjectMusicEventSection() {
        let ANEAOQUVALCSectionContainer = UIView()
        ANEAOQUVALCSectionContainer.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCEventSlot.addSubview(ANEAOQUVALCSectionContainer)
        
        let ANEAOQUVALCGradientLayer = CAGradientLayer()
        ANEAOQUVALCGradientLayer.colors = [UIColor(red: 1.00, green: 0.95, blue: 0.96, alpha: 1.0).cgColor, UIColor.white.cgColor]
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

        for (i, info) in ANEAOQUVALCEventStageData.enumerated() {
            ANEAOQUVALCCardTrack.addArrangedSubview(ANEAOQUVALCAssembleEventUnit(info, tag: i))
        }

        NSLayoutConstraint.activate([
            ANEAOQUVALCSectionContainer.topAnchor.constraint(equalTo: ANEAOQUVALCEventSlot.topAnchor),
            ANEAOQUVALCSectionContainer.leadingAnchor.constraint(equalTo: ANEAOQUVALCEventSlot.leadingAnchor),
            ANEAOQUVALCSectionContainer.trailingAnchor.constraint(equalTo: ANEAOQUVALCEventSlot.trailingAnchor),
            ANEAOQUVALCSectionContainer.bottomAnchor.constraint(equalTo: ANEAOQUVALCEventSlot.bottomAnchor),
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

    private func ANEAOQUVALCInjectPeerRecommendationSection() {
        let ANEAOQUVALCRecommendationContainer = UIStackView()
        ANEAOQUVALCRecommendationContainer.axis = .vertical
        ANEAOQUVALCRecommendationContainer.spacing = 18
        ANEAOQUVALCRecommendationContainer.isLayoutMarginsRelativeArrangement = true
        ANEAOQUVALCRecommendationContainer.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 30, right: 20)
        ANEAOQUVALCRecommendationContainer.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCPeerSlot.addSubview(ANEAOQUVALCRecommendationContainer)

        let ANEAOQUVALCHeaderStack = UIStackView()
        let ANEAOQUVALCLabel = UILabel()
        ANEAOQUVALCLabel.text = "Maybe you like"
        ANEAOQUVALCLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        let ANEAOQUVALCMore = UIButton()
        ANEAOQUVALCMore.setBackgroundImage(UIImage(named: "ANEAOQUVALCIconlyMore"), for: .normal)
        ANEAOQUVALCMore.addTarget(self, action: #selector(ANEAOQUVALCADMatchUserEnter), for: .touchUpInside)
        ANEAOQUVALCHeaderStack.addArrangedSubview(ANEAOQUVALCLabel)
        ANEAOQUVALCHeaderStack.addArrangedSubview(ANEAOQUVALCMore)
        ANEAOQUVALCRecommendationContainer.addArrangedSubview(ANEAOQUVALCHeaderStack)

        for (i, userData) in ANEAOQUVALCPotentialPeerData.enumerated() {
            ANEAOQUVALCRecommendationContainer.addArrangedSubview(ANEAOQUVALCConstructPeerUnit(userData, tag: i))
        }

        NSLayoutConstraint.activate([
            ANEAOQUVALCRecommendationContainer.topAnchor.constraint(equalTo: ANEAOQUVALCPeerSlot.topAnchor),
            ANEAOQUVALCRecommendationContainer.leadingAnchor.constraint(equalTo: ANEAOQUVALCPeerSlot.leadingAnchor),
            ANEAOQUVALCRecommendationContainer.trailingAnchor.constraint(equalTo: ANEAOQUVALCPeerSlot.trailingAnchor),
            ANEAOQUVALCRecommendationContainer.bottomAnchor.constraint(equalTo: ANEAOQUVALCPeerSlot.bottomAnchor)
        ])
    }

    private func ANEAOQUVALCConstructPeerUnit(_ ANEAOQUVALCObject: [String: Any],tag:Int) -> UIView {
            let ANEAOQUVALCBox = UIStackView()
            ANEAOQUVALCBox.spacing = 16
            ANEAOQUVALCBox.alignment = .center
            ANEAOQUVALCBox.tag = tag
            ANEAOQUVALCBox.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ANEAOQUVALCIUserEnter(taoerture:) )))
            // 头像与状态圆点
            let ANEAOQUVALCAvatarFrame = UIView()
            ANEAOQUVALCAvatarFrame.translatesAutoresizingMaskIntoConstraints = false
            let ANEAOQUVALCPic = UIImageView()
            ANEAOQUVALCPic.layer.cornerRadius = 40
            ANEAOQUVALCPic.clipsToBounds = true
            ANEAOQUVALCPic.backgroundColor = .systemGray6
            ANEAOQUVALCPic.ANEAOQUVALCSyncOrganicVibe(from: ANEAOQUVALCObject["ANEAOQUVALCafterParty"] as? String ?? "")
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
            ANEAOQUVALCName.text = ANEAOQUVALCObject["ANEAOQUVALCafterHours"] as? String
            ANEAOQUVALCName.font = UIFont.systemFont(ofSize: 19, weight: .bold)
            let ANEAOQUVALCStat = UILabel()
            ANEAOQUVALCStat.text = "\(ANEAOQUVALCObject["ANEAOQUVALCbodySurfing"] ?? "0") Fans | \(ANEAOQUVALCObject["posts"] ?? "0") Posts"
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
        
        
       


    private func ANEAOQUVALCAssembleEventUnit(_ ANEAOQUVALCData: [String: Any],tag:Int) -> UIView {
                let ANEAOQUVALCUnit = UIView()
                ANEAOQUVALCUnit.backgroundColor = UIColor(red: 0.99, green: 0.96, blue: 0.91, alpha: 1.00) // 浅米色背景
                ANEAOQUVALCUnit.layer.cornerRadius = 24
            ANEAOQUVALCUnit.layer.masksToBounds = true
            ANEAOQUVALCUnit.tag = tag
                ANEAOQUVALCUnit.translatesAutoresizingMaskIntoConstraints = false
                ANEAOQUVALCUnit.widthAnchor.constraint(equalToConstant: 200).isActive = true
                ANEAOQUVALCUnit.heightAnchor.constraint(equalToConstant: 280).isActive = true
            ANEAOQUVALCUnit.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ANEAOQUVALCIactiveyEnter(taoerture:) )))
                // 1. 主视觉海报
                let ANEAOQUVALCPoster = UIImageView()
                ANEAOQUVALCPoster.layer.cornerRadius = 20
                ANEAOQUVALCPoster.clipsToBounds = true
                ANEAOQUVALCPoster.contentMode = .scaleAspectFill
            ANEAOQUVALCPoster.ANEAOQUVALCSyncOrganicVibe(from: ANEAOQUVALCData["ANEAOQUVALClowPressure"] as? String ?? "") //= //ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "aneaoquvalc_stage_mock")
                ANEAOQUVALCPoster.translatesAutoresizingMaskIntoConstraints = false
                ANEAOQUVALCUnit.addSubview(ANEAOQUVALCPoster)

                // 2. 活动标题
                let ANEAOQUVALCMainTitle = UILabel()
            ANEAOQUVALCMainTitle.text = ANEAOQUVALCData["ANEAOQUVALCliveRecording"] as? String ?? "Unknown"
                ANEAOQUVALCMainTitle.font = UIFont.systemFont(ofSize: 18, weight: .black)
                ANEAOQUVALCMainTitle.translatesAutoresizingMaskIntoConstraints = false
                ANEAOQUVALCUnit.addSubview(ANEAOQUVALCMainTitle)
                
                // 3. 参与者层叠头像组与人数 (+39)
                let ANEAOQUVALCParticipantStack = UIStackView()
                ANEAOQUVALCParticipantStack.axis = .horizontal
                ANEAOQUVALCParticipantStack.spacing = -8 // 负间距实现重叠效果
                ANEAOQUVALCParticipantStack.translatesAutoresizingMaskIntoConstraints = false
                ANEAOQUVALCUnit.addSubview(ANEAOQUVALCParticipantStack)
                
                for _ in 0..<1 {
                    let ANEAOQUVALCMiniAvatar = UIImageView()
                    ANEAOQUVALCMiniAvatar.backgroundColor = .systemGray5
                    ANEAOQUVALCMiniAvatar.layer.cornerRadius = 10
                    ANEAOQUVALCMiniAvatar.layer.borderWidth = 1.5
                    ANEAOQUVALCMiniAvatar.layer.borderColor = ANEAOQUVALCUnit.backgroundColor?.cgColor
                    ANEAOQUVALCMiniAvatar.clipsToBounds = true
                    ANEAOQUVALCMiniAvatar.widthAnchor.constraint(equalToConstant: 20).isActive = true
                    ANEAOQUVALCMiniAvatar.heightAnchor.constraint(equalToConstant: 20).isActive = true
                    ANEAOQUVALCMiniAvatar.ANEAOQUVALCSyncOrganicVibe(from: ANEAOQUVALCData["ANEAOQUVALCmatchVibe"] as? String ?? "")
                    ANEAOQUVALCParticipantStack.addArrangedSubview(ANEAOQUVALCMiniAvatar)
                }
                
                let ANEAOQUVALCCountLabel = UILabel()
                ANEAOQUVALCCountLabel.text = "+ 1"
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
            ANEAOQUVALCHostAvatar.ANEAOQUVALCSyncOrganicVibe(from: ANEAOQUVALCData["ANEAOQUVALCmatchVibe"] as? String ?? "")
                let ANEAOQUVALCHostName = UILabel()
            ANEAOQUVALCHostName.text = ANEAOQUVALCData["ANEAOQUVALCmastering"] as? String
                ANEAOQUVALCHostName.font = UIFont.systemFont(ofSize: 12, weight: .medium)
                ANEAOQUVALCHostName.textColor = .gray
                ANEAOQUVALCHostName.translatesAutoresizingMaskIntoConstraints = false
                ANEAOQUVALCUnit.addSubview(ANEAOQUVALCHostName)
                
        let ANEAOQUVALCAlertIcon = UIButton.init()
        ANEAOQUVALCAlertIcon.setImage(UIImage.init(named: "nokikonhreporet"), for: .normal)
        ANEAOQUVALCAlertIcon.addTarget(self, action: #selector(ANEAOQUVALCExecuteContentAudit), for: .touchUpInside)
              
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
        
    //用户点击
    @objc private func ANEAOQUVALCIUserEnter(taoerture:UITapGestureRecognizer) {
        let fenderData = ANEAOQUVALCPotentialPeerData[ taoerture.view?.tag ?? 0]["ANEAOQUVALCactiveListener"]  as? Int ?? 0
        
        let pageContetnt = ANEAOQUVALCStagePortalBridge.init(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCAttendeeBackstage.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: "\(fenderData)"))
        pageContetnt.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(pageContetnt, animated: true)
    }
    
    
    //活动点击
     @objc private func ANEAOQUVALCIactiveyEnter(taoerture:UITapGestureRecognizer) {
         let fenderData = ANEAOQUVALCEventStageData[ taoerture.view?.tag ?? 0]["ANEAOQUVALClivePerformance"]  as? Int ?? 0
         
         let pageContetnt = ANEAOQUVALCStagePortalBridge.init(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCSetlistPortal.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: "\(fenderData)"))
         pageContetnt.hidesBottomBarWhenPushed = true
         self.navigationController?.pushViewController(pageContetnt, animated: true)
     }
    
    
    
    //add active
    @objc private func ANEAOQUVALCADDactiveyEnter(){
         
         let pageContetnt = ANEAOQUVALCStagePortalBridge.init(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCLaunchPad.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: ""))
         pageContetnt.hidesBottomBarWhenPushed = true
         self.navigationController?.pushViewController(pageContetnt, animated: true)
    }
    
    //1v4
    @objc private func ANEAOQUVALCADMatchUserEnter(){
         
         let pageContetnt = ANEAOQUVALCStagePortalBridge.init(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCSoundPartnerMatch.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: ""))
         pageContetnt.hidesBottomBarWhenPushed = true
         self.navigationController?.pushViewController(pageContetnt, animated: true)
     }

}
