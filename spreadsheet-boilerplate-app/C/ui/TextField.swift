import UIKit // TextField.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    func presentTextFieldAndReload(after delay: Double, forDataAtRow row: Int?) {
        reloadLock = false
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.setupNavBarButtons(grayTwo, greyIndex: self.buttonColorIndex, disabler: true)
            self.prepareAndPresentTextField(forDataAtRow: row)
            self.reloadCV()
        }
    }
    
    func prepareAndPresentTextField(forDataAtRow row: Int?) {
        let str = ""
        formatAndPresentTextField(str)
    }
    
    func formatAndPresentTextField(_ textFieldContents: String) {
        if keyboardAsNumberPad {
            self.textField.keyboardType = .decimalPad
            self.textField.addDoneCancelToolbar()
        }
        
        let width = globalWindow.frame.width
        let cols = CGFloat(customFlowLayout!.cols)
        
        textFieldWidth = width * (cols - 2) / cols /// keep 1 column to right, 1 to left of text field
        let eighthWidth = width / cols
        
        if textFieldEditingMode {
            textField.text = textFieldContents
        }
        
        textField.delegate = self
        textField.frame = CGRect(x: eighthWidth, y: textFieldY, width: textFieldWidth, height: textFieldHeight)
        view.addSubview(textField); textFieldDisplayed = true
        textField.becomeFirstResponder()
    }
}

