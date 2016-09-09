//
//  ViewController.swift
//  InteractiveLocalNotification
//
//  Created by 付剑津 on 9/7/16.
//  Copyright © 2016 fujianjin6471. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        createLocalNotification()
    }
    
    func createLocalNotification() {
        let newLocalNotification = UILocalNotification()
        newLocalNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        newLocalNotification.timeZone = NSTimeZone.defaultTimeZone()
        newLocalNotification.alertBody = "You can't do anything with me!"
        newLocalNotification.soundName = UILocalNotificationDefaultSoundName
        newLocalNotification.category = "ExampleCategory"
        UIApplication.sharedApplication().scheduleLocalNotification(newLocalNotification)
    }

    

}

