//
//  WLCollectionController.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class WLCollectionController: UIViewController {
    static let spacing:CGFloat = 10.0
    @IBOutlet var collectionView: UICollectionView?
    
    var sections: [CVSection] = [] {
        didSet {
            if let collection = collectionView {
                collection.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func cellTypes() -> [CVCellType] {
        return [CVCellType.cvBaseCell]
    }
    
    func onSelect(row info:CVRow, indexPath:IndexPath) {}
    
    internal func registerHeadersIfRequired(collectionView: UICollectionView) { }
    
    func onLoadInternal() { }
    
    internal func setupCollectionView() {
        if let collection = collectionView {
            collection.register(cellTypes())
            collection.dataSource = self
            collection.delegate = self
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: WLCollectionController.spacing, left: WLCollectionController.spacing, bottom: 0, right: WLCollectionController.spacing)
            collection.collectionViewLayout = layout
        }
        onLoadInternal()
    }
}

extension WLCollectionController:UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let rows = sections[section].rows
        return rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = sections[indexPath.section]
        let cellInfo = section.rows[indexPath.row]
        let cellType = cellInfo.type
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:cellType!.rawValue , for: indexPath) as! CVBaseCell
        if let data = cellInfo.data {
            cell.bindData(data: data)
        }
        return cell
    }
}

extension WLCollectionController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        let row = section.rows[indexPath.row]
        onSelect(row: row, indexPath: indexPath)
    }
}

extension WLCollectionController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.listAllowedWidth() - 20, height: 300)
    }
    
}
