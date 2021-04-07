//
//  VideoCell.swift
//  Soulwise
//
//  Created by apple on 06/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class VideoCell: CVBaseCell {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var launchButton: UIButton!
   
    override func layoutSubviews() {
        super.layoutSubviews()
        containerViewWidth.constant = UIScreen.listAllowedWidth() - 32
    }
    
    override func bindData(data: CVCellData) {
        if let model = data.model as? VideosItemViewModel {
            header.text = model.title
        }
    }
    
    @IBAction func launchButtonAction(_ sender:UIButton) {
        notifyActionHandler(.launchVideo)
    }
    
}
