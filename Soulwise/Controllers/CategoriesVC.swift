//
//  CategoriesVC.swift
//  Soulwise
//
//  Created by apple on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class CategoriesVC: WLCollectionController {
    let productService = ProductService.init()
    var categoriesViewModel:CategoriesViewModel? {
        didSet {
            if let model = categoriesViewModel {
                sections = model.display()
            }
        }
    }
    
    override func cellTypes() -> [CVCellType] {
        return [
            CVCellType.cvBaseCell,
            CVCellType.categoriesCell
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        productService.execute { [weak self](result) in
            if result.isSuccess {
                if let value = result.value as? [ProductsModel] {
                    self?.categoriesViewModel = CategoriesViewModel.init(value)
                }
            }
        }
    }
}

extension CategoriesVC {
   override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.listAllowedWidth()/4, height: UIScreen.listAllowedWidth()/4)
    }
}
