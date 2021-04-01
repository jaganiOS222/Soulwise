//
//  CompaniesTBCell.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class CompaniesTBCell: TBCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerWidth: NSLayoutConstraint!
    @IBOutlet weak var favButton:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.dropShadow(radius: 4, opacity: 0.3)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerWidth.constant = UIScreen.listAllowedWidth() - 32
    }
    
    override func bindData(data: TBRowData) {
        if let model = data.model as? CompaniesItemViewModel {
            header.text = model.title
            subHeader.text = model.address
            let image:String = model.isLiked ? "heart.fill":"heart"
            favButton.setImage(UIImage(imageLiteralResourceName: image), for: .normal)
        }
    }
    
    @IBAction func favBtnAction(_ sender:UIButton) {
        notifyActionHandler(.favBtnAction)
    }
}
