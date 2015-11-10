//
//  AppDelegate.swift
//  PoleTV
//
//  Created by Alberto Banet Masa on 4/11/15.
//  Copyright © 2015 abanet. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {

    var window: UIWindow?

    var appController: TVApplicationController?
    static let TVBaseURL = "http://abmPoleTvWeb.parseapp.com/"
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/application.js"

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // 1
        let appControllerContext = TVApplicationControllerContext()
        
        // 2
        guard let javaScriptURL = NSURL(string: AppDelegate.TVBootURL) else {
            fatalError("unable to create NSURL")
        }
        appControllerContext.javaScriptApplicationURL = javaScriptURL
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        
        // 3
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        return true
    }


}

