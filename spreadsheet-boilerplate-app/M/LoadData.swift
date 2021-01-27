import UIKit // LoadData.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder
import SwiftKeychainWrapper

extension CollectionVC {
    
    func loadDataFromKeychain(showDate: Bool) {  //print("default load")
        
        savedDataIndexPaths = loadKeychainFromKeys(keychainStrings[0]) as? [[Int]] ?? []
        
        savedDataStringArrays = loadKeychainFromKeys(keychainStrings[1]) as? [[String]] ?? []
        
        
        if let components = loadKeychainFromKeys(keychainStrings[2]) as? [Any] {
            
            lastLoginDateComponents = components
            lastLoginDate = dateFromComponents(lastLoginDateComponents)
            
            if showDate {pryntLastLoginDate(); pryntCurrentDate()}
            
        } else {
            
            print("\nfirst login; saving login date-and-time")
            let (year, _, month, _ , day, weekday, _, hour, minute, _)
                = getChosenDateComponents(Date(), roundedDown: true)
            lastLoginDateComponents = [year, month, day, weekday, hour, minute]
        }
        
        
        populateCellDictionary() //; print("\nloaded \(savedDataIndexPaths.count) data paths: \(savedDataIndexPaths)\n")
        
        appHasBeenLaunchedAtLeastOnce = true
        
    }
    
}

