import UIKit // UIMode.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

extension CollectionVC {
    
    func exitDataEntryMode() {
        
        textField.removeFromSuperview()
        
        setupNavBarButtons(grayTwo, greyIndex: buttonColorIndex, disabler: false)
        
        keyboardHeight = 0
        keyboardToolbarHeight = 0
        
        textFieldEditingMode = false
        textFieldDisplayed = false
        
    }
}

