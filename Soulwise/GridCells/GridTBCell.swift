//
//  GridTBCell.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class GridTBCell: TBCell {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(supportedCellTypes())
        }
    }
    
    private var gridInfo: TBGridRow? {
        didSet {
            if let gridInfo = gridInfo {
                prepareGridRows(with: gridInfo.gridItems)
            }
        }
    }
    
    class func gridVerticalPadding() -> CGFloat {
        return 42.0
    }
    
    class func gridLineSpacing() -> CGFloat {
        return 10.0
    }
    
    func supportedCellTypes() -> [CVCellType] {
        return [
            .cvBaseCell,
        ]
    }
    
    private var collectionRows: [CVRow] = [] {
        didSet {
            collectionView.reloadData()
            collectionView.layoutIfNeeded()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame.size.width = UIScreen.listAllowedWidth()
        contentView.frame.origin.x = bounds.midX - contentView.frame.size.width/2
        collectionView.reloadData()
        
    }
    
    override func prepareForReuse() { resetDataSource() }
    
    override func bindData(data: TBRowData) {
        if let data = data as? TBGridRow {
            collectionView.delegate = self
            collectionView.dataSource = self
            gridInfo = data
        }
    }
    
    func resetDataSource() {
        collectionView.delegate = nil
        collectionView.dataSource = nil
    }
    
    private func prepareGridRows(with arr:[TBGridItem]) {
        var gridItems: [CVRow] = []
        for info in arr {
            let cellData = CVCellData.init()
            cellData.title = info.displayTitle
            cellData.icon = info.icon
            cellData.other = info
            let cell = CVRow.init(info.itemType, cellData)
            gridItems.append(cell)
        }
        collectionRows = gridItems
        
    }
    
    override func customize() {
        super.customize()
        collectionView.backgroundColor = UIColor.clear
    }
}

extension GridTBCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return collectionRows.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellInfo = collectionRows[indexPath.row]
        let cellType = cellInfo.type
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:cellType!.rawValue , for: indexPath) as! CVBaseCell
        
        if let data = cellInfo.data {
            cell.bindData(data: data)
            cell.isHighlighted = data.isHighlighted
            cell.changeHandler = { [weak self]
                (value) in
                if let gridItem = data.other as? TBGridItem {
                    gridItem.isHighlighted = value as! Bool
                    self?.notifyStateChange()
                }
            }
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let info = gridInfo {
            let cellWidth = collectionView.bounds.size.width/CGFloat(info.columns)
            return CGSize.init(width: cellWidth - 5.0, height: CGFloat(info.height))
        }
        
        return CGSize.zero
    }
}
