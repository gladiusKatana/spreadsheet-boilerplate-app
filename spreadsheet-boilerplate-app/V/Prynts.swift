import UIKit // Prynts.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

func pryntDataTabularized() {    /// spelling 'prynt' with a y so this function's existence won't hijack Xcode autocomplete priority for print statements
    print("")
    let gap = " "
    var i = 0
    
    if savedDataIndexPaths.isEmpty {
        print("[no data]")
    }
    
    for path in savedDataIndexPaths {
        
        guard let values = dataAtIndexPath[CellStruct(values:(path[0], path[1]))] else {print("no data"); return}
        var j = 0
        
        for value in values {
            
            let pathString = "\(path[0]),\(path[1])";  let maxPathString = " 8,7 "/// will depend on number of rows & columns in view controller
            let excess = String(repeating: " ", count: maxPathString.count - "\(pathString)".count)
            let spaces = String(repeating: " ", count: maxPathString.count - 2)
            
            let title = value
            
            let restOfString = "\(excess)\(gap)\(gap)\(gap)\(title)"
            
            let cmma = (j < values.count - 1 && values.count > 1) ? "," : ""
            
            if i == 0 {print("\npath    string(s)  *path = cell index path (column,row)\n")}
            
            if j == 0  {
                print("\(pathString)\(restOfString)\(cmma)")
            } else {
                print("\(spaces)\(restOfString)\(cmma)")
            }
            j += 1
        }
        i += 1
    }
    if !(savedDataIndexPaths.isEmpty) {print("")}
}

