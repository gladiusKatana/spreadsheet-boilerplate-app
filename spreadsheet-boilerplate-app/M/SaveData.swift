import UIKit // SaveData.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder
import SwiftKeychainWrapper

extension CollectionVC {
    
    func saveDataToKeychain(saveDate: Bool, resetLastLogin: Bool, showDate: Bool, pryntData: Bool) {  //print("default save")
        
        if showDate {pryntDate(Date(), prefix: "\n                  ✔︎saved")}
        
        savedDataIndexPaths.removeAll()
        savedDataStringArrays.removeAll()
        
        for key in dataAtIndexPath.keys {
            let (a, b) = key.values                             //; print("key: [\(key)  values \((a, b))")
            savedDataIndexPaths.append([a, b])
            //let qNum = cellQueueNumber(from: [a,b])             ; print("key: [\(key)  rank \(qNum)")    // for demo purposes
        }
        
        for vals in dataAtIndexPath.values {
            if vals.count >= 1 {
                var dataDescriptions = [String]()
                
                for str in vals {
                    dataDescriptions.append(str)
                }
                
                savedDataStringArrays.append(dataDescriptions)
            }
        }
        
        sortCellData()
        
        setKeychainKeys(savedDataIndexPaths, forKey: keychainStrings[0])
        
        setKeychainKeys(savedDataStringArrays, forKey: keychainStrings[1])
        
        if saveDate {saveLastLoginComponentsAndDate(resetLastLogin: resetLastLogin)}
        if pryntData {pryntDataTabularized()}
    }
}

