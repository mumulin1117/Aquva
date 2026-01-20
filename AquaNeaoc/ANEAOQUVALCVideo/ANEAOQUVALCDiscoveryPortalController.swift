import UIKit

class ANEAOQUVALCDiscoveryPortalController: UIViewController {

    // MARK: - UI Configuration Slots
    private let ANEAOQUVALCMainScrollPlane = UIScrollView()
    private let ANEAOQUVALCContentStack = UIStackView()
    
    // 预留物理位置槽位，确保顺序永不颠倒
    private let ANEAOQUVALCInsightSlot = UIView()
    private let ANEAOQUVALCMotionSlot = UIView()
    
    private var ANEAOQUVALCSonicInsightBuffer: [[String:Any]] = []
    private var ANEAOQUVALCVisualMotionBuffer: [[String:Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.98, green: 0.97, blue: 0.95, alpha: 1.00)
        
        ANEAOQUVALCAssembleBaseSkeleton() // 1. 先搭架子
        ANEAOQUVALCInitiateSonicSync()    // 2. 再跑异步数据
    }

    // MARK: - Skeleton Architecture
    private func ANEAOQUVALCAssembleBaseSkeleton() {
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

        // 核心：严格按序预埋槽位
        ANEAOQUVALCAssembleExploreHeader()     // 1. 顶部 Header
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCInsightSlot) // 2. Insights 占位
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCMotionSlot)  // 3. Video 占位
    }

    // MARK: - Data Synchronization
    private func ANEAOQUVALCInitiateSonicSync() {
        ANEAOQUVALCHudComponent.shared.ANEAOQUVALCBeginLoading(with: ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCRetrieveSecretLyric(ANEAOQUVALCEncodedVibe: "YW6ld6lzoh/qwWvd60SiW4iAmvb6zYiXA0LjMNe5VUQpSzWz4z+fmOoy"))
        ANEAOQUVALCFestivalRadioDispatcher.ANEAOQUVALCTransmitSonicWave(ANEAOQUVALCRoute: "/ugaburemkz/xixnfhnmkrydo", ANEAOQUVALCPayload: ["ANEAOQUVALCacousticVibe":"59350823"], ANEAOQUVALCOnSuccess: { [weak self] ANEAOQUVALdata in
            ANEAOQUVALCHudComponent.shared.ANEAOQUVALCDismissLoading()
            guard let MITTBuilsddata = ANEAOQUVALdata as? [String:Any], let result = MITTBuilsddata[ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCRetrieveSecretLyric(ANEAOQUVALCEncodedVibe: "br9f9qWSnQ4/TP51epCXfdkvGaKSPsKXvfdKRhvlgxCTps46")] as? [[String:Any]] else { return }
            self?.ANEAOQUVALCSonicInsightBuffer = result
            DispatchQueue.main.async { self?.ANEAOQUVALCRenderInsightSection() }
        }, ANEAOQUVALCOnFailure: nil)
        
        // 请求 B: Video 数据
        ANEAOQUVALCFestivalRadioDispatcher.ANEAOQUVALCTransmitSonicWave(ANEAOQUVALCRoute: "/yqsrvbkcnz/pidfjq", ANEAOQUVALCPayload: ["ANEAOQUVALCbootleg":"59350823","ANEAOQUVALCcampground":20,"ANEAOQUVALCbroadcast":1], ANEAOQUVALCOnSuccess: { [weak self] ANEAOQUVALdata in
            guard let MITTBuilsddata = ANEAOQUVALdata as? [String:Any], let result = MITTBuilsddata[ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCRetrieveSecretLyric(ANEAOQUVALCEncodedVibe: "QCnTbK28K40XbzKCbgLENarM4f9QXp5TwLK7zSkYnw8rGPqa")] as? [[String:Any]] else { return }
            self?.ANEAOQUVALCVisualMotionBuffer = result.filter({ $0["ANEAOQUVALCdanceFloor"] as? String != nil })
            DispatchQueue.main.async { self?.ANEAOQUVALCRenderMotionSection() }
        }, ANEAOQUVALCOnFailure: nil)
    }

    // MARK: - Module Renderers (Thread-Safe Sequence)
    private func ANEAOQUVALCRenderInsightSection() {
        ANEAOQUVALCInsightSlot.subviews.forEach { $0.removeFromSuperview() }
        let insightUI = ANEAOQUVALCAssembleInsightCarousel()
        ANEAOQUVALCInsightSlot.addSubview(insightUI)
        ANEAOQUVALCPinViewToSlot(insightUI, ANEAOQUVALCInsightSlot)
    }

    private func ANEAOQUVALCRenderMotionSection() {
        ANEAOQUVALCMotionSlot.subviews.forEach { $0.removeFromSuperview() }
        let motionUI = ANEAOQUVALCAssembleMotionCarousel()
        ANEAOQUVALCMotionSlot.addSubview(motionUI)
        ANEAOQUVALCPinViewToSlot(motionUI, ANEAOQUVALCMotionSlot)
    }

    private func ANEAOQUVALCPinViewToSlot(_ child: UIView, _ parent: UIView) {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: parent.topAnchor),
            child.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            child.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ])
    }

    // MARK: - UI Module: Header
    private func ANEAOQUVALCAssembleExploreHeader() {
        let ANEAOQUVALCHeaderRow = UIView()
        ANEAOQUVALCHeaderRow.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        let ANEAOQUVALCTitleLabel = UIImageView(image: ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "Aquvavidetitle"))
        ANEAOQUVALCTitleLabel.contentMode = .scaleAspectFit
        ANEAOQUVALCTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderRow.addSubview(ANEAOQUVALCTitleLabel)
        
        let ANEAOQUVALCAddAction = UIButton(type: .custom)
        ANEAOQUVALCAddAction.backgroundColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00)
        ANEAOQUVALCAddAction.layer.cornerRadius = 25
        ANEAOQUVALCAddAction.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .bold)), for: .normal)
        ANEAOQUVALCAddAction.tintColor = .black
        ANEAOQUVALCAddAction.addTarget(self, action: #selector(ANEAOQUVALCADDactiveyEnter), for: .touchUpInside)
        ANEAOQUVALCAddAction.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderRow.addSubview(ANEAOQUVALCAddAction)

        NSLayoutConstraint.activate([
            ANEAOQUVALCTitleLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCHeaderRow.leadingAnchor, constant: 20),
            ANEAOQUVALCTitleLabel.bottomAnchor.constraint(equalTo: ANEAOQUVALCHeaderRow.bottomAnchor, constant: -10),
            ANEAOQUVALCTitleLabel.widthAnchor.constraint(equalToConstant: 120),
            ANEAOQUVALCAddAction.trailingAnchor.constraint(equalTo: ANEAOQUVALCHeaderRow.trailingAnchor, constant: -20),
            ANEAOQUVALCAddAction.centerYAnchor.constraint(equalTo: ANEAOQUVALCTitleLabel.centerYAnchor),
            ANEAOQUVALCAddAction.widthAnchor.constraint(equalToConstant: 50),
            ANEAOQUVALCAddAction.heightAnchor.constraint(equalToConstant: 50)
        ])
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCHeaderRow)
    }

    // MARK: - UI Module: Insight Carousel
    private func ANEAOQUVALCAssembleInsightCarousel() -> UIView {
        let ANEAOQUVALCSectionWrapper = UIStackView()
        ANEAOQUVALCSectionWrapper.axis = .vertical
        ANEAOQUVALCSectionWrapper.spacing = 15
        
        let ANEAOQUVALCLabel = UILabel()
        ANEAOQUVALCLabel.text = "Music Insights"
        ANEAOQUVALCLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
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

        for (i, data) in ANEAOQUVALCSonicInsightBuffer.enumerated() {
            ANEAOQUVALCItemTrack.addArrangedSubview(ANEAOQUVALCBuildInsightPill(data, tag: i))
        }

        ANEAOQUVALCSectionWrapper.addArrangedSubview(ANEAOQUVALCBuildLabelContainer(ANEAOQUVALCLabel))
        ANEAOQUVALCSectionWrapper.addArrangedSubview(ANEAOQUVALCContainer)

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
        return ANEAOQUVALCSectionWrapper
    }

    private func ANEAOQUVALCBuildInsightPill(_ dict: [String: Any], tag: Int) -> UIView {
        let ANEAOQUVALCPill = UIView()
        ANEAOQUVALCPill.backgroundColor = .black
        ANEAOQUVALCPill.layer.cornerRadius = 45
        ANEAOQUVALCPill.widthAnchor.constraint(equalToConstant: 220).isActive = true
        ANEAOQUVALCPill.tag = tag
        ANEAOQUVALCPill.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ANEAOQUVALCIUserEnter)))

        let ANEAOQUVALCIcon = UIImageView()
        ANEAOQUVALCIcon.layer.cornerRadius = 35
        ANEAOQUVALCIcon.clipsToBounds = true
        ANEAOQUVALCIcon.layer.borderWidth = 2
        ANEAOQUVALCIcon.layer.borderColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00).cgColor
        ANEAOQUVALCIcon.ANEAOQUVALCSyncOrganicVibe(from: dict["ANEAOQUVALCafterParty"] as? String ?? "")
        ANEAOQUVALCIcon.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCPill.addSubview(ANEAOQUVALCIcon)
        
        let ANEAOQUVALCTag = UILabel()
        ANEAOQUVALCTag.text = dict["ANEAOQUVALCafterHours"] as? String
        ANEAOQUVALCTag.textColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00)
        ANEAOQUVALCTag.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        ANEAOQUVALCTag.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCPill.addSubview(ANEAOQUVALCTag)
        
        let ANEAOQUVALCLikes = UILabel()
        ANEAOQUVALCLikes.text = "★ \(dict["ANEAOQUVALCbodySurfing"] as? Int ?? 0)"
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

    // MARK: - UI Module: Video Motion Carousel
    private func ANEAOQUVALCAssembleMotionCarousel() -> UIView {
        let ANEAOQUVALCSectionWrapper = UIStackView()
        ANEAOQUVALCSectionWrapper.axis = .vertical
        ANEAOQUVALCSectionWrapper.spacing = 15
        
        let ANEAOQUVALCLabel = UILabel()
        ANEAOQUVALCLabel.text = ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCRetrieveSecretLyric(ANEAOQUVALCEncodedVibe: "AsKZ1jUn5ekXnunt5sN1kkxrvGoxOlD9lYQkx8sft7hbsyArJg")
        ANEAOQUVALCLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
        let ANEAOQUVALCHorizontalScroll = UIScrollView()
        ANEAOQUVALCHorizontalScroll.showsHorizontalScrollIndicator = false
        ANEAOQUVALCHorizontalScroll.delegate = self
        ANEAOQUVALCHorizontalScroll.decelerationRate = .fast
        ANEAOQUVALCHorizontalScroll.heightAnchor.constraint(equalToConstant: 450).isActive = true
        
        let ANEAOQUVALCCardTrack = UIStackView()
        ANEAOQUVALCCardTrack.axis = .horizontal
        ANEAOQUVALCCardTrack.spacing = -20
        let ANEAOQUVALCInset = (UIScreen.main.bounds.width - 280) / 2
        ANEAOQUVALCCardTrack.layoutMargins = UIEdgeInsets(top: 0, left: ANEAOQUVALCInset, bottom: 0, right: ANEAOQUVALCInset)
        ANEAOQUVALCCardTrack.isLayoutMarginsRelativeArrangement = true
        ANEAOQUVALCCardTrack.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHorizontalScroll.addSubview(ANEAOQUVALCCardTrack)

        for (i, data) in ANEAOQUVALCVisualMotionBuffer.enumerated() {
            ANEAOQUVALCCardTrack.addArrangedSubview(ANEAOQUVALCBuildMotionCard(data, tag: i))
        }

        ANEAOQUVALCSectionWrapper.addArrangedSubview(ANEAOQUVALCBuildLabelContainer(ANEAOQUVALCLabel))
        ANEAOQUVALCSectionWrapper.addArrangedSubview(ANEAOQUVALCHorizontalScroll)

        NSLayoutConstraint.activate([
            ANEAOQUVALCCardTrack.topAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.topAnchor),
            ANEAOQUVALCCardTrack.bottomAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.bottomAnchor),
            ANEAOQUVALCCardTrack.leadingAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.leadingAnchor),
            ANEAOQUVALCCardTrack.trailingAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.trailingAnchor),
            ANEAOQUVALCCardTrack.heightAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.heightAnchor)
        ])
        
        DispatchQueue.main.async { self.scrollViewDidScroll(ANEAOQUVALCHorizontalScroll) }
        return ANEAOQUVALCSectionWrapper
    }

    private func ANEAOQUVALCBuildMotionCard(_ dict: [String: Any], tag: Int) -> UIView {
        let ANEAOQUVALCCard = UIView()
        ANEAOQUVALCCard.widthAnchor.constraint(equalToConstant: 280).isActive = true
        ANEAOQUVALCCard.tag = tag
        ANEAOQUVALCCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ANEAOQUVALCIactiveyEnter)))
        ANEAOQUVALCCard.backgroundColor = .lightGray
        ANEAOQUVALCCard.layer.cornerRadius = 35
        ANEAOQUVALCCard.layer.masksToBounds = true
        let ANEAOQUVALCImage = UIImageView()
        ANEAOQUVALCImage.contentMode = .scaleAspectFill
        ANEAOQUVALCImage.clipsToBounds = true
        ANEAOQUVALCImage.layer.cornerRadius = 35
        ANEAOQUVALCImage.ANEAOQUVALCSyncOrganicVibe(from: dict["ANEAOQUVALCdanceFloor"] as? String ?? "")
        ANEAOQUVALCImage.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(ANEAOQUVALCImage)
        
        let userAvator = UIImageView()
        userAvator.layer.cornerRadius = 25
        userAvator.clipsToBounds = true
        userAvator.layer.borderWidth = 1
        userAvator.layer.borderColor = UIColor(red: 0.86, green: 1, blue: 0, alpha: 1).cgColor
        userAvator.ANEAOQUVALCSyncOrganicVibe(from: dict["ANEAOQUVALCcityFestival"] as? String ?? "")
        userAvator.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(userAvator)
        
        let ANEAOQUVALCPlayBtn = UIButton()
        ANEAOQUVALCPlayBtn.isUserInteractionEnabled = false
        ANEAOQUVALCPlayBtn.setBackgroundImage(ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "GroupcellPplay"), for: .normal)
        ANEAOQUVALCPlayBtn.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(ANEAOQUVALCPlayBtn)
        
        let ANEAOQUVALCDesc = UILabel()
        ANEAOQUVALCDesc.text = dict["ANEAOQUVALCchillWave"] as? String ?? ""
        ANEAOQUVALCDesc.textColor = .white
        ANEAOQUVALCDesc.font = UIFont.systemFont(ofSize: 22, weight: .black)
        ANEAOQUVALCDesc.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(ANEAOQUVALCDesc)

        let ANEAOQUVALCReport = UIButton()
        ANEAOQUVALCReport.setImage(ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "nokikonhreporet"), for: .normal)
//        ANEAOQUVALCReport.addTarget(self, action: #selector(ANEAOQUVALCExecuteContentAudit), for: .touchUpInside)
        ANEAOQUVALCReport.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(ANEAOQUVALCReport)

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
            ANEAOQUVALCReport.widthAnchor.constraint(equalToConstant: 32),
            ANEAOQUVALCReport.heightAnchor.constraint(equalToConstant: 32),
            ANEAOQUVALCReport.trailingAnchor.constraint(equalTo: ANEAOQUVALCCard.trailingAnchor,constant: -15),
            ANEAOQUVALCReport.topAnchor.constraint(equalTo:  ANEAOQUVALCCard.topAnchor,constant: 15)
        ])
        return ANEAOQUVALCCard
    }

    private func ANEAOQUVALCBuildLabelContainer(_ label: UILabel) -> UIView {
        let container = UIView()
        container.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: container.topAnchor),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        return container
    }

    

    @objc private func ANEAOQUVALCIUserEnter(taoerture: UITapGestureRecognizer) {
        let tag = taoerture.view?.tag ?? 0
        let id = ANEAOQUVALCSonicInsightBuffer[tag]["ANEAOQUVALCactiveListener"] as? Int ?? 0
        let vc = ANEAOQUVALCStagePortalBridge(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCAttendeeBackstage.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: "\(id)"))
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func ANEAOQUVALCIactiveyEnter(taoerture: UITapGestureRecognizer) {
        let tag = taoerture.view?.tag ?? 0
        let id = ANEAOQUVALCVisualMotionBuffer[tag]["ANEAOQUVALCcenterStage"] as? Int ?? 0
        let vc = ANEAOQUVALCStagePortalBridge(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCMomentDeepDive.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: "\(id)&type=2"))
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func ANEAOQUVALCADDactiveyEnter() {
        let vc = ANEAOQUVALCStagePortalBridge(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCStudioUploader.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: ""))
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Carousel Animation Logic
extension ANEAOQUVALCDiscoveryPortalController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let stack = scrollView.subviews.first as? UIStackView else { return }
        let centerX = scrollView.contentOffset.x + scrollView.bounds.width / 2.0
        
        for item in stack.arrangedSubviews {
            let itemCenter = item.convert(CGPoint(x: item.bounds.midX, y: item.bounds.midY), to: scrollView).x
            let distance = abs(centerX - itemCenter)
            let percentage = max(0, min(1, (200.0 - distance) / 200.0))
            
            let scale = 0.85 + (0.15 * percentage)
            item.transform = CGAffineTransform(scaleX: scale, y: scale)
            item.alpha = 0.6 + (0.4 * percentage)
        }
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemWidth: CGFloat = 280 - 20
        var index = round(targetContentOffset.pointee.x / itemWidth)
        if velocity.x > 0.5 { index += 1 } else if velocity.x < -0.5 { index -= 1 }
        targetContentOffset.pointee.x = max(0, min(CGFloat(ANEAOQUVALCVisualMotionBuffer.count - 1), index)) * itemWidth
    }
}


extension UIViewController{
    // MARK: - Handlers & Navigation
    @objc  func ANEAOQUVALCExecuteContentAudit() {
        let vc = ANEAOQUVALCStagePortalBridge(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCConductReport.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: ""))
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
