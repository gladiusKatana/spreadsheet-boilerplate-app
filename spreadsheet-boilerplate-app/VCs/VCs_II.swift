import UIKit // VCs_II.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

var secondLayout =
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

var secondVC = CollectionVC(.secondVCType, populateStockCellData: true, backgroundColor: globalWindow.backgroundColor!, alternatingColors: true, buttonColorIndex: 0, collectionViewLayout: secondLayout)

enum CollectionViewType: Int {
    
    case initial = 0
    case firstVCType, secondVCType
    
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

