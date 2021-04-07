//
//  TranscriptCell.swift
//  Soulwise
//
//  Created by apple on 07/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class TranscriptCell: TBCell {
    @IBOutlet weak var currentView:UIView!
    @IBOutlet weak var timeLabel:UILabel!
    
    override func bindData(data: TBRowData) {
        if let model = data.model as? TranscriptItemViewModel {
            currentView.backgroundColor = .white
            header.text = model.title
            timeLabel.text = model.time
           
        }
    }
    
}
