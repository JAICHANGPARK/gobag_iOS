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
            
            //let signin =
            
            bannerView.hidden = true
            
            //Request.testDevices = [kGADSimulatorID] //admob 실험
            bannerView.delegate = self
            bannerView.adUnitID = "ca-app-pub-7948714882446188/2641974550"
            bannerView.rootViewController = self
            bannerView.loadRequest(Request)
            
            interstition = GADInterstitial(adUnitID: "ca-app-pub-7948714882446188/6755946557")
           Request.testDevices = [kGADSimulatorID, "2077ef9a63d2b398840261c8221a0c9b" ]
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
        let interstition = GADInterstitial(adUnitID: "ca-app-pub-7948714882446188/6755946557")
        interstition.loadRequest(GADRequest())
        return interstition
    }
    
    
    
    
    
    
    
}