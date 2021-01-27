import UIKit // Layout.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

class CustomFlowLayout : UICollectionViewFlowLayout {
    var customFrame: CGRect?;               var cols = 0;   var rows = 0
    var lockedHeaderRows = 0;               var lockedHeaderSections = 0
    var cellWidth: CGFloat?;                var cellHeight: CGFloat?
    var autoFitWScale: CGFloat?;            var autoFitHeightScale: CGFloat?
    var hSpace = CGFloat(0);                var vSpace = CGFloat(0)
    var xDefault = CGFloat(0);              var yDefault = CGFloat(0)
    var widthPlusSpace = CGFloat(0);        var heightPlusSpace = CGFloat(0)
    var squareCellMode : SquareCellMode;    var squareCells = false
    var embeddedInNavController = false;    var loadsHorizontally = false
    var cellDimensionsMode = CellDimensionsMode.noHardcoding
    
    init(embeddedInNavController: Bool, customFrame: CGRect?, rows: Int, cols: Int,
         lockedHeaderRows: Int, lockedHeaderSections: Int,
         cellWidth: CGFloat?, cellHeight: CGFloat?,
         autoFitWScale: CGFloat?, autoFitHScale: CGFloat?,
         hSpace: CGFloat, vSpace: CGFloat, squareCellMode: SquareCellMode, loadsHorizontally: Bool) {
        
        self.embeddedInNavController = embeddedInNavController
        self.customFrame = customFrame
        if !loadsHorizontally {self.rows = rows;    self.cols = cols}
        else {                 self.rows = cols;    self.cols = rows}
        
        self.lockedHeaderRows = lockedHeaderRows;   self.lockedHeaderSections = lockedHeaderSections
        self.cellWidth = cellWidth;                 self.cellHeight = cellHeight
        self.autoFitHeightScale = (autoFitHScale != nil) ? autoFitHScale : 1
        self.autoFitWScale = (autoFitWScale != nil) ? autoFitWScale : 1
        self.hSpace = hSpace;                       self.vSpace = vSpace
        self.squareCellMode = squareCellMode;       self.loadsHorizontally = loadsHorizontally
        super.init()
        
        if cellWidth != nil && cellHeight != nil {cellDimensionsMode = .widthAndHeightHardcoded}
        else if cellWidth == nil && cellHeight != nil {cellDimensionsMode = .heightHardcoded}
        else if cellWidth != nil && cellHeight == nil {cellDimensionsMode = .widthHardcoded}
        else    {cellDimensionsMode = .noHardcoding} //; print(cellDimensionsMode.simpleDescription())
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {return true}
    override func invalidateLayout() {super.invalidateLayout()}
}

