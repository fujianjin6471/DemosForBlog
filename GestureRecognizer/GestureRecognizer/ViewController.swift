//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by 付剑津 on 3/25/15.
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

    @IBAction func hideKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }

}

