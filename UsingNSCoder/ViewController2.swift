//
//  ViewController2.swift
//  UsingNSCoder
//
//  Created by 付剑津 on 7/4/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var textField: UITextField!
    var onlyText = CustomClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCustomObject()
        textField.text = onlyText.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as! [String]
        return (paths[0]).stringByAppendingPathComponent("Object.plist")
    }
    
    func saveCustomObject() {
        onlyText.text = textField.text
        
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(onlyText, forKey: "CustomObject")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadCustomObject() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                onlyText = unarchiver.decodeObjectForKey("CustomObject") as! CustomClass
                unarchiver.finishDecoding()
            }
        }
    }

    @IBAction func saveAction(sender: AnyObject) {
        saveCustomObject()
        let alert = UIAlertController(title: "Prompt", message: "Data saved!", preferredStyle: .Alert)
        let firstAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(firstAction)
        presentViewController(alert, animated: true, completion: nil)
    }
}
