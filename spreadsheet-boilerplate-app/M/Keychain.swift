import UIKit // Keychain.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder
import SwiftKeychainWrapper

func setKeychainKeys(_ inputVar: Any, forKey keyString: String) {   //print("setting keychain keys")
    
    do {
        
        let data = try NSKeyedArchiver.archivedData(withRootObject: inputVar, requiringSecureCoding: true)
        
        KeychainWrapper.standard.set(data, forKey: keyString)
        
        /*let saveSuccessful: Bool
         = KeychainWrapper.standard.set(data, forKey: keyString)
         print("Successfully saved to keychain? \(saveSuccessful)")*/
        
    } catch {
        print("Error setting keychain keys")
    }
}


func loadKeychainFromKeys(_ keyString: String) -> NSArray {
    
    var returnArray = NSArray()
    
    if let data = KeychainWrapper.standard.data(forKey: keyString)
    {
        do {
            let arrayFromData = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: data)!
            returnArray = arrayFromData
        }
        catch {
            print("Error loading from keychain keys")
        }
    }
    
    return returnArray
}

