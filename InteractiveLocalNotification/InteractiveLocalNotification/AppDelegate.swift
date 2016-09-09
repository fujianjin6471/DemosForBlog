//
//  AppDelegate.swift
//  InteractiveLocalNotification
//
//  Created by 付剑津 on 9/7/16.
//  Copyright © 2016 fujianjin6471. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        requireNotificationPermission()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        if identifier == "FirstAction" {
            print("This is the first action")
        } else if identifier == "SecondAction" {
            print("This is the second action")
        }
        completionHandler()
    }

    func requireNotificationPermission() {
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Sound, .Badge], categories: categoriesContainingActions())
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    }

    func categoriesContainingActions() -> Set<UIMutableUserNotificationCategory> {
        let firstAction = UIMutableUserNotificationAction()
        firstAction.identifier = "FirstAction"
        firstAction.title = "action1"
        firstAction.activationMode = .Background
        firstAction.destructive = false
        firstAction.authenticationRequired = false
        
        let secondAction = UIMutableUserNotificationAction()
        secondAction.identifier = "SecondAction"
        secondAction.title = "action2"
        secondAction.activationMode = .Background
        secondAction.destructive = true
        secondAction.authenticationRequired = true
        
        let actionsArray = [firstAction, secondAction]
        let actionsArrayMinimal = [firstAction, secondAction]
        
        let category = UIMutableUserNotificationCategory()
        category.identifier = "ExampleCategory"
        category.setActions(actionsArray, forContext: .Default)
        category.setActions(actionsArrayMinimal, forContext: .Minimal)
        
        let categories: Set = [category]
        
        return categories
    }
}

