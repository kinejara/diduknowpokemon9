//
//  AppDelegate.swift
//  did you know pokemon
//
//  Created by Jorge Villa on 3/2/16.
//  Copyright © 2016 kine. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.checkForRatingAlert()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
   
    }

    func applicationDidEnterBackground(application: UIApplication) {
    
    }

    func applicationWillEnterForeground(application: UIApplication) {
    
    }

    func applicationDidBecomeActive(application: UIApplication) {
    
    }

    func applicationWillTerminate(application: UIApplication) {
    
    }
    
    func checkForRatingAlert() {
        let defaults = NSUserDefaults.standardUserDefaults()
        var runCounter = defaults.integerForKey(PkmnCommons.appRunTimesDefaultKey)
        
        if runCounter == 5 {
            self.displayRateAlert()
            defaults.setInteger(0, forKey: PkmnCommons.appRunTimesDefaultKey)
        } else {
            runCounter = runCounter + 1
            defaults.setInteger(runCounter, forKey: PkmnCommons.appRunTimesDefaultKey)
        }
    }
    
    func displayRateAlert() {
        dispatch_async(dispatch_get_main_queue(), {
            let title : String = "★★★★★"
            let message : String = NSLocalizedString("rate", comment: "")
            let cancelTitle : String = NSLocalizedString("cancel", comment: "")
            
            let importantAlert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: .Default, handler: { (UIAlertAction) in
                let appStoreUrl : NSURL = NSURL(string: PkmnCommons.appStoreUrl)!
                UIApplication.sharedApplication().openURL(appStoreUrl)
            })
            
            let cancelAction : UIAlertAction = UIAlertAction(title: cancelTitle, style: .Cancel, handler:nil)
            
            importantAlert.addAction(okAction)
            importantAlert.addAction(cancelAction)
            
            self.window?.rootViewController?.presentViewController(importantAlert, animated: true, completion: nil)
        })
    }
}

