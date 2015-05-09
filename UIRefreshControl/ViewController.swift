//
//  ViewController.swift
//  UIRefreshControl
//
//  Created by 付剑津 on 5/9/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureRefreshControl()
    }
    
    func configureRefreshControl() {
        refreshControl.addTarget(self, action: "refreshEffect", forControlEvents: .ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
    }
    
    func refreshEffect() {
        println("Refresh!")
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

