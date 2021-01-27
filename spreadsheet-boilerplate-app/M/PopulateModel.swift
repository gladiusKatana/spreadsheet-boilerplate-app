import UIKit // PopulateModel.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    func populateCellDictionary() {
        
        if savedDataStringArrays.isEmpty {
            
            print("no cell contents saved to your keychain for this device")    /// print("cell text array-of-arrays empty, ie its count is \(savedDataStringArrays.count)")
            
        } else {
            
            var i = 0
            
            for path in savedDataIndexPaths {                   //print("path: \(path), description array \(i)")
                
                if i < savedDataStringArrays.count {
                    let dataStrings = savedDataStringArrays[i]
                    var cellStrings = [String]()
                    var j = 0
                    
                    for str in dataStrings {
                        cellStrings.append(str)
                        j += 1
                    }
                    
                    dataAtIndexPath[CellStruct(values: (path[0], path[1]))] = cellStrings
                    
                    i += 1
                }
            }
        }
    }
    
}

