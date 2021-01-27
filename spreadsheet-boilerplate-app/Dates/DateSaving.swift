import UIKit // DateSaving.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

func saveLastLoginComponentsAndDate(resetLastLogin: Bool) {
    
    let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(Date(), roundedDown: false)
    
    lastLoginDateComponents = [year, month, day, weekday, hour, minute]
    
    if resetLastLogin {lastLoginDate = dateFromComponents(lastLoginDateComponents)}
    
    setKeychainKeys(lastLoginDateComponents, forKey: keychainStrings[2])
    
}

