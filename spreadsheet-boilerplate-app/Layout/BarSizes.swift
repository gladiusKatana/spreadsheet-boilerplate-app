import UIKit // BarSizes.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CustomFlowLayout {
    
    func adjustForNavigationAndStatusBars(forCollectionVC collectVC: UICollectionViewController, withDelta delta: Double) {
        
        
        xOffSet = collectVC.collectionView!.contentOffset.x
        
        //print("x offset: \(xOffSet)")
        
        
        yOffset = topVC.collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - delta)
        
        //print("y offset: \(yOffSet)")
        
        
        // text field shows just above keyboard:
        textFieldY = globalWindow.frame.height - keyboardHeight - keyboardToolbarHeight
        
    }
    
}

