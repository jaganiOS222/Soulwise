//
//  MeditationCell.swift
//  Soulwise
//
//  Created by apple on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class MeditationCell: TBCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerWidth: NSLayoutConstraint!
    @IBOutlet weak var timeLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.dropShadow(radius: 4, opacity: 0.3)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerWidth.constant = UIScreen.listAllowedWidth() - 32
    }
    
    override func bindData(data: TBRowData) {
        if let model = data.model as? FeedsItemViewModel {
            header.text = model.title
            timeLabel.text = model.createTime
            iconView.image = UIImage(named: model.image)
        }
    }
    
    
}
