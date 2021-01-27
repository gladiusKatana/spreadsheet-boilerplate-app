import UIKit // VCs_II.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

var debtVCLayout =
    CustomFlowLayout(
        embeddedInNavController: true,
        customFrame: nil,
        rows: rowsPerScreen, cols: 8,
        lockedHeaderRows: 2, lockedHeaderSections: 1,
        cellWidth: 100, cellHeight: 75,
        autoFitWScale: 1, autoFitHScale: 1,
        hSpace: gap, vSpace: gap,
        squareCellMode: .noAutoSquare,
        loadsHorizontally: false)

var debtVC = CollectionVC(.secondVCType, backgroundColor: globalWindow.backgroundColor!,
                                      buttonColorIndex: 0, collectionViewLayout: debtVCLayout)

enum CollectionViewType: Int {
    
    case initial = 0
    case firstVCType, secondVCType  // give these names soon, these case names are for spreadsheet-boilerplate codebase
    
    func simpleDescription() -> String {
        
        switch self {
        
        case .initial:
            return "initial value to satisfy initializer of global collection view controller 'topVC'"
            
        case .firstVCType:
            return "first view controller"
            
        case .secondVCType:
            return "second view controller"
        }
    }
}

