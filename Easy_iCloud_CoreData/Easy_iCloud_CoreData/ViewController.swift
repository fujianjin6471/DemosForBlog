//
//  ViewController.swift
//  Easy_iCloud_CoreData
//
//  Created by 付剑津 on 1/9/16.
//  Copyright © 2016 fujianjin6471. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    var context: NSManagedObjectContext!
    var fetchedResultsController: NSFetchedResultsController!
    
    @IBAction func addAnItem(sender: AnyObject) {
        let thing = NSEntityDescription.insertNewObjectForEntityForName("Thing", inManagedObjectContext: context) as! Thing
        thing.date = NSDate()
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadData()
    }
    
    func loadData() {
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        let fetchRequest = NSFetchRequest(entityName: "Thing")
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try fetchedResultsController.performFetch()
        } catch {
            let nserror = error as NSError
            print("error: \(nserror), \(nserror.userInfo)")
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        let thing = fetchedResultsController.objectAtIndexPath(indexPath) as! Thing
        cell.textLabel?.text = thing.date.description
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

