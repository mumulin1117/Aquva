//
//  ANEAOQUVALCLoginController.swift
//  AquaNeaoc
//
//  Created by  on 2026/1/15.
//

import UIKit

import UIKit

class ANEAOQUVALCLoginViewController: UIViewController {
    
    private let ANEAOQUVALCHeaderVisualContainer = UIImageView()
    private let ANEAOQUVALCMainContentSheet = UIView()
    private let ANEAOQUVALCAppIdentityLabel = UILabel()
    private let ANEAOQUVALCEmailInputField = UITextField()
    private let ANEAOQUVALCPasswordInputField = UITextField()
    private let ANEAOQUVALCExecuteLoginButton = UIButton()
    
    private let ANEAOQUVALCLegalStackView = UIStackView()
    private let ANEAOQUVALCConsentToggle = UIButton()
    private let ANEAOQUVALCPrivacytermmLink = UIButton()
    private let ANEAOQUVALCUserpriccsLink = UIButton()
    private let ANEAOQUVALCEulaTriggerButton = UIButton()
    
    private var ANEAOQUVALCSheetTopConstraint: NSLayoutConstraint?
    private let ANEAOQUVALCPrimaryVibeColor = UIColor(red: 1.00, green: 0.53, blue: 0.71, alpha: 1.00)

    override func viewDidLoad() {
        super.viewDidLoad()
        ANEAOQUVALCSetupFestivalInterface()
        ANEAOQUVALCInitiateKeyboardObservers()
        ANEAOQUVALCSetupGestureDismissal()
        NotificationCenter.default.addObserver(self, selector: #selector(changeUIWithStatus), name: NSNotification.Name.init("changeUIWithStatus"), object: nil)
    }

    private func ANEAOQUVALCSetupFestivalInterface() {
        view.backgroundColor = .white
        ANEAOQUVALCExecuteLoginButton.addTarget(self, action: #selector(ANEAOQUVALCInitiateSonicFetch), for: .touchUpInside)
        
        changeUIWithStatus()
        ANEAOQUVALCHeaderVisualContainer.contentMode = .scaleAspectFill
        ANEAOQUVALCHeaderVisualContainer.clipsToBounds = true
        ANEAOQUVALCHeaderVisualContainer.image = UIImage(named: "ANEAOQUVALC_Festival_Crowd")
        ANEAOQUVALCHeaderVisualContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCHeaderVisualContainer)

        ANEAOQUVALCMainContentSheet.backgroundColor = .white
        ANEAOQUVALCMainContentSheet.layer.cornerRadius = 40
        ANEAOQUVALCMainContentSheet.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        ANEAOQUVALCMainContentSheet.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCMainContentSheet)

        ANEAOQUVALCAppIdentityLabel.font = UIFont.systemFont(ofSize: 34, weight: .black)
        let ANEAOQUVALCAttributedIdentity = NSMutableAttributedString(string: "Login Aquva ")
        ANEAOQUVALCAttributedIdentity.addAttribute(.foregroundColor, value: ANEAOQUVALCPrimaryVibeColor, range: NSRange(location: 6, length: 6))
        ANEAOQUVALCAppIdentityLabel.attributedText = ANEAOQUVALCAttributedIdentity
        ANEAOQUVALCAppIdentityLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainContentSheet.addSubview(ANEAOQUVALCAppIdentityLabel)

        ANEAOQUVALCConfigureInputField(ANEAOQUVALCEmailInputField, "Email", "Enter your email", "ANEAOQUVALCenvelope", 0)
        ANEAOQUVALCConfigureInputField(ANEAOQUVALCPasswordInputField, "Password", "Enter password", "ANEAOQUVALClock", 1)
        ANEAOQUVALCPasswordInputField.isSecureTextEntry = true

        ANEAOQUVALCExecuteLoginButton.setBackgroundImage(UIImage.init(named: "siunemailg"), for: .normal)
        ANEAOQUVALCExecuteLoginButton.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainContentSheet.addSubview(ANEAOQUVALCExecuteLoginButton)
        
        ANEAOQUVALCEulaTriggerButton.addTarget(self, action: #selector(ANEAOQUVALCOpenEulaPortal), for: .touchUpInside)
        ANEAOQUVALCEulaTriggerButton.setImage(UIImage.init(named: "ANEAOQUVALCEula"), for: .normal)
        ANEAOQUVALCEulaTriggerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ANEAOQUVALCEulaTriggerButton)
        view.addSubview(ANEAOQUVALCUserpriccsLink)
        view.addSubview(ANEAOQUVALCLegalStackView)
        ANEAOQUVALCLegalStackView.axis = .horizontal
        ANEAOQUVALCLegalStackView.spacing = 8
        ANEAOQUVALCLegalStackView.translatesAutoresizingMaskIntoConstraints = false
       
        ANEAOQUVALCUserpriccsLink.translatesAutoresizingMaskIntoConstraints = false
       
        
        ANEAOQUVALCConsentToggle.setImage(UIImage(systemName: "circle"), for: .normal)
               
        ANEAOQUVALCConsentToggle.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        ANEAOQUVALCConsentToggle.tintColor = ANEAOQUVALCPrimaryVibeColor
        ANEAOQUVALCConsentToggle.addTarget(self, action: #selector(ANEAOQUVALCDtoggleGetstatus), for: .touchUpInside)
        
        ANEAOQUVALCPrivacytermmLink.setTitle("By continuing you agree to our <Terms of Service>", for: .normal)
        ANEAOQUVALCPrivacytermmLink.setTitleColor(UIColor.lightGray, for: .normal)
        ANEAOQUVALCPrivacytermmLink.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight:.regular)
        ANEAOQUVALCUserpriccsLink.setTitle("<Privacy Policy>.", for: .normal)
        ANEAOQUVALCUserpriccsLink.setTitleColor(UIColor.lightGray, for: .normal)
        ANEAOQUVALCUserpriccsLink.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight:.regular)
        
        ANEAOQUVALCLegalStackView.addArrangedSubview(ANEAOQUVALCConsentToggle)
        ANEAOQUVALCLegalStackView.addArrangedSubview(ANEAOQUVALCPrivacytermmLink)
//        ANEAOQUVALCLegalStackView.addArrangedSubview(ANEAOQUVALCUserpriccsLink)

        ANEAOQUVALCSheetTopConstraint = ANEAOQUVALCMainContentSheet.topAnchor.constraint(equalTo: ANEAOQUVALCHeaderVisualContainer.bottomAnchor, constant: -40)

        NSLayoutConstraint.activate([
            ANEAOQUVALCHeaderVisualContainer.topAnchor.constraint(equalTo: view.topAnchor),
            ANEAOQUVALCHeaderVisualContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ANEAOQUVALCHeaderVisualContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCHeaderVisualContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),

            ANEAOQUVALCSheetTopConstraint!,
            ANEAOQUVALCMainContentSheet.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ANEAOQUVALCMainContentSheet.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ANEAOQUVALCMainContentSheet.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            ANEAOQUVALCAppIdentityLabel.topAnchor.constraint(equalTo: ANEAOQUVALCMainContentSheet.topAnchor, constant: 40),
            ANEAOQUVALCAppIdentityLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCMainContentSheet.leadingAnchor, constant: 30),

            ANEAOQUVALCExecuteLoginButton.bottomAnchor.constraint(equalTo: ANEAOQUVALCLegalStackView.topAnchor, constant: -30),
            ANEAOQUVALCExecuteLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ANEAOQUVALCExecuteLoginButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60),
            ANEAOQUVALCExecuteLoginButton.heightAnchor.constraint(equalToConstant: 60),

            ANEAOQUVALCUserpriccsLink.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ANEAOQUVALCUserpriccsLink.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            
            ANEAOQUVALCLegalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ANEAOQUVALCLegalStackView.bottomAnchor.constraint(equalTo: ANEAOQUVALCUserpriccsLink.topAnchor, constant:0),
            
            ANEAOQUVALCEulaTriggerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            ANEAOQUVALCEulaTriggerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func ANEAOQUVALCInitiateKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(ANEAOQUVALCHandleKeyboardRise), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ANEAOQUVALCHandleKeyboardFall), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func ANEAOQUVALCSetupGestureDismissal() {
        let ANEAOQUVALCTapGesture = UITapGestureRecognizer(target: self, action: #selector(ANEAOQUVALCDismissActiveInput))
        view.addGestureRecognizer(ANEAOQUVALCTapGesture)
    }

    @objc private func ANEAOQUVALCDismissActiveInput() {
        view.endEditing(true)
    }
    
   @objc func changeUIWithStatus() {
       if UserDefaults.standard.object(forKey: "ANEAOQUVALC_EULA_ACCEPTED") as? Bool == true {
           ANEAOQUVALCConsentToggle.isSelected = true
           return
       }
       ANEAOQUVALCConsentToggle.isSelected = false
    }
    @objc private func ANEAOQUVALCDtoggleGetstatus() {
        ANEAOQUVALCConsentToggle.isSelected = !ANEAOQUVALCConsentToggle.isSelected
        
        UserDefaults.standard.set(ANEAOQUVALCConsentToggle.isSelected, forKey: "ANEAOQUVALC_EULA_ACCEPTED")
        UserDefaults.standard.synchronize()
    }

    @objc private func ANEAOQUVALCHandleKeyboardRise(notification: NSNotification) {
        guard let ANEAOQUVALCKeyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let ANEAOQUVALCHeight = ANEAOQUVALCKeyboardFrame.cgRectValue.height
        
        UIView.animate(withDuration: 0.3) {
            self.ANEAOQUVALCSheetTopConstraint?.constant = -40 - (ANEAOQUVALCHeight * 0.5)
            self.view.layoutIfNeeded()
        }
    }

    @objc private func ANEAOQUVALCHandleKeyboardFall(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.ANEAOQUVALCSheetTopConstraint?.constant = -40
            self.view.layoutIfNeeded()
        }
    }

    
    @objc private func ANEAOQUVALCInitiateSonicFetch() {
        if ANEAOQUVALCConsentToggle.isSelected == false {
            ANEAOQUVALCHudComponent.shared.ANEAOQUVALCShowToast(text: "Please read our terms and ELUA First!")
            return
        }
        ANEAOQUVALCHudComponent.shared.ANEAOQUVALCBeginLoading(with: "Log in...")
        if let elail = ANEAOQUVALCEmailInputField.text,elail != "",let pased = ANEAOQUVALCPasswordInputField.text,pased != "" {
            ANEAOQUVALCFestivalRadioDispatcher.ANEAOQUVALCTransmitSonicWave(ANEAOQUVALCRoute: "/oalkoaz/sbtaxzuikfh", ANEAOQUVALCPayload: ["ANEAOQUVALCguestList":"59350823","ANEAOQUVALCgroupChat":elail,"ANEAOQUVALCgrunge":pased]) { [weak self] ANEAOQUVALdata in
                guard let MITTBuilsddata = ANEAOQUVALdata as? [String:Any],
                      let result = MITTBuilsddata["data"] as? [String:Any] else {
                    
                    ANEAOQUVALCHudComponent.shared.ANEAOQUVALCShowToast(text: "Your email account or password is error!")
                    return }
             
                UserDefaults.standard.set(result["ANEAOQUVALCfolkRock"] as? Int, forKey: "ANEAOQUVALCfolkRock")
                  
                
                UserDefaults.standard.set(result["ANEAOQUVALCglowStick"] as? String, forKey: "ANEAOQUVALCglowStick")
                  
                  
                 
                ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController =  ANEAOQUVALCMainNavigationHub.init()
                ANEAOQUVALCHudComponent.shared.ANEAOQUVALCDismissLoading()
            }ANEAOQUVALCOnFailure: {  ertttt in
      
                ANEAOQUVALCHudComponent.shared.ANEAOQUVALCShowToast(text: ertttt.localizedDescription)
            }

            return
        }
        
        
        ANEAOQUVALCHudComponent.shared.ANEAOQUVALCShowToast(text: "Email account or password cant not be empty!")
      
    }
    
    
    
    private func ANEAOQUVALCConfigureInputField(_ ANEAOQUVALCTextField: UITextField, _ ANEAOQUVALCTitle: String, _ ANEAOQUVALCPlaceholder: String, _ ANEAOQUVALCSymbol: String, _ ANEAOQUVALCIndex: CGFloat) {
        let ANEAOQUVALCLabel = UILabel()
        ANEAOQUVALCLabel.text = ANEAOQUVALCTitle
        ANEAOQUVALCLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        ANEAOQUVALCLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainContentSheet.addSubview(ANEAOQUVALCLabel)

        let ANEAOQUVALCIcon = UIImageView(image: UIImage(named: ANEAOQUVALCSymbol))
        
        ANEAOQUVALCIcon.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainContentSheet.addSubview(ANEAOQUVALCIcon)

        ANEAOQUVALCTextField.placeholder = ANEAOQUVALCPlaceholder
        ANEAOQUVALCTextField.layer.borderWidth = 2
        ANEAOQUVALCTextField.layer.borderColor = UIColor.black.cgColor
        ANEAOQUVALCTextField.layer.cornerRadius = 25
        ANEAOQUVALCTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        ANEAOQUVALCTextField.leftViewMode = .always
        ANEAOQUVALCTextField.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCMainContentSheet.addSubview(ANEAOQUVALCTextField)

        let ANEAOQUVALCOffset: CGFloat = 110 * ANEAOQUVALCIndex
        NSLayoutConstraint.activate([
            ANEAOQUVALCIcon.topAnchor.constraint(equalTo: ANEAOQUVALCAppIdentityLabel.bottomAnchor, constant: 40 + ANEAOQUVALCOffset),
            ANEAOQUVALCIcon.leadingAnchor.constraint(equalTo: ANEAOQUVALCMainContentSheet.leadingAnchor, constant: 30),
            ANEAOQUVALCIcon.widthAnchor.constraint(equalToConstant: 24),
            ANEAOQUVALCIcon.heightAnchor.constraint(equalToConstant: 24),

            ANEAOQUVALCLabel.centerYAnchor.constraint(equalTo: ANEAOQUVALCIcon.centerYAnchor),
            ANEAOQUVALCLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCIcon.trailingAnchor, constant: 10),

            ANEAOQUVALCTextField.topAnchor.constraint(equalTo: ANEAOQUVALCLabel.bottomAnchor, constant: 15),
            ANEAOQUVALCTextField.leadingAnchor.constraint(equalTo: ANEAOQUVALCMainContentSheet.leadingAnchor, constant: 30),
            ANEAOQUVALCTextField.trailingAnchor.constraint(equalTo: ANEAOQUVALCMainContentSheet.trailingAnchor, constant: -30),
            ANEAOQUVALCTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
extension ANEAOQUVALCLoginViewController {
    @objc func ANEAOQUVALCOpenEulaPortal() {
        let ANEAOQUVALCPopup = ANEAOQUVALCEulaPopupController()
        ANEAOQUVALCPopup.modalPresentationStyle = .overFullScreen
        self.present(ANEAOQUVALCPopup, animated: true)
    }
}
