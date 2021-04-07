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
    var searchSections:[CVSection] = []
    var sections: [CVSection] = [] {
        didSet {
            if let collection = collectionView {
                DispatchQueue.main.async {
                    collection.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadData()
    }
     func layoutSubviews() {
    }
    
    func scrollDirection() -> UICollectionView.ScrollDirection {
        return .vertical
    }
    func cellTypes() -> [CVCellType] {
        return [CVCellType.cvBaseCell]
    }
    
    func loadData() {}
    func onSelect(row info:CVRow, indexPath:IndexPath) {}
    func onChangeValue(value:Any) {}
    func onAction(action: CellAction, rowInfo: CVRow) { }

    internal func registerHeadersIfRequired(collectionView: UICollectionView) { }
    
    func onLoadInternal() { }
    
    internal func setupCollectionView() {
        if let collection = collectionView {
            collection.register(cellTypes())
            collection.dataSource = self
            collection.delegate = self
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = scrollDirection()
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
        let cvrow = section.rows[indexPath.row]
        let cellType = cvrow.type
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:cellType!.rawValue , for: indexPath) as! CVBaseCell
        if let data = cvrow.data {
            cell.bindData(data: data)
        }
        cell.actionHandler = { [weak self]
            (action) in
            self?.onAction(action: action, rowInfo: cvrow)
        }
        cell.changeHandler = { [weak self] (value) in
            self?.onChangeValue(value: value as Any)
            
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //Animation to disply cells
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
        if indexPath.section == collectionView.numberOfSections - 1 &&
            indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
        }
    }
    
}
