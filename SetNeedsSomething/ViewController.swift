//
//  ViewController.swift
//  SetNeedsSomething
//
//  Created by 付剑津 on 6/6/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var rootView: RootView!
    @IBOutlet weak var orangeSquare: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setFrameOnly(sender: UIButton) {
        orangeSquare.frame.origin.x += 100
    }

    @IBAction func setFrameWithUpdatingConstraints(sender: UIButton) {
        orangeSquare.frame.origin.x += 100
        rootView.setNeedsUpdateConstraints()
    }
    
    @IBAction func setNeedsLayout(sender: UIButton) {
        rootView.setNeedsLayout()
    }
}

