//
//  ViewController.swift
//  Battery
//
//  Created by u135 on 2016/4/27.
//  Copyright © 2016年 u135. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var showBatteryLevel: UILabel!
    @IBOutlet weak var showBatteryState: UILabel!
    @IBOutlet weak var showBatteryPic: UIImageView!
    
    @IBAction func addObserver(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName("NotiUserPushBtn", object: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let device :UIDevice = UIDevice.currentDevice()
        // 啟動電池檢查
        device.batteryMonitoringEnabled = true
        // 註冊訊息中⼼
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "batteryStatus:", name: UIDeviceBatteryLevelDidChangeNotification, object: nil)
        // 強迫啟動⼀一次 
        self.batteryStatus()
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self,selector:"userPushBtn",name:"NotiUserPushBtn",object:nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
            
    }
    func batteryStatus(){
            let device: UIDevice = UIDevice.currentDevice()
            //取得電池容量
            var level: Float = device.batteryLevel
            //為了測試,⼿手動設定level為0.73
            if device.model == "iPhone"{ level = 0.90 }
            print("\(level)")
            showBatteryLevel.text = "\(Int(level * 100))%" //取得電池狀態
            switch device.batteryState {
            case UIDeviceBatteryState.Unknown:
                showBatteryState.text = "模擬器"
            case UIDeviceBatteryState.Charging:
                showBatteryState.text = "充電中"
            case UIDeviceBatteryState.Unplugged:
                showBatteryState.text = "使⽤用電池"
            case UIDeviceBatteryState.Full:
                showBatteryState.text = "充電完成"
           default:
                 break;
            }
            //要關閉Auto layout圖才會縮減
//            showBatteryPic
            
        
            // view mode 要設定成scale fill
         showBatteryPic.frame = CGRectMake(58 , 370, 180 * CGFloat(level) , 80) //裡面那塊的座標
        
            
             }
    func userPushBtn(){
        print("you push Button");
}

}