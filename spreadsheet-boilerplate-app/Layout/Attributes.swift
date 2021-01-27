import UIKit // Attributes.swift    ･     spreadsheet-boilerplate     ･     created by Garth Snyder

extension CustomFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var attributesForElements = [UICollectionViewLayoutAttributes]()
        
        for j in 0 ..< cols {
            for i in 0 ..< rows {
                
                let ip = loadsHorizontally ? IndexPath(item: j, section: i) : IndexPath(item: i, section: j) /// for transposing cells
                let attribute = UICollectionViewLayoutAttributes(forCellWith: ip) //= self.layoutAttributesForItem(at: ip)!
                
                let xDefault = CGFloat(j) * widthPlusSpace
                let regularRows = CGFloat(rows - lockedHeaderRows)
                let one = CGFloat(1)
                
                var xO = CGFloat(0);    var yO = CGFloat(0)
                var scalar = CGFloat(0)
                
                headerHeightFactor = 1
                /*textFieldDisplayed && currentOrientation == .landscape
                 && !([.heightHardcoded, .widthAndHeightHardcoded].contains(cellDimensionsMode))
                 ? 1
                 : 0.5*/
                
                let cellHeightIncrease = (one - headerHeightFactor) * CGFloat(lockedHeaderRows) / regularRows
                
                if j < lockedHeaderSections {
                    let wdth = hideGapsInHeaders ? cellWidth! : widthPlusSpace
                    if !embeddedInNavController {
                        let exOffset = popupCollectionVC.collectionView!.contentOffset.x
                        xO = CGFloat(j) * wdth + exOffset
                    } else {
                        xO = CGFloat(j) * wdth + xOffSet
                    }
                } else {
                    xO = xDefault
                }
                
                if i < lockedHeaderRows {
                    let hght = hideGapsInHeaders ? cellHeight! : heightPlusSpace
                    if !embeddedInNavController {
                        let wyeOffset = popupCollectionVC.collectionView!.contentOffset.y
                        yO = CGFloat(i) * hght * headerHeightFactor + wyeOffset
                    } else {
                        yO = CGFloat(i) * hght * headerHeightFactor + yOffset
                    }
                    scalar = headerHeightFactor
                } else {
                    cellHeightFactor = one + cellHeightIncrease
                    
                    let conditionalYOffset = !embeddedInNavController ? yOffset : 0
                    let headerDelta = CGFloat(lockedHeaderRows) * heightPlusSpace * headerHeightFactor + conditionalYOffset
                    let y = headerDelta + CGFloat(i - lockedHeaderRows) * heightPlusSpace * cellHeightFactor
                    yO = y
                    scalar = cellHeightFactor
                }
                
                var hght = cellHeight!; var wdth = cellWidth!
                
                if hideGapsInHeaders { ///'closing the gaps'
                    if j < lockedHeaderSections || i < lockedHeaderRows {
                        hght = heightPlusSpace
                        wdth = widthPlusSpace
                    }
                    ///'closing the gaps' under and to the right of intersection of header rows & header columns
                    if j == lockedHeaderSections - 1    {wdth = widthPlusSpace + gap * CGFloat(lockedHeaderSections)}
                    if i == lockedHeaderRows - 1        {hght = heightPlusSpace + gap * CGFloat(lockedHeaderRows)}
                }
                
                attribute.frame = CGRect(x: xO, y: yO, width: wdth, height: hght * scalar)
                setZIndex(row: i, section: j, cellAttributes: attribute)
                attributesForElements.append(attribute)
            }
        }
        
        return attributesForElements
    }
}

