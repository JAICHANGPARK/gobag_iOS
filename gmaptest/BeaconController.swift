//
//  BeaconController.swift
//  gmaptest
//
//  Created by PARK JAICHANG on 9/6/16.
//  Copyright © 2016 JAICHANGPARK. All rights reserved.
//

import CoreLocation
import UIKit

class BeaconController: UIViewController, CLLocationManagerDelegate {
    
    let timevalue = 6.0
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    //@IBOutlet weak var distanceLable: UILabel! //스토리보드의 텍스트
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        //배경 색을 회색으로
        view.backgroundColor = UIColor.grayColor()
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse || status == CLAuthorizationStatus.AuthorizedAlways{
            
            if CLLocationManager.isMonitoringAvailableForClass(CLBeaconRegion.self){
                
                
                if CLLocationManager.isRangingAvailable(){
                    
                    
                    //do stuff
                    startScanning()
                    
                }
            }
        }
    }
    
    func startScanning(){
        
        let uuid = NSUUID(UUIDString: "0000dfb0-0000-1000-8000-00805f9b34fb")
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid!, major: 123, minor: 456, identifier: "myBeacon")
        
        locationManager.startMonitoringForRegion(beaconRegion)
        locationManager.startRangingBeaconsInRegion(beaconRegion)
        
    }
    
    func updateDistance(distance: CLProximity){
        
        UIView.animateWithDuration(1) { [unowned self] in
            switch distance{
                
            case .Unknown:
                self.view.backgroundColor = UIColor.grayColor()
                self.distanceLabel.text = "UNKNOWN"
                
            case .Far:
                self.view.backgroundColor = UIColor.blueColor()
                self.distanceLabel.text = "FAR"
                
            case .Near:
                self.view.backgroundColor = UIColor.orangeColor()
                self.distanceLabel.text = "NEAR"
                
            case .Immediate:
                self.view.backgroundColor = UIColor.redColor()
                self.distanceLabel.text = "RIGHT HERE"
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        if beacons.count > 0 {
            let beacon = beacons.first! as CLBeacon
            updateDistance(beacon.proximity)
        }else{
            
            updateDistance(.Unknown)
            
        }
        
        }
    }
