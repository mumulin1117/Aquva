//
//  ANEAOQUVALCEulaPopupController.swift
//  AquaNeaoc
//
//  Created by  on 2026/1/15.
//

import UIKit

class ANEAOQUVALCEulaPopupController: UIViewController {

    private let ANEAOQUVALCBlurEffectBackdrop = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
//    private let ANEAOQUVALCStageVisualHeader = UIImageView()
    private let ANEAOQUVALCCoreSheetContainer = UIView()
    private let ANEAOQUVALCManifestTitleLabel = UILabel()
    private let ANEAOQUVALCScrollableLyricArea = UITextView()
    
    private let ANEAOQUVALCActionStackWrapper = UIStackView()
    private let ANEAOQUVALCAbortTrigger = UIButton()
    private let ANEAOQUVALCConfirmTrigger = UIButton()

    private let ANEAOQUVALCVibePink = UIColor(red: 1.00, green: 0.30, blue: 0.58, alpha: 1.00)
    private let ANEAOQUVALCNeutralGray = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)

    override func viewDidLoad() {
        super.viewDidLoad()
        ANEAOQUVALCConstructFestivalPopup()
    }

    private func ANEAOQUVALCConstructFestivalPopup() {
        view.backgroundColor = .clear
        
        ANEAOQUVALCBlurEffectBackdrop.frame = view.bounds
        ANEAOQUVALCBlurEffectBackdrop.alpha = 0
        view.addSubview(ANEAOQUVALCBlurEffectBackdrop)

//        ANEAOQUVALCStageVisualHeader.contentMode = .scaleAspectFill
//        ANEAOQUVALCStageVisualHeader.clipsToBounds = true
//        ANEAOQUVALCStageVisualHeader.image = UIImage(named: "ANEAOQUVALC_Festival_Crowd")
//        ANEAOQUVALCStageVisualHeader.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(ANEAOQUVALCStageVisualHeader)

        ANEAOQUVALCCoreSheetContainer.backgroundColor = .white
        ANEAOQUVALCCoreSheetContainer.layer.cornerRadius = 35
        ANEAOQUVALCCoreSheetContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        ANEAOQUVALCCoreSheetContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCCoreSheetContainer)

        ANEAOQUVALCManifestTitleLabel.text = "EULA"
        ANEAOQUVALCManifestTitleLabel.font = UIFont.systemFont(ofSize: 28, weight: .black)
        ANEAOQUVALCManifestTitleLabel.textColor = .black
        ANEAOQUVALCManifestTitleLabel.textAlignment = .center
        ANEAOQUVALCManifestTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCoreSheetContainer.addSubview(ANEAOQUVALCManifestTitleLabel)

        ANEAOQUVALCScrollableLyricArea.isEditable = false
        ANEAOQUVALCScrollableLyricArea.backgroundColor = .clear
        ANEAOQUVALCScrollableLyricArea.showsVerticalScrollIndicator = false
        let ANEAOQUVALCLyricContent = """
        Last Updated: 01/01, 2026 Contact: Aquva@gmail.com

        This End User License Agreement ("Agreement") is a binding legal contract between you and Aquva. By downloading, installing, or using the Aquva mobile application, you agree to be bound by the terms herein.

        Scope of License
        Aquva grants you a personal, non-exclusive, non-transferable, limited license to use the app for personal, non-commercial purposes strictly in accordance with the terms of this Agreement. This license is granted specifically for your participation in festival-related social interactions, real-time stage discussions, and media sharing.

        User Conduct Restrictions
        As a condition of your license, you agree not to:

        Post or transmit any content that is defamatory, obscene, pornographic, or promotes hate speech against festival performers or attendees.

        Engage in "crowd-disruption" behavior, including using the real-time energy feed to coordinate illegal activities or spread false emergency information.

        Record or livestream video calls or private stage moments of other users without their explicit, verbal, or written consent.

        Use automated scripts or bots to "match" with users or scrape festival lineup data.

        Harass or stalk individuals across different festival stages or through the "crew" formation feature.

        Termination of License
        Aquva reserves the right, in its sole discretion, to terminate or suspend your access to the application immediately and without prior notice if:

        You violate any conduct restrictions outlined above.

        Your behavior at a physical festival venue is reported as harmful by multiple verified Aquva users.

        You attempt to circumvent safety filters or regional restrictions. Upon termination, you must cease all use of the application and delete all copies from your mobile devices. Aquva shall not be liable for any loss of "moments," "crews," or "chat history" resulting from termination.
        """
        let ANEAOQUVALCParagraphStyle = NSMutableParagraphStyle()
        ANEAOQUVALCParagraphStyle.lineSpacing = 6
        let ANEAOQUVALCAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .medium),
            .foregroundColor: UIColor.systemGray,
            .paragraphStyle: ANEAOQUVALCParagraphStyle
        ]
        ANEAOQUVALCScrollableLyricArea.attributedText = NSAttributedString(string: ANEAOQUVALCLyricContent, attributes: ANEAOQUVALCAttributes)
        ANEAOQUVALCScrollableLyricArea.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCoreSheetContainer.addSubview(ANEAOQUVALCScrollableLyricArea)

        ANEAOQUVALCActionStackWrapper.axis = .horizontal
        ANEAOQUVALCActionStackWrapper.distribution = .fillEqually
        ANEAOQUVALCActionStackWrapper.spacing = 15
        ANEAOQUVALCActionStackWrapper.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCCoreSheetContainer.addSubview(ANEAOQUVALCActionStackWrapper)

        ANEAOQUVALCAbortTrigger.setTitle("Cancle", for: .normal)
        ANEAOQUVALCAbortTrigger.setTitleColor(.black, for: .normal)
        ANEAOQUVALCAbortTrigger.backgroundColor = ANEAOQUVALCNeutralGray
        ANEAOQUVALCAbortTrigger.layer.cornerRadius = 20
        ANEAOQUVALCAbortTrigger.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        ANEAOQUVALCAbortTrigger.addTarget(self, action: #selector(ANEAOQUVALCDismissVibeAction), for: .touchUpInside)

        ANEAOQUVALCConfirmTrigger.setTitle("Agree", for: .normal)
        ANEAOQUVALCConfirmTrigger.setTitleColor(.white, for: .normal)
        ANEAOQUVALCConfirmTrigger.backgroundColor = ANEAOQUVALCVibePink
        ANEAOQUVALCConfirmTrigger.layer.cornerRadius = 20
        ANEAOQUVALCConfirmTrigger.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        ANEAOQUVALCConfirmTrigger.addTarget(self, action: #selector(ANEAOQUVALCAcceptVibeAction), for: .touchUpInside)

        ANEAOQUVALCActionStackWrapper.addArrangedSubview(ANEAOQUVALCAbortTrigger)
        ANEAOQUVALCActionStackWrapper.addArrangedSubview(ANEAOQUVALCConfirmTrigger)

        NSLayoutConstraint.activate([
//            ANEAOQUVALCStageVisualHeader.topAnchor.constraint(equalTo: view.topAnchor),
//            ANEAOQUVALCStageVisualHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            ANEAOQUVALCStageVisualHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            ANEAOQUVALCStageVisualHeader.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),

            ANEAOQUVALCCoreSheetContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            ANEAOQUVALCCoreSheetContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ANEAOQUVALCCoreSheetContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCCoreSheetContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            ANEAOQUVALCManifestTitleLabel.topAnchor.constraint(equalTo: ANEAOQUVALCCoreSheetContainer.topAnchor, constant: 35),
            ANEAOQUVALCManifestTitleLabel.centerXAnchor.constraint(equalTo: ANEAOQUVALCCoreSheetContainer.centerXAnchor),

            ANEAOQUVALCScrollableLyricArea.topAnchor.constraint(equalTo: ANEAOQUVALCManifestTitleLabel.bottomAnchor, constant: 20),
            ANEAOQUVALCScrollableLyricArea.leadingAnchor.constraint(equalTo: ANEAOQUVALCCoreSheetContainer.leadingAnchor, constant: 25),
            ANEAOQUVALCScrollableLyricArea.trailingAnchor.constraint(equalTo: ANEAOQUVALCCoreSheetContainer.trailingAnchor, constant: -25),
            ANEAOQUVALCScrollableLyricArea.bottomAnchor.constraint(equalTo: ANEAOQUVALCActionStackWrapper.topAnchor, constant: -20),

            ANEAOQUVALCActionStackWrapper.leadingAnchor.constraint(equalTo: ANEAOQUVALCCoreSheetContainer.leadingAnchor, constant: 25),
            ANEAOQUVALCActionStackWrapper.trailingAnchor.constraint(equalTo: ANEAOQUVALCCoreSheetContainer.trailingAnchor, constant: -25),
            ANEAOQUVALCActionStackWrapper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            ANEAOQUVALCActionStackWrapper.heightAnchor.constraint(equalToConstant: 65)
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.4) {
            self.ANEAOQUVALCBlurEffectBackdrop.alpha = 1
        }
    }

    @objc private func ANEAOQUVALCDismissVibeAction() {
        UIView.animate(withDuration: 0.3, animations: {
            self.ANEAOQUVALCBlurEffectBackdrop.alpha = 0
            self.view.alpha = 0
        }) { _ in
            self.dismiss(animated: false)
        }
    }

    @objc private func ANEAOQUVALCAcceptVibeAction() {
        
        UserDefaults.standard.set(true, forKey: "ANEAOQUVALC_EULA_ACCEPTED")
        ANEAOQUVALCDismissVibeAction()
        NotificationCenter.default.post(name: NSNotification.Name.init("changeUIWithStatus"), object: nil)
    }
}


