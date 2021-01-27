import UIKit // Sizes.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CustomFlowLayout {
    override var collectionViewContentSize: CGSize {                            //print("size = \(contentSize)")
        let w = CGFloat(cols) * widthPlusSpace
        let h = CGFloat(rows) * heightPlusSpace - 33 // without - 33, iPhone 12 series devices' height (h) is 33 points too large
        return CGSize(width: w, height: h)
    }
    
    func calculateSizes() -> (CGFloat, CGFloat) {                               //print("resizing cells")
        var cellWd = CGFloat(0); var cellHt = CGFloat(0)
        navBarHeight = Double((navController?.navigationBar.frame.height)!)     //; print("nav bar: \(navBarHeight)")
        statusBarHeight = Double((globalWindow.windowScene?.statusBarManager!.statusBarFrame)!.height)
        
        var frame: CGRect
        if embeddedInNavController {
            frame = globalWindow.frame
        } else {
            if let safeFrame = customFrame {
                frame = safeFrame
            } else {
                frame = zeroFrame ; print("\ncell sizing error: nil-frame used to size cells; collection view has \(rows) rows")
            } ///* default frame is overridden anyway, hence initialization with all 0's
        }
        
        let bottomGap = CGFloat(1) /// extra gap for aesthetics/testing
        let barsHeight = embeddedInNavController ? navBarHeight + statusBarHeight : 0
        
        let autofitWidth = frame.width / CGFloat(cols) - hSpace
        let h = frame.height - keyboardHeight - keyboardToolbarHeight - bottomGap
        let autoFitHeight = (h - CGFloat(barsHeight)) / CGFloat(rows) - vSpace
        
        switch cellDimensionsMode {
        case .widthAndHeightHardcoded:  cellWd = cellWidth!;                        cellHt = cellHeight!
        case .widthHardcoded:           cellWd = cellWidth!;                        cellHt = autoFitHeight * autoFitHeightScale!
        case .heightHardcoded:          cellWd = autofitWidth * autoFitWScale!;     cellHt = cellHeight!
        case .noHardcoding:             cellWd = autofitWidth * autoFitWScale!;     cellHt = autoFitHeight * autoFitHeightScale!
        }
        return (cellWd, cellHt)
    }
}

