import UIKit // DataVars.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

var dataAtIndexPath = Dictionary<CellStruct<Int,Int>,[String]>() /// Dictionary keyed by 2-tuple (index path)

///financial planning variables

var currentMonthRow = 2
var monthlyIncome = 0.0
var monthlyExpenses = 0.0

let headerTitles = ["Month","Income","Expenses","Payments","Net","Balance"]


///adding data to cells

var columnsForDataEntry = [1,2,3] // income, expenses, payments
var columnsForValuesCalculated = [4,5] // net, balance

var defaultPathOutOfView = [-1, -1]
var selectedIndexPath = defaultPathOutOfView
var cellSetIndexPath = defaultPathOutOfView


///saving components of each data point (value) via separate KeychainWrapper arrays

///(*rewrite to save whole dictionary to KeychainWrapper?)

var savedDataIndexPaths = [[Int]]() /// index paths where data were added & saved

var savedDataStringArrays = [[String]]()

var keychainStrings =
    [
        "keychainCellPaths",
        "keychainDataDescriptionArrays",
        "savedLastLoginDate"
    ]

