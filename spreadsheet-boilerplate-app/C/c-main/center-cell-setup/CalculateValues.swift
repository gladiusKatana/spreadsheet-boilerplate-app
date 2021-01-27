import UIKit // CalculateValues.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    func calculateValues(_ cell: CenterAlignedCell, row: Int, column: Int) {
        
        var result = 0.0
        let headers = (customFlowLayout?.lockedHeaderRows)!
        
        if column == headerTitles.firstIndex(of: "Net"),
           row >= headers {
            
            let incExpPmt = cellLookup(from: [(1,row),(2,row),(3,row)]) // array of Doubles  1=income, 2=expenses, 3=payments
            
            let (income,expenses,payments)
                = (incExpPmt[0],incExpPmt[1],incExpPmt[2])
            
            let net = income - expenses - payments                      ///; print("net = \(net)")
            result = net
            
            let previousValue = row <= headers ? 0 : balanceSums[row - headers - 1]
            let runningSum = net + previousValue
            
            if balanceSums.count <= customFlowLayout!.rows - headers - 1 {
                balanceSums.append(runningSum)          ///; print("balance sums: \(balanceSums)") ///; print("appending \(runningSum) to balance sums")
            }
        }
        
        else if column == headerTitles.firstIndex(of: "Balance") {
            
            if (0...balanceSums.count - 1 + headers).contains(row) {
                result = balanceSums[row - headers]                     //print("cell \(row) should read \(result)")
            }
        }
        
        formatAndSetTitleLabel(result, cell: cell)
    }
    
    func formatAndSetTitleLabel(_ result: Double, cell: CenterAlignedCell) {
        let formattedDoubleString = result.doubleRepresentedWithCommas()
        cell.titleLabel.text = formattedDoubleString != nil ? formattedDoubleString : "-"
    }
}

