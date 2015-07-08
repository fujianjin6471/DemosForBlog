//
//  HSCButton.swift
//  ResurgentHSCButton
//
//  Created by 付剑津 on 6/9/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit

protocol HSCButtonDelegate {
    func buttonPosChange()
}

class HSCButton: UIButton {

    var beginPoint: CGPoint!
    var dragEnable: Bool = true
    var delegate: HSCButtonDelegate!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // do anything you like to set the HSCButton
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if (!dragEnable) {
            return
        }
        
        let touch = touches.first as! UITouch
        beginPoint = touch.locationInView(self)
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        if (!dragEnable) {
            return
        }
        
        let touch = touches.first as! UITouch
        let nowPoint = touch.locationInView(self)
        
        let offsetX = nowPoint.x - beginPoint.x
        let offsetY = nowPoint.y - beginPoint.y
        
        self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY)
        
        if delegate != nil {
            delegate.buttonPosChange()
        }
    }
}
