//
//  CustomClass.swift
//  UIActivityViewController
//
//  Created by 付剑津 on 8/7/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit
class CustomClass: NSObject, UIActivityItemSource {
    func activityViewControllerPlaceholderItem(activityViewController: UIActivityViewController) -> AnyObject {
        return "I am a String"
    }
    
    func activityViewController(activityViewController: UIActivityViewController, itemForActivityType activityType: String) -> AnyObject? {
        if activityType == UIActivityTypeMessage {
            return "message"
        }
        else if activityType == UIActivityTypeMail {
            return "mail"
        }
        else {
            return "others"
        }
    }
}