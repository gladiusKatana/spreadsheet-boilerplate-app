import UIKit // PryntDates.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder


func pryntLastLoginDate() {
    pryntDate(lastLoginDate, prefix: "last login              ")
}


func pryntCurrentDate() {
    pryntDate(Date(), prefix: "date right now          ")
}


func pryntDate(_ date: Date, prefix: String) {
    print(formattedDateString(date, roundDown: false, showYear: true, prefix: prefix, suffix: "", dateFormat: .fullDay))
}

