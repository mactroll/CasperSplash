//
//  AppDelegate.swift
//  CasperSplash
//
//  Created by testpilotfinal on 02/08/16.
//  Copyright © 2016 François Levaux-Tiffreau. All rights reserved.
//

import Cocoa



@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate { //, StreamDelegate {

    
    var casperSplashController: CasperSplashController?
    var casperSplashBackgroundController: CasperSplashBackgroundController?
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Create background controller
        #if !DEBUG
            let storyboard = NSStoryboard(name: "CasperSplashController", bundle: nil)
        casperSplashBackgroundController = storyboard.instantiateController(withIdentifier: "backgroundWindow") as? CasperSplashBackgroundController
        casperSplashBackgroundController?.showWindow(self)
        #endif



    }

 }

