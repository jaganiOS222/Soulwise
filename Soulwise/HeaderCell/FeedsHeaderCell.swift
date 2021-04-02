//
//  FeedsHeaderCell.swift
//  Soulwise
//
//  Created by apple on 02/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class FeedsHeaderCell: TBCell {

    @IBOutlet weak var titleWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        contentView.dropShadow()
    }
    
    override func bindDataInternal(data: TBRowData) {
        header.text = data.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleWidth.constant =  UIScreen.listAllowedWidth() - 32
    }
}
