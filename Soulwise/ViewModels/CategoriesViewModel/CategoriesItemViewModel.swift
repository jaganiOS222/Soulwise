//
//  CategoriesItemViewModel.swift
//  Soulwise
//
//  Created by apple on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class CategoriesItemViewModel: ProductsItemViewModel {
    
    override func display() -> CVSection {
        let rowData = CVCellData.init()
        rowData.model = self
        let itemRow = CVRow.init(.categoriesCell, rowData)
        return CVSection.init(nil, [itemRow])
    }
    
}
