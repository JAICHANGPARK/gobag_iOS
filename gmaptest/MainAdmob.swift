//
//  MainAdmob.swift
//  gmaptest
//
//  Created by PARK JAICHANG on 7/26/16.
//  Copyright © 2016 JAICHANGPARK. All rights reserved.
//

import Foundation
import GoogleMobileAds
import UIKit
import Google

class adViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    let Request = GADRequest()
    
    var interstition : GADInterstitial!
        override func viewDidLoad() {
        super.viewDidLoad()

            bannerView.hidden = true
            
            //Request.testDevices = [kGADSimulatorID] //admob 실험
            bannerView.delegate = self
            bannerView.adUnitID = "input your ad id"
            bannerView.rootViewController = self
            bannerView.loadRequest(Request)
            
            interstition = GADInterstitial(adUnitID: "input your id ")
           Request.testDevices = [kGADSimulatorID, "input test id " ]
            interstition.loadRequest(Request)
}
    func adViewDidReceiveAd(bannerView: GADBannerView!) {
        bannerView.hidden = false
    }
    func adView(bannerView: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        bannerView.hidden = true
    }
    @IBAction func showAd(sender: AnyObject) {
        if interstition.isReady {
            interstition.presentFromRootViewController(self)
            interstition = CreteAD()
        }
    }
    func CreteAD() -> GADInterstitial {
        let interstition = GADInterstitial(adUnitID: "input app id")
        interstition.loadRequest(GADRequest())
        return interstition
    }
    
    
    
    
    
    
    
}
