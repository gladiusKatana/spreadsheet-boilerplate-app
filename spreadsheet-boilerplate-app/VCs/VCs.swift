import UIKit // VCs.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

//           //*VC = view controller

var backgroundVC = UIViewController()

var topVC = CollectionVC(.initial, populateStockCellData: false, backgroundColor: UIColor.clear,
                         buttonColorIndex: nil, collectionViewLayout: incomeAndExpensesVCLayout)

var headerHeightFactor = CGFloat(1)     /// height-factors determine relative heights of header cells vs regular cells (see Attributes.swift)
var cellHeightFactor = CGFloat(1)

let gap = CGFloat(2)                    /// if nonzero, do not make this smaller than 0.5-0.6, or lines may be drawn inconsistently (also, use standard colors)
let hideGapsInHeaders = true            /// could make this a layout initializer var

var rowsPerScreen = 14

var incomeAndExpensesVCLayout =
    CustomFlowLayout(
        embeddedInNavController: true,      ///  if true, it's fullscreen (with a nav bar button to navigate to its collection view controller's view); ...
        ///                                  ... if false, it's a window with a custom frame (frame is set prior to presenting the view controller)
        customFrame: nil,                   ///  if nil, it defaults to the app's window frame (as when embeddedInNavController = true)
        rows: rowsPerScreen, cols: 6,
        lockedHeaderRows: 2, lockedHeaderSections: 1,
        cellWidth: nil, cellHeight: nil,    /// if either is nil, screen width and/or height auto-fitted (else, auto-fit scalars below ignored, ie set to 1.0)
        autoFitWScale: 1, autoFitHScale: 1, ///  if either of these parameters are nil, they default to 1.0
        hSpace: gap, vSpace: gap,           ///  gaps between the cells
        squareCellMode: .noAutoSquare,      ///  optional auto-scaling to make cells square, by specifying 1 dimension only (cellWidth or cellHeight)
        loadsHorizontally: false)           ///❗️if loadsHorizontally is true, 'rows' look like columns & vice versa (table is transposed)

var incomeAndExpensesVC = CollectionVC(.firstVCType, populateStockCellData: true, backgroundColor: globalWindow.backgroundColor!,
                                     buttonColorIndex: 1, collectionViewLayout: incomeAndExpensesVCLayout)

let zeroFrame = CGRect(x: 0, y: 0, width: 0, height: 0) /// initial value for testing

