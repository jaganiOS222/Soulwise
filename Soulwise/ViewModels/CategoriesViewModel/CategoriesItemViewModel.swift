//
//  CategoriesItemViewModel.swift
//  Soulwise
//
//  Created by apple on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class CategoriesItemViewModel {
    var productsModel:ProductsModel?
    
    lazy var name:String = {
        return productsModel?.name ?? ""
    }()
    
    lazy var price:Float = {
        return productsModel?.price ?? 0.0
    }()
    
    lazy var productImg:String = {
        return productsModel?.productImg ?? ""
    }()
    
    lazy var description:String = {
        return productsModel?.description ?? ""
    }()
    
    lazy var slug:String = {
        return productsModel?.slug ?? ""
    }()
    
    init(_ model:ProductsModel) {
        self.productsModel = model
    }
    
    func display() -> CVRow {
        let rowData = CVCellData.init()
        rowData.model = self
        let itemRow = CVRow.init(.categoriesCell, rowData)
        return itemRow
    }
}
