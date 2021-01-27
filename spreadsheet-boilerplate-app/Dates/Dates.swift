import UIKit // Dates.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

func makeDateFrom(year: Int, month: Int, day: Int, hr: Int, min: Int, sec: Int) -> Date {
    let calendar = Calendar(identifier: .gregorian)
    let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
    return calendar.date(from: components)!
}

func dateFromComponents(_ dateComponents: [Any]) -> Date {
    guard !(dateComponents.isEmpty) else {return makeDateFrom(year: 1970, month: 1, day: 1, hr: 0, min: 0, sec: 0)}
    let yearLoaded = dateComponents[0] as! Int                      ///; print("year loaded: \(yearLoaded)")    // will probably replace with...
    let monthLoaded = dateComponents[1] as! String                  ///; print("month loaded: \(monthLoaded)")  //...conditional downcasts,...
    let monthLoadedInt = months.firstIndex(of: monthLoaded)! + 1    ///; print("int: \(monthLoadedInt)")        //...rather than forced ones
    let dayLoaded = dateComponents[2] as! Int                       ///; print("day loaded: \(dayLoaded)")
    ///let weekdayLoaded = array[3] as! String                                           ///; print("weekday loaded: \(weekdayLoaded)")
    let hourLoaded = dateComponents[4] as! Int                      ///; print("hour loaded: \(hourLoaded)")
    let minuteLoaded = dateComponents[5] as! Int                    ///; print("minute loaded: \(minuteLoaded)")
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    
    guard let date = formatter.date(from: "\(yearLoaded)/\(monthLoadedInt)/\(dayLoaded) \(hourLoaded):\(minuteLoaded)") else {
        print("could not create date with loaded input, returning current date instead")
        return Date()
    }
    return date
}

