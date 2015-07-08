//
//  ViewController.swift
//  WhichLayoutSubviews
//
//  Created by 付剑津 on 6/5/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var thirdWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondThirdBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondThirdTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondLeftConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeConstraint(sender: AnyObject) {
        thirdWidthConstraint.constant += 1
//        secondThirdBottomConstraint.constant += 1
//        secondThirdTopConstraint.constant += 1
//        secondLeftConstraint.constant += 1
    }

}

