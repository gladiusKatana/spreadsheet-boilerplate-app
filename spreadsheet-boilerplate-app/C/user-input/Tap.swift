import UIKit // Tap.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) { //print("tapped cell")
        
        let layout = customFlowLayout!
        let row = indexPath.item
        let column = indexPath.section
        
        if row >= layout.lockedHeaderRows && (1...3).contains(column) {
            
            let cell = collectionView.cellForItem(at: indexPath) as! BaseCell
            
            selectedIndexPath = [column, row]               //; print("selected index path \(selectedIndexPath)")
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                cell.backgroundColor = tappedCellColor
            }
            
            textField.placeholder = "Add data to cell [\(column),\(row)]"
            
            if textFieldDisplayed {
                presentTextFieldAndReload(after: 0, forDataAtRow: nil)
            }
            else {
                presentTextFieldAndReload(after: 0.05, forDataAtRow: nil)
            }
            
        }
    }
}

