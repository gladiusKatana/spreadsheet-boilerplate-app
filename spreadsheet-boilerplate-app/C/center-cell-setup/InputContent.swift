import UIKit // InputContent.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    func setContentsBasedOnInput(_ cell: CenterAlignedCell, row: Int, column: Int) {
        
        if column == cellSetIndexPath[0] && row > cellSetIndexPath[1]
            && cellSetIndexPath != defaultPathOutOfView {
            
            if let values = dataAtIndexPath[CellStruct(values:(column, row - 1))] {
                representAsDoubleWithCommas("\(values.last!)", addingToDataModel: true, cell: cell, row: row, column: column)
                cellSetIndexPath = [column,row]
            }
            
            //else {cell.titleLabel.text = "..."}
        }
        
        else {
            
            if let values = dataAtIndexPath[CellStruct(values:(column, row))], values.count > 0 {
                representAsDoubleWithCommas("\(values.last!)", addingToDataModel: false, cell: cell, row: row, column: column)
            }
        }
        
        if row == customFlowLayout!.rows - 1 && column == columnsForDataEntry.last {
            cellSetIndexPath = defaultPathOutOfView //; print("index path of cell selected: \(cellSetIndexPath)")
        }
    }
    
    func representAsDoubleWithCommas(_ dataString: String, addingToDataModel: Bool,
                                     cell: CenterAlignedCell, row: Int, column: Int) {
        
        if let doubleData = Double(dataString) {
            let txt = "\(doubleData.doubleRepresentedWithCommas() ?? "")"
            if addingToDataModel {
                addDataAtCell(withColumn: column, withRow: row, textEntered: dataString, appendable: false)
            }
            cell.titleLabel.text = txt
        }
    }
}

