import UIKit // TFReturn.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

//           //*TF = text field

extension CollectionVC {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {              ///print("text field returned")
        
        exitInputModeWrapper(textField)
        
        return true
    }
    
    
    func exitInputModeWrapper(_ textField: UITextField) {
        
        let textEntered = textField.text!
        
        if !(textEntered == "" || textEntered == " " || textEntered == "  ") {  /// if user (for some reason) enters > 2 spaces, well, it's saved
            
            addDataAtCell(withColumn: selectedIndexPath[0], withRow: selectedIndexPath[1],
                          textEntered: textEntered, appendable: false)
            
            cellSetIndexPath = selectedIndexPath
            
        } else {
            exitDataEntryMode()
        }
        
        textField.text = ""
        selectedIndexPath = defaultPathOutOfView
        
        balanceSums = []                                                        ///; print("\nbalance sums reset to \(balanceSums)\n")
        reloadLock = false
        reloadCV()
        
        //DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
        //saveDataToKeychain(saveDate: true, resetLastLogin: true, showDate: true, pryntData: true)
        //}
    }
}

