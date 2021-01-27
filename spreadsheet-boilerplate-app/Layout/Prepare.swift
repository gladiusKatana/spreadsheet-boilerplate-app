import UIKit // Prepare.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

extension CustomFlowLayout {
    
    override func prepare() {                                       //print("🄿", terminator: "")
        
        checkOrientation()
        resetKeyboardHeight()
        calculateAndResetSizes()
        
        if !modelName.contains("iPad Mini 4") { /// or  if !modelName.contains("iPad")  ?  (test)
            
            if previousOrientation != currentOrientation {          //print("prepare(rotated to \(currentOrientation)):")
                
                previousOrientation = currentOrientation
                
                //if !modelName.contains("iPad") {
                
                topVC.setupTitleAndPresentViewController(vc: topVC) { () -> () in
                    ///reloadLock = false
                    ///topVC.reloadCV()     /// only really useful for cell font size readjustment upon rotations / other scaling changes
                }
            }
        }
        
        if textFieldDisplayed {
            topVC.rePresentTextField()
        }
        
        drawTestSquare()  /// for verifying dynamic calculation of navbar height + status bar height, and thus, cell heights
    }
    
}

