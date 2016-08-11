//
//  ViewController.swift
//  CustomPresentation
//
//  Created by 付剑津 on 7/15/16.
//  Copyright © 2016 fujianjin6471. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let customTransitioningDelegate = TransitioningDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func presentAction(sender: UIButton) {
        let presentedVC = storyboard?.instantiateViewControllerWithIdentifier("PresentedVC") as! PresentedVC
        presentedVC.transitioningDelegate = customTransitioningDelegate
        presentedVC.modalPresentationStyle = .Custom
        presentViewController(presentedVC, animated: true, completion: nil)
    }

}

