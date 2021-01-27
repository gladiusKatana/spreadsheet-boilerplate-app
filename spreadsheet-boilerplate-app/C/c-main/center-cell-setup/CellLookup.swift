import UIKit // CellLookup.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    func cellLookup(from paths: [(Int,Int)]) -> [Double] { /// input tuples represent cell index paths (column,row)
        
        var returnValues = [0.0,0.0,0.0]
        
        var i = 0
        
        for path in paths {
            
            if let data = dataAtIndexPath[CellStruct(values:(path.0, path.1))],
               !data.isEmpty {
                
                if let dblStr = Double(data.last!) {
                    returnValues[i] = dblStr
                }
            }
            
            i += 1
        }
        
        //print("Found values \(returnValues) at cells \(paths), respectively")
        
        return returnValues
    }
    
}

