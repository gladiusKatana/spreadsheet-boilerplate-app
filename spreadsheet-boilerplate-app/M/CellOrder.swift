import UIKit // CellOrder.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

extension CollectionVC {
    
    func cellQueueNumber(from indexPath: [Int]) -> Int {
        
        var rankInt = 0
        
        let column = indexPath[0]; let row = indexPath[1]
        let headerColumns = customFlowLayout!.lockedHeaderSections
        let headerRows = customFlowLayout!.lockedHeaderRows
        
        rankInt = (column - headerColumns) * rowsPerScreen + row - headerRows
        
        return rankInt
    }
    
}

