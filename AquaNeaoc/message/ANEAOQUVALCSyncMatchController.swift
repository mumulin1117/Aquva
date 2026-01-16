//
//  ANEAOQUVALCSyncMatchController.swift
//  AquaNeaoc
//
//  Created by mumu on 2026/1/16.
//

import UIKit

class ANEAOQUVALCSyncMatchController: UIViewController {

    private let ANEAOQUVALCControlPlane = UIScrollView()
  
    private let ANEAOQUVALCHistoryPool: UICollectionView = {
        let ANEAOQUVALCLayout = UICollectionViewFlowLayout()
        ANEAOQUVALCLayout.scrollDirection = .horizontal
        ANEAOQUVALCLayout.itemSize = CGSize(width: 160, height: 150)
        ANEAOQUVALCLayout.minimumLineSpacing = 15
        return UICollectionView(frame: .zero, collectionViewLayout: ANEAOQUVALCLayout)
    }()
    
    private lazy var ANEAOQUVALCMainPulse: UIButton = {
        let ANEAOQUVALCMainPulse = UIButton(type: .custom)
        ANEAOQUVALCMainPulse.setImage(UIImage.init(named: "starrtuinBell"), for: .normal)
        ANEAOQUVALCMainPulse.imageView?.contentMode = .scaleAspectFit
        ANEAOQUVALCMainPulse.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainPulse.addTarget(self, action: #selector(ANEAOQUVALCstartToggle), for: .touchUpInside)
        
        return ANEAOQUVALCMainPulse
    }()
    
    
    @objc func ANEAOQUVALCstartToggle(){
        
        
    }
    
    
    @objc func ANEAOQUVALCFilteroggle(){
        
        
    }
    
    private var ANEAOQUVALCPastBeatBuffer: [[String: String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor(red: 0.98, green: 0.96, blue: 0.94, alpha: 1)
        ANEAOQUVALCSetupTacticalView()
        
        ANEAOQUVALCPullRemoteBeatLogs()
    }

    private func ANEAOQUVALCSetupTacticalView() {
        let ANEAOQUVALCNavBox = UIView()
        ANEAOQUVALCNavBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCNavBox)
        
        let ANEAOQUVALCBackTrigger = UIButton()
        ANEAOQUVALCBackTrigger.setImage(UIImage(named: "ANEAOQUVALCback"), for: .normal)
        
        
        let ANEAOQUVALCfilterTrigger = UIButton()
        ANEAOQUVALCfilterTrigger.setImage(UIImage(named: "ANEAOQUVALCfilter"), for: .normal)
        ANEAOQUVALCfilterTrigger.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCfilterTrigger.addTarget(self, action: #selector(ANEAOQUVALCFilteroggle), for: .touchUpInside)
        ANEAOQUVALCBackTrigger.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCNavBox.addSubview(ANEAOQUVALCBackTrigger)
        ANEAOQUVALCNavBox.addSubview(ANEAOQUVALCfilterTrigger)

        let ANEAOQUVALCTitle = UIImageView(image: UIImage.init(named: "Feel the Same Beat"))
        ANEAOQUVALCTitle.contentMode = .scaleAspectFit
        ANEAOQUVALCTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCTitle)

        ANEAOQUVALCHistoryPool.delegate = self
        ANEAOQUVALCHistoryPool.dataSource = self
        ANEAOQUVALCHistoryPool.backgroundColor = .clear
        ANEAOQUVALCHistoryPool.showsHorizontalScrollIndicator = false
        ANEAOQUVALCHistoryPool.register(ANEAOQUVALCBeatHistoryCell.self, forCellWithReuseIdentifier: "ANEAOQUVALCBeatHistoryCell")
        ANEAOQUVALCHistoryPool.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCHistoryPool)
        
       
        
        let ANEAOQUVALCLabel = UIImageView(image: UIImage.init(named: "histouyiw-white"))
        ANEAOQUVALCLabel.contentMode = .scaleAspectFit
        ANEAOQUVALCLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCLabel)
        view.addSubview(ANEAOQUVALCMainPulse)

        NSLayoutConstraint.activate([
            ANEAOQUVALCNavBox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ANEAOQUVALCNavBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ANEAOQUVALCNavBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCNavBox.heightAnchor.constraint(equalToConstant: 60),
            
            ANEAOQUVALCBackTrigger.leadingAnchor.constraint(equalTo: ANEAOQUVALCNavBox.leadingAnchor, constant: 20),
            ANEAOQUVALCBackTrigger.centerYAnchor.constraint(equalTo: ANEAOQUVALCNavBox.centerYAnchor),
            ANEAOQUVALCBackTrigger.widthAnchor.constraint(equalToConstant: 50),
            ANEAOQUVALCBackTrigger.heightAnchor.constraint(equalToConstant: 50),

            
            ANEAOQUVALCfilterTrigger.trailingAnchor.constraint(equalTo: ANEAOQUVALCNavBox.trailingAnchor, constant: -20),
            ANEAOQUVALCfilterTrigger.centerYAnchor.constraint(equalTo: ANEAOQUVALCNavBox.centerYAnchor),
            ANEAOQUVALCfilterTrigger.widthAnchor.constraint(equalToConstant: 50),
            ANEAOQUVALCfilterTrigger.heightAnchor.constraint(equalToConstant: 50),
            
            
            ANEAOQUVALCTitle.topAnchor.constraint(equalTo: ANEAOQUVALCNavBox.bottomAnchor, constant:0),
            ANEAOQUVALCTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ANEAOQUVALCTitle.widthAnchor.constraint(equalToConstant: 287),
            ANEAOQUVALCTitle.heightAnchor.constraint(equalToConstant: 52),
            
            ANEAOQUVALCHistoryPool.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            ANEAOQUVALCHistoryPool.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ANEAOQUVALCHistoryPool.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCHistoryPool.heightAnchor.constraint(equalToConstant: 150),
            
            ANEAOQUVALCLabel.bottomAnchor.constraint(equalTo: ANEAOQUVALCHistoryPool.topAnchor, constant: -10),
            ANEAOQUVALCLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ANEAOQUVALCMainPulse.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ANEAOQUVALCMainPulse.topAnchor.constraint(equalTo: ANEAOQUVALCTitle.bottomAnchor, constant: 10),
            ANEAOQUVALCMainPulse.bottomAnchor.constraint(equalTo: ANEAOQUVALCLabel.topAnchor, constant: -10)
       
        ])
    }

 
    private func ANEAOQUVALCPullRemoteBeatLogs() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.ANEAOQUVALCPastBeatBuffer = [
                ["name": "GlowBeat"], ["name": "NightRave"], ["name": "BassDrop"]
            ]
            self.ANEAOQUVALCHistoryPool.reloadData()
        }
    }
}

extension ANEAOQUVALCSyncMatchController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ANEAOQUVALCPastBeatBuffer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ANEAOQUVALCBeatHistoryCell", for: indexPath) as! ANEAOQUVALCBeatHistoryCell
        cell.ANEAOQUVALCConfigureBeat(name: ANEAOQUVALCPastBeatBuffer[indexPath.item]["name"] ?? "")
        return cell
    }
}

class ANEAOQUVALCBeatHistoryCell: UICollectionViewCell {
    private let ANEAOQUVALCCover = UIImageView()
    private let ANEAOQUVALCNameTag = UILabel()
    private let ANEAOQUVALCOnlineIndicator = UIView()
    private let ANEAOQUVALCCamIcon = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        ANEAOQUVALCSetupCellBody()
    }

    private func ANEAOQUVALCSetupCellBody() {
        contentView.layer.cornerRadius = 25
        contentView.clipsToBounds = true
        
        ANEAOQUVALCCover.contentMode = .scaleAspectFill
        //
//        ANEAOQUVALCCover.image = MITTBuilsdArtisanWorkshop.MITTBuilsdFetchVibeGraphic(MITTBuilsdAssetAlias: "aneaoquvalc_match_cover")
        ANEAOQUVALCCover.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ANEAOQUVALCCover)
        
        ANEAOQUVALCOnlineIndicator.backgroundColor = .black
        ANEAOQUVALCOnlineIndicator.layer.cornerRadius = 10
        ANEAOQUVALCOnlineIndicator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ANEAOQUVALCOnlineIndicator)
        
        let ANEAOQUVALCDot = UIView()
        ANEAOQUVALCDot.backgroundColor = .green
        ANEAOQUVALCDot.layer.cornerRadius = 4
        ANEAOQUVALCDot.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCOnlineIndicator.addSubview(ANEAOQUVALCDot)
        
        let ANEAOQUVALCStatus = UILabel()
        ANEAOQUVALCStatus.text = "online"
        ANEAOQUVALCStatus.textColor = .white
        ANEAOQUVALCStatus.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        ANEAOQUVALCStatus.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCOnlineIndicator.addSubview(ANEAOQUVALCStatus)

        ANEAOQUVALCNameTag.textColor = .white
        ANEAOQUVALCNameTag.font = UIFont.systemFont(ofSize: 20, weight: .black)
        ANEAOQUVALCNameTag.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ANEAOQUVALCNameTag)
        
        ANEAOQUVALCCamIcon.image = UIImage(named: "yesCarefever")
    
        ANEAOQUVALCCamIcon.contentMode = .center
       
        ANEAOQUVALCCamIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ANEAOQUVALCCamIcon)

        NSLayoutConstraint.activate([
            ANEAOQUVALCCover.topAnchor.constraint(equalTo: contentView.topAnchor),
            ANEAOQUVALCCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ANEAOQUVALCCover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ANEAOQUVALCCover.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            ANEAOQUVALCOnlineIndicator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            ANEAOQUVALCOnlineIndicator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            ANEAOQUVALCOnlineIndicator.widthAnchor.constraint(equalToConstant: 75),
            ANEAOQUVALCOnlineIndicator.heightAnchor.constraint(equalToConstant: 24),
            
            ANEAOQUVALCDot.leadingAnchor.constraint(equalTo: ANEAOQUVALCOnlineIndicator.leadingAnchor, constant: 8),
            ANEAOQUVALCDot.centerYAnchor.constraint(equalTo: ANEAOQUVALCOnlineIndicator.centerYAnchor),
            ANEAOQUVALCDot.widthAnchor.constraint(equalToConstant: 8),
            ANEAOQUVALCDot.heightAnchor.constraint(equalToConstant: 8),
            
            ANEAOQUVALCStatus.leadingAnchor.constraint(equalTo: ANEAOQUVALCDot.trailingAnchor, constant: 4),
            ANEAOQUVALCStatus.centerYAnchor.constraint(equalTo: ANEAOQUVALCOnlineIndicator.centerYAnchor),

            ANEAOQUVALCNameTag.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            ANEAOQUVALCNameTag.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            ANEAOQUVALCCamIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            ANEAOQUVALCCamIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            ANEAOQUVALCCamIcon.widthAnchor.constraint(equalToConstant: 40),
            ANEAOQUVALCCamIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func ANEAOQUVALCConfigureBeat(name: String) {
        ANEAOQUVALCNameTag.text = name
    }

    required init?(coder: NSCoder) { fatalError() }
}
