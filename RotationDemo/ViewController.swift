//
//  ViewController.swift
//  RotationDemo
//
//  Created by wuguanyu on 16/2/29.
//  Copyright © 2016年 dejauu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.screenOpt = .PortraitOption
        
        UIDevice.currentDevice().setValue(UIDeviceOrientation.Portrait.rawValue, forKey: "orientation")
    }

    @IBAction func pushLan(sender: AnyObject) {
        let exVc = SubViewController()
        exVc.isPortrait = false
        self.navigationController?.pushViewController(exVc, animated: true)
    }

    @IBAction func pushPo(sender: AnyObject) {
        let exVc = SubViewController()
        exVc.isPortrait = true
        self.navigationController?.pushViewController(exVc, animated: true)
    }
}
