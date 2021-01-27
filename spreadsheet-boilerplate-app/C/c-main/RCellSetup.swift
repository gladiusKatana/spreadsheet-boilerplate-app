import UIKit // RCellSetup.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

func rightCellSetup(_ cell: RightAlignedCell, indexPath: IndexPath, layout: CustomFlowLayout) -> RightAlignedCell  {
    
    let row = indexPath.row; let col = indexPath.section
    
    cell.xyCoordinate = [col, row]
    
    cell.titleLabel.numberOfLines = 1
    
    cell.titleLabel.lineBreakMode = .byCharWrapping
    
    cell.titleLabel.textColor = semiPlatinum
    
    cell.backgroundColor = headerColor; cell.cellColor = headerColor
    
    if (col, row) == (layout.cols - 1, 0) {
        cell.titleLabel.text = formattedDateString(lastLoginDate, roundDown: false, showYear: true,
                                                   prefix: " Last Login", suffix: " ", dateFormat: .fullDayShortWithMins)
    }
    
    return cell
}

