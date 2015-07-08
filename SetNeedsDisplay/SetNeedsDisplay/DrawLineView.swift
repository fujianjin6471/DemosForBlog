//
//  DrawLineView.swift
//  SetNeedsDisplay
//
//  Created by 付剑津 on 6/11/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit

class DrawLineView: UIView {
    var point1, point2: CGPoint!

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        
        CGContextMoveToPoint(context, point1.x, point1.y)
        CGContextAddLineToPoint(context, point2.x, point2.y)
        CGContextStrokePath(context)
    }

}
