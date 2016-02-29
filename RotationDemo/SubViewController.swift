//
//  SubViewController.swift
//  RotationDemo
//
//  Created by wuguanyu on 16/2/29.
//  Copyright © 2016年 dejauu. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    var isPo: Bool? {
        didSet {
            print("isPo: \(isPo)")
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

            appDelegate.screenOpt = .AllButUpsideDown
            if isPo! {
                UIDevice.currentDevice().setValue(UIDeviceOrientation.LandscapeLeft.rawValue, forKey: "orientation")
            } else {
                UIDevice.currentDevice().setValue(UIDeviceOrientation.Portrait.rawValue, forKey: "orientation")
            }
        }
    }
    
    let lockBtn = UIButton(type: .Custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brownColor()

        lockBtn.setTitle("Lock", forState: UIControlState.Normal)
        lockBtn.setTitle("UnLock", forState: UIControlState.Selected)
        lockBtn.backgroundColor = UIColor.greenColor()
        lockBtn.frame = CGRect(x: 100, y: 100, width: 70, height: 100)
        view.addSubview(lockBtn)
        lockBtn.addTarget(self, action: "lockOrUnlockScreen:", forControlEvents: UIControlEvents.TouchUpInside)
    }
  
    func lockOrUnlockScreen(sender: UIButton) {
        if sender.selected {
            sender.selected = false
            unLockScreen()
        } else {
            sender.selected = true
            lockScreen()
        }
    }
    
    func lockScreen() {
        let appDelegate = AppDelegate.getDelegate()
        
        let screenDirection = UIApplication.sharedApplication().statusBarOrientation
        if (screenDirection == .LandscapeLeft) || (screenDirection == .LandscapeRight) {
            appDelegate.screenOpt = .LandscapeOption
        } else {
            appDelegate.screenOpt = .PortraitOption
        }
    }
    
    func unLockScreen() {
        let appDelegate = AppDelegate.getDelegate()
        appDelegate.screenOpt = .AllButUpsideDown
    }
}
