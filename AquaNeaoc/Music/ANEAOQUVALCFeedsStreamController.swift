//
//  ANEAOQUVALCFeedsStreamController.swift
//  AquaNeaoc
//
//  Created by mumu on 2026/1/16.
//
import UIKit

class ANEAOQUVALCFeedsStreamController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let ANEAOQUVALCFeedsTable = UITableView(frame: .zero, style: .plain)
    private let ANEAOQUVALCFilterStack = UIStackView()
    private var ANEAOQUVALCCurrentVibeData: [[String: Any]] = []
    private var ANEAOQUVALCActiveCategory: Int = 0

    // MARK: - Data Synchronization
    private func ANEAOQUVALCInitiateSonicFetch() {
        // 用户推荐请求
//        ANEAOQUVALCFestivalRadioDispatcher.ANEAOQUVALCTransmitSonicWave(ANEAOQUVALCRoute: "/ugaburemkz/xixnfhnmkrydo", ANEAOQUVALCPayload: ["ANEAOQUVALCacousticVibe":"59350823"], ANEAOQUVALCOnSuccess: { [weak self] ANEAOQUVALdata in
//            guard let MITTBuilsddata = ANEAOQUVALdata as? [String:Any], let result = MITTBuilsddata["data"] as? [[String:Any]] else { return }
//            self?.ANEAOQUVALCPotentialPeerData = result
//            DispatchQueue.main.async { self?.ANEAOQUVALCRefreshPeerInterface() }
//        }, ANEAOQUVALCOnFailure: nil)
//        
//        // 活动数据请求
//        ANEAOQUVALCFestivalRadioDispatcher.ANEAOQUVALCTransmitSonicWave(ANEAOQUVALCRoute: "/lctgaxlgkxxpqz/uzzgksft", ANEAOQUVALCPayload: ["ANEAOQUVALCliveChat":"59350823"], ANEAOQUVALCOnSuccess: { [weak self] ANEAOQUVALdata in
//            guard let MITTBuilsddata = ANEAOQUVALdata as? [String:Any], let result = MITTBuilsddata["data"] as? [[String:Any]] else { return }
//            self?.ANEAOQUVALCEventStageData = result
//            DispatchQueue.main.async { self?.ANEAOQUVALCRefreshEventInterface() }
//        }, ANEAOQUVALCOnFailure: nil)
//        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.98, green: 0.96, blue: 0.94, alpha: 1)
        ANEAOQUVALCSetupVisualStructure()
        ANEAOQUVALCPerformRemoteSonicSync()
    }

    private func ANEAOQUVALCSetupVisualStructure() {
        let ANEAOQUVALCHeaderBox = UIView()
        ANEAOQUVALCHeaderBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCHeaderBox)

        let ANEAOQUVALCMainTitle =  UIImageView(image: UIImage.init(named: "Aquvamusicfeed"))
        ANEAOQUVALCMainTitle.contentMode = .scaleAspectFit
        ANEAOQUVALCMainTitle.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderBox.addSubview(ANEAOQUVALCMainTitle)

        let ANEAOQUVALCAddVibeBtn = UIButton(type: .custom)
        ANEAOQUVALCAddVibeBtn.backgroundColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00)
        ANEAOQUVALCAddVibeBtn.layer.cornerRadius = 25
        ANEAOQUVALCAddVibeBtn.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .bold)), for: .normal)
        ANEAOQUVALCAddVibeBtn.tintColor = .black
        ANEAOQUVALCAddVibeBtn.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderBox.addSubview(ANEAOQUVALCAddVibeBtn)

        ANEAOQUVALCFilterStack.axis = .horizontal
        ANEAOQUVALCFilterStack.distribution = .fillEqually
        ANEAOQUVALCFilterStack.spacing = 12
        ANEAOQUVALCFilterStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCFilterStack)

        let ANEAOQUVALCTags = ["ANEAOQUVALCPopular", "ANEAOQUVALCNew", "ANEAOQUVALCFollowed"]
        for (index, title) in ANEAOQUVALCTags.enumerated() {
            let ANEAOQUVALCBtn = UIButton(type: .custom)
            ANEAOQUVALCBtn.setImage(UIImage.init(named: ANEAOQUVALCTags[index]), for: .normal)
            
            ANEAOQUVALCBtn.setImage(UIImage.init(named:  ANEAOQUVALCTags[index] + "sel"), for:.selected)
            
            ANEAOQUVALCBtn.tag = index
            ANEAOQUVALCBtn.addTarget(self, action: #selector(ANEAOQUVALCFilterTriggered(_:)), for: .touchUpInside)
            ANEAOQUVALCFilterStack.addArrangedSubview(ANEAOQUVALCBtn)
            if index == 0 {
                ANEAOQUVALCBtn.isSelected = true
            }
//            ANEAOQUVALCUpdateFilterStyle(ANEAOQUVALCBtn, isActive: index == 0)
        }
        ANEAOQUVALCFeedsTable.backgroundColor = .clear
        ANEAOQUVALCFeedsTable.rowHeight = 388
        ANEAOQUVALCFeedsTable.delegate = self
        ANEAOQUVALCFeedsTable.dataSource = self
        ANEAOQUVALCFeedsTable.separatorStyle = .none
        ANEAOQUVALCFeedsTable.register(ANEAOQUVALCFeedVibeCell.self, forCellReuseIdentifier: "ANEAOQUVALCFeedVibeCell")
        ANEAOQUVALCFeedsTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCFeedsTable)

        NSLayoutConstraint.activate([
            ANEAOQUVALCHeaderBox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ANEAOQUVALCHeaderBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ANEAOQUVALCHeaderBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCHeaderBox.heightAnchor.constraint(equalToConstant: 70),

            ANEAOQUVALCMainTitle.leadingAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.leadingAnchor, constant: 20),
            ANEAOQUVALCMainTitle.centerYAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.centerYAnchor),
            ANEAOQUVALCAddVibeBtn.trailingAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.trailingAnchor, constant: -20),
            ANEAOQUVALCAddVibeBtn.centerYAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.centerYAnchor),
            ANEAOQUVALCAddVibeBtn.widthAnchor.constraint(equalToConstant: 50),
            ANEAOQUVALCAddVibeBtn.heightAnchor.constraint(equalToConstant: 50),

            ANEAOQUVALCFilterStack.topAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.bottomAnchor, constant: 10),
            ANEAOQUVALCFilterStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ANEAOQUVALCFilterStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ANEAOQUVALCFilterStack.heightAnchor.constraint(equalToConstant: 45),

            ANEAOQUVALCFeedsTable.topAnchor.constraint(equalTo: ANEAOQUVALCFilterStack.bottomAnchor, constant: 15),
            ANEAOQUVALCFeedsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ANEAOQUVALCFeedsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCFeedsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

//    private func ANEAOQUVALCUpdateFilterStyle(_ btn: UIButton, isActive: Bool) {
//        btn.backgroundColor = isActive ? .black : .white
//        btn.setTitleColor(isActive ? UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00) : .black, for: .normal)
//        btn.layer.borderColor = UIColor.black.cgColor
//    }

    @objc private func ANEAOQUVALCFilterTriggered(_ sender: UIButton) {
        ANEAOQUVALCActiveCategory = sender.tag
        ANEAOQUVALCFilterStack.arrangedSubviews.forEach {
            if let b = $0 as? UIButton {
                b.isSelected = false
            }
        }
        sender.isSelected = true
        ANEAOQUVALCPerformRemoteSonicSync()
    }

    private func ANEAOQUVALCPerformRemoteSonicSync() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let ANEAOQUVALCMockPayload: [[String: Any]] = [
                ["user": "Stella", "time": "2min ago", "note": "From sunrise to bass drops, let's dance it out together!", "views": "2336"],
                ["user": "Naomi", "time": "10min ago", "note": "Vibing with the festival energy ✨", "views": "1204"]
            ]
            self.ANEAOQUVALCCurrentVibeData = (self.ANEAOQUVALCActiveCategory == 2) ? [ANEAOQUVALCMockPayload[0]] : ANEAOQUVALCMockPayload
            self.ANEAOQUVALCFeedsTable.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ANEAOQUVALCCurrentVibeData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ANEAOQUVALCFeedVibeCell", for: indexPath) as! ANEAOQUVALCFeedVibeCell
        cell.ANEAOQUVALCConfigureCell(with: ANEAOQUVALCCurrentVibeData[indexPath.row])
        return cell
    }
}

// MARK: - Custom Vibe Cell
class ANEAOQUVALCFeedVibeCell: UITableViewCell {
    
    private let ANEAOQUVALCAvatar = UIImageView()
    private let ANEAOQUVALCNameLabel = UILabel()
    private let ANEAOQUVALCTimeLabel = UILabel()
    private let ANEAOQUVALCImageStack = UIStackView()
    private let ANEAOQUVALCNoteBox = UIView()
    private let ANEAOQUVALCNoteLabel = UILabel()
    
    
    private let ANEAOQUVALCStatView = UIView()
    private let ANEAOQUVALCViewCountLabel = UILabel()
    private let ANEAOQUVALCLikeTrigger = UIButton()
    private let ANEAOQUVALCCommentTrigger = UIButton()
    private let ANEAOQUVALCChatActionBtn = UIButton()

    
    let ANEAOQUVALCReportBackdrop = UIButton.init()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        
        
        ANEAOQUVALCBuildCellHierarchy()
        
        self.backgroundColor = .clear
    }

    required init?(coder: NSCoder) { fatalError() }

    private func ANEAOQUVALCBuildCellHierarchy() {
        let viewBg = UIView.init()
        viewBg.backgroundColor = .white
        viewBg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(viewBg)
        ANEAOQUVALCReportBackdrop.setImage(UIImage.init(named: "bigonhreporet"), for: .normal)
     
        ANEAOQUVALCReportBackdrop.translatesAutoresizingMaskIntoConstraints = false
        viewBg.addSubview(ANEAOQUVALCReportBackdrop)
        
        ANEAOQUVALCAvatar.layer.cornerRadius = 25
        ANEAOQUVALCAvatar.clipsToBounds = true
        ANEAOQUVALCAvatar.layer.borderWidth = 2
        ANEAOQUVALCAvatar.backgroundColor = .systemGray6
        ANEAOQUVALCAvatar.layer.borderColor = UIColor(red: 0.95, green: 1, blue: 0.73, alpha: 1).cgColor
        ANEAOQUVALCAvatar.translatesAutoresizingMaskIntoConstraints = false
        viewBg.addSubview(ANEAOQUVALCAvatar)

        ANEAOQUVALCNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        ANEAOQUVALCNameLabel.translatesAutoresizingMaskIntoConstraints = false
        viewBg.addSubview(ANEAOQUVALCNameLabel)

        ANEAOQUVALCTimeLabel.font = UIFont.systemFont(ofSize: 13)
        ANEAOQUVALCTimeLabel.textColor = .gray
        ANEAOQUVALCTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        viewBg.addSubview(ANEAOQUVALCTimeLabel)

        ANEAOQUVALCImageStack.axis = .horizontal
        ANEAOQUVALCImageStack.spacing = 10
        ANEAOQUVALCImageStack.distribution = .fillEqually
        ANEAOQUVALCImageStack.translatesAutoresizingMaskIntoConstraints = false
        viewBg.addSubview(ANEAOQUVALCImageStack)

        ANEAOQUVALCNoteBox.backgroundColor = UIColor(red: 0.93, green: 1.00, blue: 0.82, alpha: 1.00)
        ANEAOQUVALCNoteBox.layer.cornerRadius = 15
        ANEAOQUVALCNoteBox.translatesAutoresizingMaskIntoConstraints = false
        viewBg.addSubview(ANEAOQUVALCNoteBox)

        ANEAOQUVALCNoteLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        ANEAOQUVALCNoteLabel.numberOfLines = 0
        ANEAOQUVALCNoteLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCNoteBox.addSubview(ANEAOQUVALCNoteLabel)

        NSLayoutConstraint.activate([
            
            viewBg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewBg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewBg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            viewBg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            ANEAOQUVALCReportBackdrop.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            ANEAOQUVALCReportBackdrop.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            ANEAOQUVALCReportBackdrop.widthAnchor.constraint(equalToConstant: 44),
            ANEAOQUVALCReportBackdrop.heightAnchor.constraint(equalToConstant: 44),

            
            
            ANEAOQUVALCAvatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            ANEAOQUVALCAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ANEAOQUVALCAvatar.widthAnchor.constraint(equalToConstant: 50),
            ANEAOQUVALCAvatar.heightAnchor.constraint(equalToConstant: 50),

            ANEAOQUVALCNameLabel.topAnchor.constraint(equalTo: ANEAOQUVALCAvatar.topAnchor, constant: 2),
            ANEAOQUVALCNameLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCAvatar.trailingAnchor, constant: 12),
            ANEAOQUVALCTimeLabel.topAnchor.constraint(equalTo: ANEAOQUVALCNameLabel.bottomAnchor, constant: 2),
            ANEAOQUVALCTimeLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCNameLabel.leadingAnchor),

            ANEAOQUVALCImageStack.topAnchor.constraint(equalTo: ANEAOQUVALCAvatar.bottomAnchor, constant: 15),
            ANEAOQUVALCImageStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ANEAOQUVALCImageStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            ANEAOQUVALCImageStack.heightAnchor.constraint(equalToConstant: 180),

            ANEAOQUVALCNoteBox.topAnchor.constraint(equalTo: ANEAOQUVALCImageStack.bottomAnchor, constant: 12),
            ANEAOQUVALCNoteBox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ANEAOQUVALCNoteBox.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            ANEAOQUVALCNoteLabel.topAnchor.constraint(equalTo: ANEAOQUVALCNoteBox.topAnchor, constant: 12),
            ANEAOQUVALCNoteLabel.bottomAnchor.constraint(equalTo: ANEAOQUVALCNoteBox.bottomAnchor, constant: -12),
            ANEAOQUVALCNoteLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCNoteBox.leadingAnchor, constant: 15),
            ANEAOQUVALCNoteLabel.trailingAnchor.constraint(equalTo: ANEAOQUVALCNoteBox.trailingAnchor, constant: -15),
            ANEAOQUVALCNoteBox.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20 - 40)
        ])
        
        ANEAOQUVALCStatView.translatesAutoresizingMaskIntoConstraints = false
                
        contentView.addSubview(ANEAOQUVALCStatView)

        // 浏览量图标与文字
        let ANEAOQUVALCEyeIcon = UIImageView(image: UIImage(systemName: "eye"))
        ANEAOQUVALCEyeIcon.tintColor = .systemGray3
        ANEAOQUVALCEyeIcon.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCStatView.addSubview(ANEAOQUVALCEyeIcon)

        ANEAOQUVALCViewCountLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        ANEAOQUVALCViewCountLabel.textColor = .systemGray3
        ANEAOQUVALCViewCountLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCStatView.addSubview(ANEAOQUVALCViewCountLabel)

        // 点赞按钮
        ANEAOQUVALCLikeTrigger.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        ANEAOQUVALCLikeTrigger.tintColor = UIColor(red: 1.00, green: 0.30, blue: 0.58, alpha: 1.00) // 粉色
        ANEAOQUVALCLikeTrigger.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCStatView.addSubview(ANEAOQUVALCLikeTrigger)

        // 评论按钮
        ANEAOQUVALCCommentTrigger.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        ANEAOQUVALCCommentTrigger.tintColor = .systemGray3
        ANEAOQUVALCCommentTrigger.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCStatView.addSubview(ANEAOQUVALCCommentTrigger)

        // Chat 按钮 (右侧黄色椭圆)
       
ANEAOQUVALCChatActionBtn.setBackgroundImage(UIImage.init(named: "ANEAOQUVALChich"), for: .normal)
        ANEAOQUVALCChatActionBtn.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCStatView.addSubview(ANEAOQUVALCChatActionBtn)

        // MARK: - 约束布局 (严格对应动态.png)
        NSLayoutConstraint.activate([
            ANEAOQUVALCStatView.topAnchor.constraint(equalTo: ANEAOQUVALCNoteBox.bottomAnchor, constant: 12),
            ANEAOQUVALCStatView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ANEAOQUVALCStatView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            ANEAOQUVALCStatView.heightAnchor.constraint(equalToConstant: 40),
            ANEAOQUVALCStatView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),

            ANEAOQUVALCEyeIcon.leadingAnchor.constraint(equalTo: ANEAOQUVALCStatView.leadingAnchor),
            ANEAOQUVALCEyeIcon.centerYAnchor.constraint(equalTo: ANEAOQUVALCStatView.centerYAnchor),
            ANEAOQUVALCEyeIcon.widthAnchor.constraint(equalToConstant: 18),
            ANEAOQUVALCEyeIcon.heightAnchor.constraint(equalToConstant: 18),

            ANEAOQUVALCViewCountLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCEyeIcon.trailingAnchor, constant: 5),
            ANEAOQUVALCViewCountLabel.centerYAnchor.constraint(equalTo: ANEAOQUVALCStatView.centerYAnchor),

            ANEAOQUVALCLikeTrigger.leadingAnchor.constraint(equalTo: ANEAOQUVALCViewCountLabel.trailingAnchor, constant: 25),
            ANEAOQUVALCLikeTrigger.centerYAnchor.constraint(equalTo: ANEAOQUVALCStatView.centerYAnchor),

            ANEAOQUVALCCommentTrigger.leadingAnchor.constraint(equalTo: ANEAOQUVALCLikeTrigger.trailingAnchor, constant: 20),
            ANEAOQUVALCCommentTrigger.centerYAnchor.constraint(equalTo: ANEAOQUVALCStatView.centerYAnchor),

            ANEAOQUVALCChatActionBtn.trailingAnchor.constraint(equalTo: ANEAOQUVALCStatView.trailingAnchor),
            ANEAOQUVALCChatActionBtn.centerYAnchor.constraint(equalTo: ANEAOQUVALCStatView.centerYAnchor),
            ANEAOQUVALCChatActionBtn.widthAnchor.constraint(equalToConstant: 100),
            ANEAOQUVALCChatActionBtn.heightAnchor.constraint(equalToConstant: 36)
        ])
        
    }

    func ANEAOQUVALCConfigureCell(with data: [String: Any]) {
        ANEAOQUVALCNameLabel.text = data["user"] as? String
        ANEAOQUVALCTimeLabel.text = data["time"] as? String
        ANEAOQUVALCNoteLabel.text = "♪♪ \"\(data["note"] as? String ?? "")\""
        
        // 调用资源还原引擎
//        ANEAOQUVALCAvatar.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "aneaoquvalc_avatar_mock")
        
        ANEAOQUVALCImageStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for _ in 0..<2 {
            let img = UIImageView()
            img.contentMode = .scaleAspectFill
            img.clipsToBounds = true
            img.layer.cornerRadius = 20
//            img.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "aneaoquvalc_feed_img")
            ANEAOQUVALCImageStack.addArrangedSubview(img)
        }
    }
}
