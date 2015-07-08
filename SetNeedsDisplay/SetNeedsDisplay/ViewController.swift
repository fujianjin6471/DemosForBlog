//
//  ViewController.swift
//  SetNeedsDisplay
//
//  Created by 付剑津 on 6/11/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HSCButtonDelegate {
    @IBOutlet var drawLineView: DrawLineView!
    @IBOutlet weak var button1: HSCButton!
    @IBOutlet weak var button2: HSCButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button1.delegate = self
        button2.delegate = self
        buttonPosChange()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buttonPosChange() {
        drawLineView.point1 = CGPointMake(button1.center.x, button1.center.y);
        drawLineView.point2 = CGPointMake(button2.center.x, button2.center.y);
        // to test setNeedsDisplay's effect, just comment next line of code
        drawLineView.setNeedsDisplay()
    }

}

