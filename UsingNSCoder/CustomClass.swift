//
//  CustomClass.swift
//  UsingNSCoder
//
//  Created by 付剑津 on 7/4/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit

class CustomClass: NSObject, NSCoding {
    var text = ""
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
    }

    required convenience init(coder aDecoder: NSCoder) {
        self.init()
        text = aDecoder.decodeObjectForKey("Text") as! String
    }
    
}
