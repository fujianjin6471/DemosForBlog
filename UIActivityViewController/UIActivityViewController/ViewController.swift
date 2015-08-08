//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by 付剑津 on 8/7/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
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

    @IBAction func services(sender: AnyObject) {
        let activityViewController = UIActivityViewController(activityItems: [CustomClass()], applicationActivities: nil)
//        activityViewController.excludedActivityTypes = [UIActivityTypeMail]
        presentViewController(activityViewController, animated: true, completion: nil)
    }

}

