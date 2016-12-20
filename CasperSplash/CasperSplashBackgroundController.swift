//
//  CasperSplashBackgroundController.swift
//  CasperSplash
//
//  Created by François Levaux on 24.11.16.
//  Copyright © 2016 François Levaux-Tiffreau. All rights reserved.
//

import Cocoa

class CasperSplashBackgroundController: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        if let backgroundWindow = self.window, let screenMain = NSScreen.main() {
            
            backgroundWindow.contentRect(forFrameRect: screenMain.frame)
            backgroundWindow.setFrame(screenMain.frame, display: true)
            backgroundWindow.setFrameOrigin(screenMain.frame.origin)
            backgroundWindow.level = Int(CGWindowLevelForKey(.maximumWindow) - 1 )
            
            
        }
    }
    
}
