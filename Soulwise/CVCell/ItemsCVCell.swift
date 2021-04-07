//
//  ItemsCVCell.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ItemsCVCell: CVBaseCell {
    @IBOutlet weak var priceLabel:UILabel!
    @IBOutlet weak var noteLabel:UILabel!
    
    
    override func bindData(data: CVCellData) {
        if let model = data.model as? ProductsItemViewModel {
            iconView.image = UIImage(named: model.productImg)
            header.text = model.name
            priceLabel.text = "₹ \(model.price)"
            subHeader.text = model.description
            noteLabel.text = model.slug
        }
    }
}
