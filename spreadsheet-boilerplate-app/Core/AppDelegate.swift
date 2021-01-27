import UIKit // AppDelegate.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    lazy var orientationLock = UIInterfaceOrientationMask.all       /// set orientations you want allowed by default (see V/RotateLock.swift)
    
    var statusBarUIView: UIView? {
        
        if #available(iOS 13.0, *) {
            
            let tag = 38482458385
            
            if let statusBar = globalWindow.viewWithTag(tag) {
                return statusBar
            }
            else {
                let statusBarView = UIView(frame: (globalWindow.windowScene?.statusBarManager!.statusBarFrame)!)
                statusBarView.tag = tag
                globalWindow.addSubview(statusBarView)
                return statusBarView
            }
            
        } else if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        
        else {return nil}
    }
}

