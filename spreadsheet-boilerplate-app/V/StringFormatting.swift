import UIKit // StringFormatting.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder


extension Double {
    
    func doubleRepresentedWithCommas() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedDoubleString = numberFormatter.string(from: NSNumber(value: self))
        return formattedDoubleString
    }
    
}

