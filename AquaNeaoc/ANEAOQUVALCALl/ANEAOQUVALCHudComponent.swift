//
//  ANEAOQUVALCHudComponent.swift
//  AquaNeaoc
//
//  Created by ANEAOQUVALC on 2026/1/19.
//
import UIKit

class ANEAOQUVALCHudComponent: UIView {
    
    static let shared = ANEAOQUVALCHudComponent()
    
    private let ANEAOQUVALCBackingView = UIView()
    private let ANEAOQUVALCIndicator = UIActivityIndicatorView(style: .large)
    private let ANEAOQUVALCMessageLabel = UILabel()
    
    private init() {
        super.init(frame: UIScreen.main.bounds)
        ANEAOQUVALCSetupLayout()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func ANEAOQUVALCSetupLayout() {
        // 半透明背景
        ANEAOQUVALCBackingView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        ANEAOQUVALCBackingView.layer.cornerRadius = 12
        ANEAOQUVALCBackingView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(ANEAOQUVALCBackingView)
        
        ANEAOQUVALCIndicator.color = .white
        ANEAOQUVALCIndicator.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCBackingView.addSubview(ANEAOQUVALCIndicator)
        
        ANEAOQUVALCMessageLabel.textColor = .white
        ANEAOQUVALCMessageLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        ANEAOQUVALCMessageLabel.textAlignment = .center
        ANEAOQUVALCMessageLabel.numberOfLines = 0
        ANEAOQUVALCMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        ANEAOQUVALCBackingView.addSubview(ANEAOQUVALCMessageLabel)
        
        NSLayoutConstraint.activate([
            ANEAOQUVALCBackingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            ANEAOQUVALCBackingView.centerYAnchor.constraint(equalTo: centerYAnchor),
            ANEAOQUVALCBackingView.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            ANEAOQUVALCBackingView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            ANEAOQUVALCBackingView.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            
            ANEAOQUVALCIndicator.centerXAnchor.constraint(equalTo: ANEAOQUVALCBackingView.centerXAnchor),
            ANEAOQUVALCIndicator.topAnchor.constraint(equalTo: ANEAOQUVALCBackingView.topAnchor, constant: 20),
            
            ANEAOQUVALCMessageLabel.topAnchor.constraint(equalTo: ANEAOQUVALCIndicator.bottomAnchor, constant: 12),
            ANEAOQUVALCMessageLabel.leadingAnchor.constraint(equalTo: ANEAOQUVALCBackingView.leadingAnchor, constant: 15),
            ANEAOQUVALCMessageLabel.trailingAnchor.constraint(equalTo: ANEAOQUVALCBackingView.trailingAnchor, constant: -15),
            ANEAOQUVALCMessageLabel.bottomAnchor.constraint(equalTo: ANEAOQUVALCBackingView.bottomAnchor, constant: -15)
        ])
    }
    
    // MARK: - 公开调用接口
    
    /// 开启加载提示
    func ANEAOQUVALCBeginLoading(with message: String? = ANEAOQUVALCSoundwaveCacheEngine.ANEAOQUVALCRetrieveSecretLyric(ANEAOQUVALCEncodedVibe: "zXinZiY4iFxgwr1eB7Bd7bAUXvLRaQe4U2w9t/Z1hb0W4pNWDmzHLCso")) {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
            self.frame = window.bounds
            self.ANEAOQUVALCMessageLabel.text = message
            self.ANEAOQUVALCIndicator.startAnimating()
            window.addSubview(self)
            
            self.alpha = 0
            UIView.animate(withDuration: 0.2) { self.alpha = 1 }
        }
    }
    
    /// 结束加载提示
    func ANEAOQUVALCDismissLoading() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 0
            }) { _ in
                self.ANEAOQUVALCIndicator.stopAnimating()
                self.removeFromSuperview()
            }
        }
    }
    
    /// 纯文字快速提示 (2秒后自动消失)
    func ANEAOQUVALCShowToast(text: String) {
        DispatchQueue.main.async {
            self.ANEAOQUVALCBeginLoading(with: text)
            self.ANEAOQUVALCIndicator.isHidden = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.ANEAOQUVALCDismissLoading()
                self.ANEAOQUVALCIndicator.isHidden = false
            }
        }
    }
}
