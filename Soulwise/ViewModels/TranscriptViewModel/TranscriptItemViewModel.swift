//
//  TranscriptItemViewModel.swift
//  Soulwise
//
//  Created by apple on 07/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class TranscriptItemViewModel {
    var pillow:PillowModel?
    
    lazy var title:String = {
        return pillow?.name ?? ""
    }()
    
    lazy var time:String = {
        return "\(pillow?.price ?? 0.0) min"
    }()
    
    lazy var isSelected:Bool = {
        return false
    }()
    
    init(_ pillowModel:PillowModel) {
        self.pillow = pillowModel
    }
    
    func display() -> TBRow {
        let rowData = TBRowData.init()
        rowData.model = self
        let row = TBRow.init(.transcriptCell, rowData)
        return row
    }
}
