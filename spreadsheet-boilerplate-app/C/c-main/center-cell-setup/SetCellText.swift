import UIKit // SetCellText.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    func setCellText(_ cell: CenterAlignedCell, layout: CustomFlowLayout,
                     row: Int, column: Int, headerRows: Int, headerColumns: Int) {
        
        if row < headerRows || column < headerColumns {/// if cell is a header (header = column or row depending on view controller global var settings)
            
            //cell.titleLabel.text = "\(column),\(row)"
            cell.titleLabel.textColor = headerTextColor
            
            if row == headerRows - 1 {
                cell.titleLabel.text = column < headerTitles.count ? headerTitles[column] : ""
            }
            
            if row >= headerRows && column == 0 {
                setCellMonthString(cell, row: row)
            }
            
        } else {
            
            if columnsForDataEntry.contains(column) {
                setContentsBasedOnInput(cell, row: row, column: column)
            }
            
            if columnsForValuesCalculated.contains(column) {                //print("should calculate cell \(column),\(row)")
                calculateValues(cell, row: row, column: column)
            }
        }
    }
    
    func setCellMonthString(_ cell: CenterAlignedCell, row: Int) {
        
        var thisMonth = Calendar.current.component(.month, from: Date()) + row - customFlowLayout!.lockedHeaderRows
        if thisMonth > 12 {thisMonth -= 12}
        cell.titleLabel.text = "\(months[thisMonth-1])"
    }
}

