import UIKit // ReturnCell.swift    ･     spreadsheet-boilerplate-app     ･     created by Garth Snyder

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let row = indexPath.row; let col = indexPath.section
        let layout = customFlowLayout!
        
        if row == 0 && col == layout.cols - 1 {
            return registerRightCell(collectionView, at: indexPath)
        }
        else {
            return registerCenterCell(collectionView, at: indexPath)
        }
    }
    
    
    func registerCenterCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> CenterAlignedCell {
        collectionView.register(CenterAlignedCell.self, forCellWithReuseIdentifier: CenterAlignedCell.reuseIdentifier)
        var centerCell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                CenterAlignedCell.reuseIdentifier, for: indexPath) as! CenterAlignedCell
        centerCell = centerCellSetup(cell: centerCell, indexPath: indexPath)
        return centerCell
    }
    
    
    func registerRightCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> RightAlignedCell {
        collectionView.register(RightAlignedCell.self, forCellWithReuseIdentifier: RightAlignedCell.reuseIdentifier)
        var rightCell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                            RightAlignedCell.reuseIdentifier, for: indexPath) as! RightAlignedCell
        rightCell = rightCellSetup(rightCell, indexPath: indexPath, layout: customFlowLayout!)
        return rightCell
    }
    
    /*
     
     func registerCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> CustomCell {
     collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
     var cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
     cell = multiLineCellSetup(cell: cell, indexPath: indexPath)
     //cell.layer.cornerRadius = indexPath.row >= customFlowLayout!.lockedHeaderRows ? 4 : 0
     return cell
     }
     
     func registerLeftCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> LeftAlignedCell {
     collectionView.register(LeftAlignedCell.self, forCellWithReuseIdentifier: LeftAlignedCell.reuseIdentifier)
     var leftCell = collectionView.dequeueReusableCell(withReuseIdentifier: LeftAlignedCell.reuseIdentifier, for: indexPath) as! LeftAlignedCell
     leftCell = rightCellSetup(cell: leftCell, indexPath: indexPath) /// write a left equivalent of this method
     return leftCell
     }
     
     */
}

