//
//  ANEAOQUVALCMessageHubController.swift
//  AquaNeaoc
//
//  Created by  on 2026/1/16.
//

import UIKit

class ANEAOQUVALCMessageHubController: UIViewController {

    private let ANEAOQUVALCMainPool = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let ANEAOQUVALCVoidNotifier = UIImageView()
    private var ANEAOQUVALCChatPulseBuffer: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.98, green: 0.97, blue: 0.95, alpha: 1.00)
        ANEAOQUVALCAssembleMessageInterface()
        ANEAOQUVALCFetchRemoteConversations()
       
    }

    private func ANEAOQUVALCAssembleMessageInterface() {
        let ANEAOQUVALCHeaderBox = UIView()
        ANEAOQUVALCHeaderBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCHeaderBox)

        let ANEAOQUVALCTitleLabel = UIImageView(image: ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "Aquvameasgtle"))
        ANEAOQUVALCTitleLabel.contentMode = .scaleAspectFit
       
        ANEAOQUVALCTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHeaderBox.addSubview(ANEAOQUVALCTitleLabel)

        let ANEAOQUVALCLayout = UICollectionViewFlowLayout()
        ANEAOQUVALCLayout.scrollDirection = .vertical
        ANEAOQUVALCLayout.minimumInteritemSpacing = 15
        ANEAOQUVALCLayout.minimumLineSpacing = 20
        ANEAOQUVALCLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        ANEAOQUVALCMainPool.setCollectionViewLayout(ANEAOQUVALCLayout, animated: false)
        ANEAOQUVALCMainPool.backgroundColor = .clear
        ANEAOQUVALCMainPool.delegate = self
        ANEAOQUVALCMainPool.dataSource = self
        ANEAOQUVALCMainPool.register(ANEAOQUVALCChatEntryCell.self, forCellWithReuseIdentifier: "ANEAOQUVALCChatEntryCell")
        ANEAOQUVALCMainPool.register(ANEAOQUVALCDiscoveryBannerHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ANEAOQUVALCDiscoveryBannerHeader")
        ANEAOQUVALCMainPool.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCMainPool)

        ANEAOQUVALCVoidNotifier.contentMode = .scaleAspectFit
        ANEAOQUVALCVoidNotifier.isHidden = true
        ANEAOQUVALCVoidNotifier.image = ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "aneaoquvalc_empty_msg")
        ANEAOQUVALCVoidNotifier.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCVoidNotifier)

        NSLayoutConstraint.activate([
            ANEAOQUVALCHeaderBox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ANEAOQUVALCHeaderBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ANEAOQUVALCHeaderBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCHeaderBox.heightAnchor.constraint(equalToConstant: 60),

            ANEAOQUVALCTitleLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.leadingAnchor, constant: 20),
            ANEAOQUVALCTitleLabel.centerYAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.centerYAnchor),

            ANEAOQUVALCMainPool.topAnchor.constraint(equalTo: ANEAOQUVALCHeaderBox.bottomAnchor),
            ANEAOQUVALCMainPool.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ANEAOQUVALCMainPool.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCMainPool.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            ANEAOQUVALCVoidNotifier.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ANEAOQUVALCVoidNotifier.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90),
            ANEAOQUVALCVoidNotifier.widthAnchor.constraint(equalToConstant: 240)
        ])
    }

    private func ANEAOQUVALCFetchRemoteConversations() {
        ANEAOQUVALCHudComponent.shared.ANEAOQUVALCBeginLoading(with: ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCRetrieveSecretLyric(ANEAOQUVALCEncodedVibe: "ch/Tz00CZaMnWcQ0dmB5GyZcssQkh/NzYOebu4iWAWrXq0SfepdAc/bL"))
        ANEAOQUVALCFestivalRadioDispatcher.ANEAOQUVALCTransmitSonicWave(ANEAOQUVALCRoute: "/jrrsadiwbsqatz/xgtpirikdact", ANEAOQUVALCPayload: ["ANEAOQUVALCdisplayScreen":"59350823"], ANEAOQUVALCOnSuccess: { [weak self] ANEAOQUVALdata in
            ANEAOQUVALCHudComponent.shared.ANEAOQUVALCDismissLoading()
            guard let MITTBuilsddata = ANEAOQUVALdata as? [String:Any], let result = MITTBuilsddata[ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCRetrieveSecretLyric(ANEAOQUVALCEncodedVibe: "qkEN25paBtiVjFbNOo5j7YN6ZmzLCvZY8+O5rGK1encG8ZLc")] as? [[String:Any]] else { return }
            self?.ANEAOQUVALCChatPulseBuffer = result.map { dix in
                if let titleONeert = (dix["ANEAOQUVALCdjSet"] as? Array<[String:Any]>)?.first{
                    titleONeert
                }else{
                    [:]
                    
                }
                
            }
            ANEAOQUVALCHudComponent.shared.ANEAOQUVALCDismissLoading()
            self?.ANEAOQUVALCMainPool.reloadData()
            self?.ANEAOQUVALCVoidNotifier.isHidden = !(self?.ANEAOQUVALCChatPulseBuffer.isEmpty ?? true)
        }, ANEAOQUVALCOnFailure: nil)
        
        
    }
}

// MARK: - Collection View Bridge
extension ANEAOQUVALCMessageHubController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ANEAOQUVALCChatPulseBuffer.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ANEAOQUVALCChatEntryCell", for: indexPath) as! ANEAOQUVALCChatEntryCell
        cell.ANEAOQUVALCPopulateVibe(ANEAOQUVALCChatPulseBuffer[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ANEAOQUVALCWidth = (collectionView.bounds.width - 55) / 2
        return CGSize(width: ANEAOQUVALCWidth, height: 220)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ANEAOQUVALCDiscoveryBannerHeader", for: indexPath) as! ANEAOQUVALCDiscoveryBannerHeader
            header.ANEAOQUVALCBannerBtn.addTarget(self, action: #selector(ANEAOQUVALCSyncMatchControllerTonavi), for: .touchUpInside)
            return header
        }
        return UICollectionReusableView()
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
        let id = ANEAOQUVALCChatPulseBuffer[indexPath.row]["ANEAOQUVALCdreamPop"] as? Int ?? 0
        let vc = ANEAOQUVALCStagePortalBridge(ANEAOQUVALCUrlSource: ANEAOQUVALCStageNavigation.ANEAOQUVALCArtistBioNews.ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: "\(id)"))
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
   @objc func ANEAOQUVALCSyncMatchControllerTonavi()  {
       
     let vc =  ANEAOQUVALCSyncMatchController()
       vc.hidesBottomBarWhenPushed = true
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 215)
    }
}

// MARK: - Discovery Banner Header
class ANEAOQUVALCDiscoveryBannerHeader: UICollectionReusableView {
     let ANEAOQUVALCBannerBtn = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        ANEAOQUVALCBannerBtn.setBackgroundImage(ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "ANEAOQUVALCBannerBtn"), for: .normal)
        ANEAOQUVALCBannerBtn.imageView?.contentMode = .scaleToFill
        ANEAOQUVALCBannerBtn.translatesAutoresizingMaskIntoConstraints = false
        addSubview(ANEAOQUVALCBannerBtn)

        
        let recentchatimg = UIImageView(image: ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "Recent Chat"))
        recentchatimg.translatesAutoresizingMaskIntoConstraints = false
        addSubview(recentchatimg)
        NSLayoutConstraint.activate([
            ANEAOQUVALCBannerBtn.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            ANEAOQUVALCBannerBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            ANEAOQUVALCBannerBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            ANEAOQUVALCBannerBtn.heightAnchor.constraint(equalToConstant: 137),
            recentchatimg.topAnchor.constraint(equalTo: ANEAOQUVALCBannerBtn.bottomAnchor, constant: 31),
            recentchatimg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            recentchatimg.widthAnchor.constraint(equalToConstant: 147),
            recentchatimg.heightAnchor.constraint(equalToConstant: 31)
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}

// MARK: - Chat Grid Cell
class ANEAOQUVALCChatEntryCell: UICollectionViewCell {
    private let ANEAOQUVALCPortrait = UIImageView()
    private let ANEAOQUVALCAliasLabel = UILabel()
    private let ANEAOQUVALCTimeLabel = UILabel()
    private let ANEAOQUVALCSnippetLabel = UILabel()
    private let ANEAOQUVALCChatTrigger = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 24
        contentView.layer.masksToBounds = true
        ANEAOQUVALCSetupCellVisuals()
    }

    private func ANEAOQUVALCSetupCellVisuals() {
        ANEAOQUVALCPortrait.contentMode = .scaleAspectFill
        ANEAOQUVALCPortrait.clipsToBounds = true
        ANEAOQUVALCPortrait.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ANEAOQUVALCPortrait)

        ANEAOQUVALCAliasLabel.font = UIFont.systemFont(ofSize: 18, weight: .black)
        ANEAOQUVALCAliasLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ANEAOQUVALCAliasLabel)

        ANEAOQUVALCTimeLabel.font = UIFont.systemFont(ofSize: 12)
        ANEAOQUVALCTimeLabel.textColor = .lightGray
        ANEAOQUVALCTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ANEAOQUVALCTimeLabel)

        ANEAOQUVALCSnippetLabel.font = UIFont.systemFont(ofSize: 14)
        ANEAOQUVALCSnippetLabel.textColor = .gray
        ANEAOQUVALCSnippetLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ANEAOQUVALCSnippetLabel)

        ANEAOQUVALCChatTrigger.setImage(ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "redhichad"), for: .normal)
        ANEAOQUVALCChatTrigger.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ANEAOQUVALCChatTrigger)

        NSLayoutConstraint.activate([
            ANEAOQUVALCPortrait.topAnchor.constraint(equalTo: contentView.topAnchor),
            ANEAOQUVALCPortrait.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ANEAOQUVALCPortrait.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ANEAOQUVALCPortrait.heightAnchor.constraint(equalToConstant: 130),

            ANEAOQUVALCAliasLabel.topAnchor.constraint(equalTo: ANEAOQUVALCPortrait.bottomAnchor, constant: 10),
            ANEAOQUVALCAliasLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            ANEAOQUVALCTimeLabel.centerYAnchor.constraint(equalTo: ANEAOQUVALCAliasLabel.centerYAnchor),
            ANEAOQUVALCTimeLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCAliasLabel.trailingAnchor, constant: 6),

            ANEAOQUVALCSnippetLabel.topAnchor.constraint(equalTo: ANEAOQUVALCAliasLabel.bottomAnchor, constant: 4),
            ANEAOQUVALCSnippetLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCAliasLabel.leadingAnchor),

            ANEAOQUVALCChatTrigger.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            ANEAOQUVALCChatTrigger.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            ANEAOQUVALCChatTrigger.widthAnchor.constraint(equalToConstant: 110),
            ANEAOQUVALCChatTrigger.heightAnchor.constraint(equalToConstant: 36)
        ])
    }

    func ANEAOQUVALCPopulateVibe(_ data: [String: Any]) {
        ANEAOQUVALCAliasLabel.text = data["ANEAOQUVALCdreamPop"] as? String
        ANEAOQUVALCTimeLabel.text = ANEAOQUVALCTransformTimestamp(unixTimestamp: data["ANEAOQUVALCechoChamber"] as? Int ?? 0)
        ANEAOQUVALCSnippetLabel.text = data["ANEAOQUVALCdubstep"] as? String
        ANEAOQUVALCPortrait.ANEAOQUVALCSyncOrganicVibe(from: data["ANEAOQUVALCdrumKit"] as? String ?? "")
    }
    func ANEAOQUVALCTransformTimestamp(unixTimestamp: Int) -> String {
        // 1. 自动判断秒还是毫秒 (2026年的秒级时间戳约为 1.7e9，毫秒级为 1.7e12)
        let timestampInterval = unixTimestamp > 10000000000 ? TimeInterval(unixTimestamp) / 1000 : TimeInterval(unixTimestamp)
        
        // 2. 创建日期对象
        let date = Date(timeIntervalSince1970: timestampInterval)
        
        // 3. 配置格式化器
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy" // 结果类似于: Jan 18, 2026
        // 如果需要纯数字格式，可以使用 "MM/dd/yyyy" -> 01/18/2026
        
        return formatter.string(from: date)
    }
    required init?(coder: NSCoder) { fatalError() }
}
