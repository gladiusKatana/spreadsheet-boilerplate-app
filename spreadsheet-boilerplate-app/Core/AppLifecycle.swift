import UIKit // AppLifecycle.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {             print("\n▶️became active")
        
        reloadLock = false
        topVC.reloadCV()
    }
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {         //print("🌔will enter foreground\n")
        
        checkOrientation()
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {            print("\n⏸will resign active")
        
        topVC.saveDataToKeychain(saveDate: true,
                                 resetLastLogin: true,
                                 showDate: true,
                                 pryntData: false)
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {          //print("🌘entered background")
    }
    
    
    func applicationWillTerminate(_ application: UIApplication) {               print("🌑terminated")
    }
    
}

