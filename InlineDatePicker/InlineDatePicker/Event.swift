//
//  Event.swift
//  InlineDatePicker
//
//  Created by 付剑津 on 2/2/16.
//  Copyright © 2016 fujianjin6471. All rights reserved.
//

import Foundation
class Event {
    let title: String
    var time: NSDate
    init(title: String, time: NSDate) {
        self.title = title
        self.time = time
    }
}