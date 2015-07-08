//
//  RootView.swift
//  SetNeedsSomething
//
//  Created by 付剑津 on 6/8/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit

class RootView: UIView {

    @IBOutlet weak var orangeSquare: UIView!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    
    override func updateConstraints() {
        leftConstraint.constant = orangeSquare.frame.origin.x
        super.updateConstraints()
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
