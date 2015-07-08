//
//  ViewController.swift
//  UsingNSCoder
//
//  Created by 付剑津 on 7/4/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as! [String]
        return (paths[0]).stringByAppendingPathComponent("TextField.plist")
    }
    
    func saveText() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(textField.text, forKey: "FieldText")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadText() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                textField.text = unarchiver.decodeObjectForKey("FieldText") as! String
                unarchiver.finishDecoding()
            }
        }
    }

    @IBAction func save(sender: AnyObject) {
        saveText()
        let alert = UIAlertController(title: "Prompt", message: "Data saved!", preferredStyle: .Alert)
        let firstAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(firstAction)
        presentViewController(alert, animated: true, completion: nil)
    }
}

