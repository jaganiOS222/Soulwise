//
//  CategoriesCell.swift
//  Soulwise
//
//  Created by apple on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class CategoriesCell: CVBaseCell {
    
    override func bindData(data: CVCellData) {
        if let model = data.model as? ProductsItemViewModel {
            iconView.image = UIImage(named: model.productImg)
        }
    }
}
