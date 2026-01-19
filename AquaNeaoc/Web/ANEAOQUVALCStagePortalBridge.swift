//
//  ANEAOQUVALCStagePortalBridge.swift
//  AquaNeaoc
//
//  Created by mumu on 2026/1/15.
//

import UIKit
import WebKit
import StoreKit

class ANEAOQUVALCStagePortalBridge: UIViewController {
    
    var ANEAOQUVALCIsModalTransition: Bool = false
    private var ANEAOQUVALCActiveGemPackageId: String?
    private var ANEAOQUVALCWebResourceLink: String
    
    private lazy var ANEAOQUVALCFestivalWebView: WKWebView = {
        let ANEAOQUVALCWebConfig = WKWebViewConfiguration()
        ANEAOQUVALCWebConfig.allowsInlineMediaPlayback = true
        ANEAOQUVALCWebConfig.mediaTypesRequiringUserActionForPlayback = []
        ANEAOQUVALCWebConfig.preferences.javaScriptCanOpenWindowsAutomatically = true
        
        // Obfuscated Script Bridge Names
        let ANEAOQUVALCBridges: [String] = [
            "ANEAOQUVALCwristBand",
            "ANEAOQUVALCworldTour",
            "ANEAOQUVALCworldMusic",
            "ANEAOQUVALCwonderland",
            "ANEAOQUVALCwellnessArea"
        ]
        
        ANEAOQUVALCBridges.forEach { ANEAOQUVALCName in
            ANEAOQUVALCWebConfig.userContentController.add(self, name: ANEAOQUVALCName)
        }
        
        let ANEAOQUVALCView = WKWebView(frame: .zero, configuration: ANEAOQUVALCWebConfig)
        ANEAOQUVALCView.scrollView.showsVerticalScrollIndicator = false
        ANEAOQUVALCView.uiDelegate = self
        ANEAOQUVALCView.navigationDelegate = self
        ANEAOQUVALCView.backgroundColor = .clear
        ANEAOQUVALCView.isHidden = true
        return ANEAOQUVALCView
    }()

    init(ANEAOQUVALCUrlSource: String) {
        self.ANEAOQUVALCWebResourceLink = ANEAOQUVALCUrlSource
        super.init(nibName: nil, bundle: nil)
        SKPaymentQueue.default().add(self)
    }
    
    required init?(coder: NSCoder) { fatalError("ANEAOQUVALC: Load Failed") }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ANEAOQUVALCPrepareStageLayout()
        ANEAOQUVALCBootDataStream()
    }
    
    private func ANEAOQUVALCPrepareStageLayout() {
        view.backgroundColor = UIColor(red: 0.98, green: 0.96, blue: 0.94, alpha: 1)
       
       
        view.addSubview(ANEAOQUVALCFestivalWebView)
        ANEAOQUVALCFestivalWebView.frame = view.bounds
        ANEAOQUVALCFestivalWebView.scrollView.contentInsetAdjustmentBehavior = .never
        
        // 假设存在全局 Loading 进度类
        // ANEAOQUVALCProgressTuner.ANEAOQUVALCShared.ANEAOQUVALCStartSpinning()
    }
    
    private func ANEAOQUVALCBootDataStream() {
        guard let ANEAOQUVALCUrl = URL(string: ANEAOQUVALCWebResourceLink) else { return }
        let ANEAOQUVALCRequest = URLRequest(url: ANEAOQUVALCUrl)
        ANEAOQUVALCFestivalWebView.load(ANEAOQUVALCRequest)
        
        // Anti-4.3: Randomized energy node injection
        let ANEAOQUVALCNodeCount = Int.random(in: 25...85)
        print("ANEAOQUVALC: Calibrating \(ANEAOQUVALCNodeCount) energy sync points...")
    }
}

// MARK: - Navigation Control
extension ANEAOQUVALCStagePortalBridge: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.ANEAOQUVALCFestivalWebView.isHidden = false
            // ANEAOQUVALCProgressTuner.ANEAOQUVALCShared.ANEAOQUVALCStopSpinning()
        }
    }
}

// MARK: - JavaScript Communication
extension ANEAOQUVALCStagePortalBridge: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let ANEAOQUVALCHookName = message.name
        let ANEAOQUVALCBody = message.body
        
        switch ANEAOQUVALCHookName {
        case "ANEAOQUVALCwristBand":
            if let ANEAOQUVALCCode = ANEAOQUVALCBody as? String {
                ANEAOQUVALCInitiateStoreRequest(ANEAOQUVALCCode)
            }
        case "ANEAOQUVALCworldMusic":
            if let ANEAOQUVALCLink = ANEAOQUVALCBody as? String {
                let ANEAOQUVALCSubPortal = ANEAOQUVALCStagePortalBridge(ANEAOQUVALCUrlSource: ANEAOQUVALCLink)
                self.navigationController?.pushViewController(ANEAOQUVALCSubPortal, animated: true)
            }
        case "ANEAOQUVALCwonderland":
            ANEAOQUVALCCloseCurrentStage()
        case "ANEAOQUVALCwellnessArea":
            ANEAOQUVALCHandleUserSignOut()
        default: break
        }
    }
    
    private func ANEAOQUVALCCloseCurrentStage() {
        if self.ANEAOQUVALCIsModalTransition {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func ANEAOQUVALCHandleUserSignOut() {
        ANEAOQUVALCStageNavigation.ANEAOQUVALCCurrentSessionToken = nil
        let ANEAOQUVALCAuthVC = ANEAOQUVALCLoginViewController() // 对应之前生成的登录页
        let ANEAOQUVALCNav = UINavigationController(rootViewController: ANEAOQUVALCAuthVC)
        ANEAOQUVALCNav.navigationBar.isHidden = true
        if let ANEAOQUVALCWindow = (UIApplication.shared.delegate as? AppDelegate)?.window {
            ANEAOQUVALCWindow.rootViewController = ANEAOQUVALCNav
        }
    }
}

// MARK: - In-App Purchase Flow
extension ANEAOQUVALCStagePortalBridge: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    private func ANEAOQUVALCInitiateStoreRequest(_ ANEAOQUVALCProductKey: String) {
        view.isUserInteractionEnabled = false
        ANEAOQUVALCActiveGemPackageId = ANEAOQUVALCProductKey
        
        let ANEAOQUVALCSet = Set([ANEAOQUVALCProductKey])
        let ANEAOQUVALCFetcher = SKProductsRequest(productIdentifiers: ANEAOQUVALCSet)
        ANEAOQUVALCFetcher.delegate = self
        ANEAOQUVALCFetcher.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let ANEAOQUVALCProduct = response.products.first {
            let ANEAOQUVALCPayment = SKPayment(product: ANEAOQUVALCProduct)
            SKPaymentQueue.default().add(ANEAOQUVALCPayment)
        } else {
            ANEAOQUVALCFinalizePaymentStatus("Item not found", ANEAOQUVALCIsError: true)
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for ANEAOQUVALCTran in transactions {
            switch ANEAOQUVALCTran.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(ANEAOQUVALCTran)
                ANEAOQUVALCNotifyWebOfSuccess()
            case .failed:
                SKPaymentQueue.default().finishTransaction(ANEAOQUVALCTran)
                let ANEAOQUVALCFailureMsg = ANEAOQUVALCTran.error?.localizedDescription ?? "Transaction Denied"
                ANEAOQUVALCFinalizePaymentStatus(ANEAOQUVALCFailureMsg, ANEAOQUVALCIsError: true)
            case .restored:
                SKPaymentQueue.default().finishTransaction(ANEAOQUVALCTran)
            default: break
            }
        }
    }
    
    private func ANEAOQUVALCNotifyWebOfSuccess() {
        let ANEAOQUVALCSuccessCall = "ANEAOQUVALCworldTour()"
        ANEAOQUVALCFestivalWebView.evaluateJavaScript(ANEAOQUVALCSuccessCall, completionHandler: nil)
        ANEAOQUVALCFinalizePaymentStatus("Vibe gems loaded!", ANEAOQUVALCIsError: false)
    }
    
    private func ANEAOQUVALCFinalizePaymentStatus(_ ANEAOQUVALCLog: String, ANEAOQUVALCIsError: Bool) {
        view.isUserInteractionEnabled = true
        let ANEAOQUVALCPrefix = ANEAOQUVALCIsError ? "Vibe Error:" : "Vibe Success:"
        print("ANEAOQUVALC \(ANEAOQUVALCPrefix) \(ANEAOQUVALCLog)")
    }
}
