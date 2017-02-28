//
//  AppDelegate.swift
//  CasperSplash
//
//  Created by testpilotfinal on 02/08/16.
//  Copyright © 2016 François Levaux-Tiffreau. All rights reserved.
//

import Cocoa



@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, StreamDelegate {

    
    var softwareStatusValueTransformer: SoftwareStatusValueTransformer?
    var casperSplashController: CasperSplashController!
    var casperSplashBackgroundController: CasperSplashBackgroundController!
    
    @IBOutlet weak var quitMenu: NSMenuItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        
        
        // Value Transformer for Software Status
        softwareStatusValueTransformer = SoftwareStatusValueTransformer()
        ValueTransformer.setValueTransformer(softwareStatusValueTransformer, forName: NSValueTransformerName(rawValue: "SoftwareStatusValueTransformer"))
        
        // Create controller and Initialize Preferences
        let storyboard = NSStoryboard(name: "CasperSplashController", bundle: nil)
        casperSplashController = storyboard.instantiateController(withIdentifier: "mainWindow") as! CasperSplashController
        casperSplashController.showWindow(self)

        // Create background controller
        #if !DEBUG
             casperSplashBackgroundController = storyboard.instantiateController(withIdentifier: "backgroundWindow") as! CasperSplashBackgroundController
            casperSplashBackgroundController.showWindow(self)
        #endif

    }

    func applicationDidBecomeActive(_ notification: Notification) {
        if let quitCommand = Preferences.sharedInstance.userDefaults?.string(forKey: PrefKeys.quitCommand) {
            if quitCommand.characters.count > 1 {
                NSLog("Too many characters in the quit command.")
                return
            }
            quitMenu.keyEquivalentModifierMask = NSCommandKeyMask
            quitMenu.keyEquivalent = quitCommand
        }
    }

 }

