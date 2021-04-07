//
//  FeedsHeaderCell.swift
//  Soulwise
//
//  Created by apple on 02/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class FeedsHeaderCell: TBCell {

    @IBOutlet weak var containerVieweWidth: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var closeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        containerView.dropShadow()
    }
    
    override func bindDataInternal(data: TBRowData) {
        header.text = data.title
        if let hide = data.hideHeaderIcon {
            closeButton.isHidden = hide
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerVieweWidth.constant =  UIScreen.listAllowedWidth() - 32
    }
    
    @IBAction func closeButtonAction (_ sender:UIButton){
        
    }
}
