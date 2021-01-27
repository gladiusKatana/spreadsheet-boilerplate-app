import UIKit // ResetSizes.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

extension CustomFlowLayout {
    
    func calculateAndResetSizes() {
        (cellWidth, cellHeight) = calculateSizes()
        resetDimensionIfSquareCellsEnabled()
        
        widthPlusSpace = cellWidth! + hSpace;       heightPlusSpace = cellHeight! + vSpace
        currentCellWidth = cellWidth;               currentCellHeight = cellHeight
        
        ///let portraitStatusBarHeight = modelName.contains("iPhone11,") || modelName.contains("iPhone12,") ? CGFloat(48) : CGFloat(20) /// check if there are other sizes
        
        let statusBarDelta = 0.0
        
        //        let statusBarTestHeight = (globalWindow.windowScene?.statusBarManager!.statusBarFrame)!.height
        //        if statusBarTestHeight > portraitStatusBarHeight {
        //            statusBarDelta = Double(statusBarTestHeight - portraitStatusBarHeight)
        //        }
        
        adjustForNavigationAndStatusBars(forCollectionVC: topVC, withDelta: statusBarDelta)
    }
    
}

