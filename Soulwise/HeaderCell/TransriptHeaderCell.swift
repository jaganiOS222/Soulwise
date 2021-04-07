//
//  TransriptHeaderCell.swift
//  Soulwise
//
//  Created by apple on 06/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class TransriptHeaderCell: TBCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        containerView.dropShadow(radius: 4, opacity: 0.3)
        
    }
    
    override func bindDataInternal(data: TBRowData) {
        header.text = data.title
        if let hide = data.hideHeaderIcon {
            closeButton.isHidden = hide
        }
    }
    
    
    @IBAction func closeButtonAction (_ sender:UIButton){
        notifyActionHandler(.closeAction)
    }
}
