import UIKit // AddData.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    func addDataAtCell(withColumn column: Int, withRow row: Int,
                       textEntered: String, appendable: Bool) {   //print("adding a value to a cell")
        
        let cellToAdd = CellStruct(values:(column, row))
        
        if appendable {
            
            if dataAtIndexPath[cellToAdd] != nil {
                dataAtIndexPath[cellToAdd]!.append(textEntered)
            }
            
            else {
                dataAtIndexPath[cellToAdd] = [textEntered]
            }
        }
        
        else {
            dataAtIndexPath[cellToAdd] = [textEntered]
        }
        
        /// optional save to keychain each time new data is added
        saveDataToKeychain(saveDate: true, resetLastLogin: true, showDate: false, pryntData: false)
    }
}

