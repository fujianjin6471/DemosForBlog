//
//  TableViewController.swift
//  InlineDatePicker
//
//  Created by 付剑津 on 2/2/16.
//  Copyright © 2016 fujianjin6471. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var events = [Event]()
    var dateFormatter = NSDateFormatter()
    var datePickerIndexPath: NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        setDateFormatter()
        createEvents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var rowHeight = tableView.rowHeight
        if datePickerIndexPath != nil && datePickerIndexPath!.row == indexPath.row {
            let cell = tableView.dequeueReusableCellWithIdentifier("DatePickerCell")!
            rowHeight = cell.frame.height
        }
        return rowHeight
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.beginUpdates()
        if datePickerIndexPath != nil && datePickerIndexPath!.row - 1 == indexPath.row { // case 2
            tableView.deleteRowsAtIndexPaths([datePickerIndexPath!], withRowAnimation: .Fade)
            datePickerIndexPath = nil
        } else { // case 1、3
            if datePickerIndexPath != nil { // case 3
                tableView.deleteRowsAtIndexPaths([datePickerIndexPath!], withRowAnimation: .Fade)
            }
            datePickerIndexPath = calculateDatePickerIndexPath(indexPath)
            tableView.insertRowsAtIndexPaths([datePickerIndexPath!], withRowAnimation: .Fade)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        tableView.endUpdates()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows = events.count
        if datePickerIndexPath != nil {
            rows++
        }
        return rows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if datePickerIndexPath != nil && datePickerIndexPath!.row == indexPath.row {
            cell = tableView.dequeueReusableCellWithIdentifier("DatePickerCell")!
            let datePicker = cell.viewWithTag(1) as! UIDatePicker
            let event = events[indexPath.row - 1]
            datePicker.setDate(event.time, animated: true)
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("EventCell")!
            let event = events[indexPath.row]
            cell.textLabel!.text = event.title
            cell.detailTextLabel!.text = dateFormatter.stringFromDate(event.time)
        }
        return cell
    }
}

extension TableViewController {
    func setDateFormatter() {
        dateFormatter.dateStyle = .ShortStyle
    }

    func createEvents() {
        let event1 = Event(title: "Swift 1.0", time: dateFormatter.dateFromString("6/2/14")!)
        let event2 = Event(title: "Swift 2.0", time: dateFormatter.dateFromString("9/16/15")!)
        let event3 = Event(title: "Swift Open Source", time: dateFormatter.dateFromString("12/4/15")!)
        
        events.append(event1)
        events.append(event2)
        events.append(event3)
    }
    
    func calculateDatePickerIndexPath(indexPathSelected: NSIndexPath) -> NSIndexPath {
        if datePickerIndexPath != nil && datePickerIndexPath!.row  < indexPathSelected.row { // case 3.2
            return NSIndexPath(forRow: indexPathSelected.row, inSection: 0)
        } else { // case 1、3.1
            return NSIndexPath(forRow: indexPathSelected.row + 1, inSection: 0)
        }
    }

    @IBAction func changeDate(sender: UIDatePicker) {
        let parentIndexPath = NSIndexPath(forRow: datePickerIndexPath!.row - 1, inSection: 0)
        // change model
        let event = events[parentIndexPath.row]
        event.time = sender.date
        // change view
        let eventCell = tableView.cellForRowAtIndexPath(parentIndexPath)!
        eventCell.detailTextLabel!.text = dateFormatter.stringFromDate(sender.date)
    }
    
}