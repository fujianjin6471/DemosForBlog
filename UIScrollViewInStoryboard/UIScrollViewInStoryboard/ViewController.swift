//
//  ViewController.swift
//  UIScrollViewAndUIPageControl
//
//  Created by 付剑津 on 2/18/15.
//  Copyright (c) 2015 fujianjin6471. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        someImprovement()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pageTurn(sender: UIPageControl) {
        let viewSize = scrollView.frame.size
        let rect = CGRectMake(CGFloat(sender.currentPage) * viewSize.width, 0, viewSize.width, viewSize.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        let bounds = scrollView.frame
        pageControl.currentPage = Int(offset.x / bounds.size.width)
    }
    
    func someImprovement() {
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
    }
}

