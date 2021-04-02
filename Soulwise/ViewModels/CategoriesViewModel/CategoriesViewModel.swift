//
//  CategoriesModel.swift
//  Soulwise
//
//  Created by apple on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class CategoriesViewModel {
    var itemsModel:[CategoriesItemViewModel] = []
    init(_ products:[ProductsModel]) {
        products.forEach({
            itemsModel.append(CategoriesItemViewModel.init($0))
        })
    }
    
    func display() -> [CVSection] {
        var rows:[CVRow] = []
        itemsModel.forEach({
            rows.append($0.display())
        })
        
        return [CVSection.init(nil, rows)]
    }
}
