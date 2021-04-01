//
//  ProductsVC.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ProductsVC: WLCollectionController {
    let productService = ProductService.init()
    var productsViewModel:ProductsViewModel? {
        didSet {
            if let model = productsViewModel {
                sections = model.display()
            }
        }
    }
    
    override func cellTypes() -> [CVCellType] {
        return [
            CVCellType.cvBaseCell,
            CVCellType.itemsCVCell
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
                    self?.productsViewModel = ProductsViewModel.init(value)
                }
            }
        }
    }
    
    
}
