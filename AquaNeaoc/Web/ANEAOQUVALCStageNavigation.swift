//
//  ANEAOQUVALCStageNavigation.swift
//  AquaNeaoc
//
//  Created by mumu on 2026/1/15.
//

import Foundation

enum ANEAOQUVALCStageNavigation: String {

    case ANEAOQUVALCVibeDiscovery = "pages/interestDetails/index?topicId="
    case ANEAOQUVALCMomentDeepDive = "pages/DynamicDetails/index?dynamicId="
    
    case ANEAOQUVALCStudioUploader = "pages/publishDynamic/index?"
    
    case ANEAOQUVALCSoundPartnerMatch = "pages/RandomMatching/index?"
    case ANEAOQUVALCCrewSelector = "pages/selectUser/index?"
    case ANEAOQUVALCSetlistPortal = "pages/activityDetail/index?activityId="
    case ANEAOQUVALCLaunchPad = "pages/ReleaseEvent/index?"
    case ANEAOQUVALCArtistBioNews = "pages/newsDetails/index?userId="
    case ANEAOQUVALCConductReport = "pages/report/index?"
    
    case ANEAOQUVALCAttendeeBackstage = "pages/othersHomePage/index?userId=?"
    case ANEAOQUVALCFollowerRadar = "pages/Followers/index?"
    case ANEAOQUVALCSystemTuner = "pages/setting/index?"
    case ANEAOQUVALCPersonaEditor = "pages/EditProfile/index?"
    case ANEAOQUVALCGemDispenser = "pages/wallet/index?"
    case ANEAOQUVALCLegalVault = "pages/Agreement/index?type=1"
    case ANEAOQUVALCPrivacyWhisper = "pages/Agreement/index?type=2"
    case ANEAOQUVALCHarmonyTracker = "pages/CurrentUserDetails/index?matchUserId="
    case ANEAOQUVALCGenreFilter = "pages/Filter/index?"
    
    case ANEAOQUVALCStaticSignal = ""

    static var ANEAOQUVALCCurrentSessionToken: String? {
        get {
            let ANEAOQUVALCPreferenceHub = UserDefaults.standard
            return ANEAOQUVALCPreferenceHub.object(forKey: "ANEAOQUVALC_Identity_Token") as? String
        } set {
            UserDefaults.standard.set(newValue, forKey: "ANEAOQUVALC_Identity_Token")
        }
    }

    func ANEAOQUVALCConstructFestivalURL(ANEAOQUVALCAppendage: String) -> String {
        let ANEAOQUVALCDomainBridge = "http://n6z1d8m3h5j2v9k7p4g0t.shop/#"
        
        guard self != .ANEAOQUVALCStaticSignal else {
            return ANEAOQUVALCDomainBridge
        }
        
        let ANEAOQUVALCPassKey = ANEAOQUVALCStageNavigation.ANEAOQUVALCCurrentSessionToken ?? ""
        let ANEAOQUVALCUniqueAppCode = "59350823"
        
        let ANEAOQUVALCUrlFragments = [
            ANEAOQUVALCDomainBridge,
            self.rawValue,
            ANEAOQUVALCAppendage,
            "&token=", ANEAOQUVALCPassKey,
            "&appID=", ANEAOQUVALCUniqueAppCode
        ]
        
        return ANEAOQUVALCUrlFragments.joined()
    }
}
