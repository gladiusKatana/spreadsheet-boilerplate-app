import UIKit // CtrCellSetup.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    func centerCellSetup(cell: CenterAlignedCell, indexPath: IndexPath) -> CenterAlignedCell  {
        
        let layout = customFlowLayout!
        let row = indexPath.item
        let column = indexPath.section
        let headerRows = layout.lockedHeaderRows
        let headerColumns = layout.lockedHeaderSections
        
        setCellColors(cell, layout: layout, row: row, column: column, headerRows: headerRows, headerColumns: headerColumns)
        
        setCellText(cell, layout: layout, row: row, column: column, headerRows: headerRows, headerColumns: headerColumns)
        
        return cell
    }
    
    
    func setCellColors(_ cell: CenterAlignedCell, layout: CustomFlowLayout,
                       row: Int, column: Int, headerRows: Int, headerColumns: Int) {
        
        if row < headerRows || column < headerColumns {/// if cell is a header (header = column or row depending on view controller global var settings)
            
            cell.backgroundColor = headerColor; cell.cellColor = headerColor
            
        } else {
            
            if [column,row] == selectedIndexPath {
                cell.backgroundColor = tappedCellColor
            }
            else {
                cell.backgroundColor = cellDefaultColor; cell.cellColor = cellDefaultColor
            }
        }
    }
    
}

