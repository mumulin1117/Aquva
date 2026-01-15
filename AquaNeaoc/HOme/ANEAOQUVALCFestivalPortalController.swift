//
//  ANEAOQUVALCFestivalPortalController.swift
//  AquaNeaoc
//
//  Created by mumu on 2026/1/15.
//

import UIKit

class ANEAOQUVALCFestivalPortalController: UIViewController {

    private let ANEAOQUVALCMainScrollPlane = UIScrollView()
    private let ANEAOQUVALCContentStack = UIStackView()
    
    private let ANEAOQUVALCTopActionRow = UIView()
    private let ANEAOQUVALCLogoVisual = UILabel()
    private let ANEAOQUVALCAddVibeTrigger = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.98, green: 0.96, blue: 0.94, alpha: 1)
        ANEAOQUVALCSetupPortalLayout()
        ANEAOQUVALCInjectHeaderLogic()
        ANEAOQUVALCInjectEventCarousel()
        ANEAOQUVALCInjectUserRecommendations()
    }

    private func ANEAOQUVALCSetupPortalLayout() {
        ANEAOQUVALCMainScrollPlane.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainScrollPlane.showsVerticalScrollIndicator = false
        view.addSubview(ANEAOQUVALCMainScrollPlane)

        ANEAOQUVALCContentStack.axis = .vertical
        ANEAOQUVALCContentStack.spacing = 30
        ANEAOQUVALCContentStack.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainScrollPlane.addSubview(ANEAOQUVALCContentStack)

        NSLayoutConstraint.activate([
            ANEAOQUVALCMainScrollPlane.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ANEAOQUVALCMainScrollPlane.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ANEAOQUVALCMainScrollPlane.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCMainScrollPlane.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            ANEAOQUVALCContentStack.topAnchor.constraint(equalTo: ANEAOQUVALCMainScrollPlane.topAnchor),
            ANEAOQUVALCContentStack.leadingAnchor.constraint(equalTo: ANEAOQUVALCMainScrollPlane.leadingAnchor),
            ANEAOQUVALCContentStack.trailingAnchor.constraint(equalTo: ANEAOQUVALCMainScrollPlane.trailingAnchor),
            ANEAOQUVALCContentStack.bottomAnchor.constraint(equalTo: ANEAOQUVALCMainScrollPlane.bottomAnchor),
            ANEAOQUVALCContentStack.widthAnchor.constraint(equalTo: ANEAOQUVALCMainScrollPlane.widthAnchor)
        ])
    }

    private func ANEAOQUVALCInjectHeaderLogic() {
        ANEAOQUVALCTopActionRow.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCTopActionRow)

        ANEAOQUVALCLogoVisual.text = "Aquva"
        ANEAOQUVALCLogoVisual.font = UIFont.systemFont(ofSize: 36, weight: .black)
        ANEAOQUVALCLogoVisual.textColor = .black
        ANEAOQUVALCLogoVisual.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCTopActionRow.addSubview(ANEAOQUVALCLogoVisual)

        ANEAOQUVALCAddVibeTrigger.backgroundColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00)
        ANEAOQUVALCAddVibeTrigger.layer.cornerRadius = 25
        ANEAOQUVALCAddVibeTrigger.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .bold)), for: .normal)
        ANEAOQUVALCAddVibeTrigger.tintColor = .black
        ANEAOQUVALCAddVibeTrigger.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCTopActionRow.addSubview(ANEAOQUVALCAddVibeTrigger)

        NSLayoutConstraint.activate([
            ANEAOQUVALCLogoVisual.leadingAnchor.constraint(equalTo: ANEAOQUVALCTopActionRow.leadingAnchor, constant: 20),
            ANEAOQUVALCLogoVisual.centerYAnchor.constraint(equalTo: ANEAOQUVALCTopActionRow.centerYAnchor),
            
            ANEAOQUVALCAddVibeTrigger.trailingAnchor.constraint(equalTo: ANEAOQUVALCTopActionRow.trailingAnchor, constant: -20),
            ANEAOQUVALCAddVibeTrigger.centerYAnchor.constraint(equalTo: ANEAOQUVALCTopActionRow.centerYAnchor),
            ANEAOQUVALCAddVibeTrigger.widthAnchor.constraint(equalToConstant: 50),
            ANEAOQUVALCAddVibeTrigger.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func ANEAOQUVALCInjectEventCarousel() {
        let ANEAOQUVALCSectionLabel = UILabel()
        ANEAOQUVALCSectionLabel.text = "Music events"
        ANEAOQUVALCSectionLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
        let ANEAOQUVALCHorizontalScroll = UIScrollView()
        ANEAOQUVALCHorizontalScroll.showsHorizontalScrollIndicator = false
        ANEAOQUVALCHorizontalScroll.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        let ANEAOQUVALCCardStack = UIStackView()
        ANEAOQUVALCCardStack.axis = .horizontal
        ANEAOQUVALCCardStack.spacing = 15
        ANEAOQUVALCCardStack.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        ANEAOQUVALCCardStack.isLayoutMarginsRelativeArrangement = true
        ANEAOQUVALCCardStack.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCHorizontalScroll.addSubview(ANEAOQUVALCCardStack)

        let ANEAOQUVALCEventMockData = [("SoundRush", "Nina"), ("Electric Night", "Chaser")]
        for ANEAOQUVALCItem in ANEAOQUVALCEventMockData {
            let ANEAOQUVALCCard = ANEAOQUVALCCreateEventCard(ANEAOQUVALCItem.0, ANEAOQUVALCItem.1)
            ANEAOQUVALCCardStack.addArrangedSubview(ANEAOQUVALCCard)
        }

        let ANEAOQUVALCWrapper = UIStackView(arrangedSubviews: [ANEAOQUVALCSectionLabel, ANEAOQUVALCHorizontalScroll])
        ANEAOQUVALCWrapper.axis = .vertical
        ANEAOQUVALCWrapper.spacing = 15
        ANEAOQUVALCWrapper.isLayoutMarginsRelativeArrangement = true
        ANEAOQUVALCWrapper.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCWrapper)
        
        NSLayoutConstraint.activate([
            ANEAOQUVALCCardStack.topAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.topAnchor),
            ANEAOQUVALCCardStack.leadingAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.leadingAnchor),
            ANEAOQUVALCCardStack.trailingAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.trailingAnchor),
            ANEAOQUVALCCardStack.bottomAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.bottomAnchor),
            ANEAOQUVALCCardStack.heightAnchor.constraint(equalTo: ANEAOQUVALCHorizontalScroll.heightAnchor)
        ])
    }

    private func ANEAOQUVALCInjectUserRecommendations() {
        let ANEAOQUVALCHeaderRow = UIStackView()
        ANEAOQUVALCHeaderRow.distribution = .equalSpacing
        
        let ANEAOQUVALCLeftLabel = UILabel()
        ANEAOQUVALCLeftLabel.text = "Maybe you like"
        ANEAOQUVALCLeftLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
        let ANEAOQUVALCMoreTrigger = UIButton()
        ANEAOQUVALCMoreTrigger.setTitle("More", for: .normal)
        ANEAOQUVALCMoreTrigger.backgroundColor = UIColor(red: 0.82, green: 1.00, blue: 0.20, alpha: 1.00)
        ANEAOQUVALCMoreTrigger.setTitleColor(.black, for: .normal)
        ANEAOQUVALCMoreTrigger.layer.cornerRadius = 20
        ANEAOQUVALCMoreTrigger.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        ANEAOQUVALCMoreTrigger.contentEdgeInsets = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 20)

        ANEAOQUVALCHeaderRow.addArrangedSubview(ANEAOQUVALCLeftLabel)
        ANEAOQUVALCHeaderRow.addArrangedSubview(ANEAOQUVALCMoreTrigger)
        
        let ANEAOQUVALCUserWrapper = UIStackView()
        ANEAOQUVALCUserWrapper.axis = .vertical
        ANEAOQUVALCUserWrapper.spacing = 15
        ANEAOQUVALCUserWrapper.isLayoutMarginsRelativeArrangement = true
        ANEAOQUVALCUserWrapper.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        ANEAOQUVALCUserWrapper.addArrangedSubview(ANEAOQUVALCHeaderRow)

        let ANEAOQUVALCUsers = [("Olivia", "13.9k Fans"), ("Hailey", "13.9k Fans")]
        for ANEAOQUVALCUser in ANEAOQUVALCUsers {
            ANEAOQUVALCUserWrapper.addArrangedSubview(ANEAOQUVALCCreateUserRow(ANEAOQUVALCUser.0, ANEAOQUVALCUser.1))
        }

        ANEAOQUVALCContentStack.addArrangedSubview(ANEAOQUVALCUserWrapper)
    }

    private func ANEAOQUVALCCreateEventCard(_ ANEAOQUVALCTitle: String, _ ANEAOQUVALCHost: String) -> UIView {
        let ANEAOQUVALCCard = UIView()
        ANEAOQUVALCCard.backgroundColor = UIColor(red: 0.98, green: 0.93, blue: 0.95, alpha: 1.00)
        ANEAOQUVALCCard.layer.cornerRadius = 25
        ANEAOQUVALCCard.widthAnchor.constraint(equalToConstant: 220).isActive = true
        
        let ANEAOQUVALCCover = UIImageView()
        ANEAOQUVALCCover.backgroundColor = .systemGray5
        ANEAOQUVALCCover.layer.cornerRadius = 20
        ANEAOQUVALCCover.clipsToBounds = true
        ANEAOQUVALCCover.contentMode = .scaleAspectFill
        ANEAOQUVALCCover.image = ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCExtractLiveMomentGraphic(ANEAOQUVALCGraphicAlias: "aneaoquvalc_event_temp")
        ANEAOQUVALCCover.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(ANEAOQUVALCCover)
        
        let ANEAOQUVALCLabel = UILabel()
        ANEAOQUVALCLabel.text = ANEAOQUVALCTitle
        ANEAOQUVALCLabel.font = UIFont.systemFont(ofSize: 20, weight: .black)
        ANEAOQUVALCLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCard.addSubview(ANEAOQUVALCLabel)

        NSLayoutConstraint.activate([
            ANEAOQUVALCCover.topAnchor.constraint(equalTo: ANEAOQUVALCCard.topAnchor, constant: 10),
            ANEAOQUVALCCover.leadingAnchor.constraint(equalTo: ANEAOQUVALCCard.leadingAnchor, constant: 10),
            ANEAOQUVALCCover.trailingAnchor.constraint(equalTo: ANEAOQUVALCCard.trailingAnchor, constant: -10),
            ANEAOQUVALCCover.heightAnchor.constraint(equalToConstant: 160),
            
            ANEAOQUVALCLabel.topAnchor.constraint(equalTo: ANEAOQUVALCCover.bottomAnchor, constant: 12),
            ANEAOQUVALCLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCCard.leadingAnchor, constant: 15)
        ])
        
        return ANEAOQUVALCCard
    }

    private func ANEAOQUVALCCreateUserRow(_ ANEAOQUVALCName: String, _ ANEAOQUVALCFans: String) -> UIView {
        let ANEAOQUVALCRow = UIStackView()
        ANEAOQUVALCRow.spacing = 15
        ANEAOQUVALCRow.alignment = .center
        
        let ANEAOQUVALCAvatar = UIImageView()
        ANEAOQUVALCAvatar.backgroundColor = .systemGray6
        ANEAOQUVALCAvatar.layer.cornerRadius = 45
        ANEAOQUVALCAvatar.clipsToBounds = true
        ANEAOQUVALCAvatar.widthAnchor.constraint(equalToConstant: 90).isActive = true
        ANEAOQUVALCAvatar.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        let ANEAOQUVALCInfo = UIStackView()
        ANEAOQUVALCInfo.axis = .vertical
        let ANEAOQUVALCNm = UILabel()
        ANEAOQUVALCNm.text = ANEAOQUVALCName
        ANEAOQUVALCNm.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        let ANEAOQUVALCSub = UILabel()
        ANEAOQUVALCSub.text = ANEAOQUVALCFans
        ANEAOQUVALCSub.textColor = .gray
        ANEAOQUVALCInfo.addArrangedSubview(ANEAOQUVALCNm)
        ANEAOQUVALCInfo.addArrangedSubview(ANEAOQUVALCSub)
        
        let ANEAOQUVALCFollow = UIButton()
        ANEAOQUVALCFollow.setTitle("Follow", for: .normal)
        ANEAOQUVALCFollow.backgroundColor = UIColor(red: 1.00, green: 0.30, blue: 0.58, alpha: 1.00)
        ANEAOQUVALCFollow.layer.cornerRadius = 18
        ANEAOQUVALCFollow.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        ANEAOQUVALCRow.addArrangedSubview(ANEAOQUVALCAvatar)
        ANEAOQUVALCRow.addArrangedSubview(ANEAOQUVALCInfo)
        ANEAOQUVALCRow.addArrangedSubview(ANEAOQUVALCFollow)
        
        return ANEAOQUVALCRow
    }
}
extension ANEAOQUVALCFestivalPortalController {
    
    @objc private func ANEAOQUVALCPerformDataRefresh() {
        // Mocking festival schedule synchronization
        let ANEAOQUVALCRandomDelay = Double.random(in: 0.5...1.5)
        DispatchQueue.main.asyncAfter(deadline: .now() + ANEAOQUVALCRandomDelay) {
            print("ANEAOQUVALC: Sonic waves synchronized successfully.")
        }
    }

    private func ANEAOQUVALCHandleUserVibeCheck(ANEAOQUVALCTargetID: String) {
        // Mocking a local social interaction response
        let ANEAOQUVALCIsEligible = Bool.random()
        if ANEAOQUVALCIsEligible {
            // Proceed to mock live set connection
        }
    }
}
