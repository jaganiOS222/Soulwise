//
//  TranscriptVC.swift
//  Soulwise
//
//  Created by apple on 06/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class TranscriptVC: TBController {
   
    let pillowService:PillowService = PillowService.init()
    var transcriptViewModel:TranscriptViewModel? {
        didSet {
            if let model = transcriptViewModel {
                sections = model.display()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func cellTypes() -> [TBCellTypes] {
        return [ TBCellTypes.tbcell,
                 TBCellTypes.transcriptCell
        ]
    }
    
    func loadData() {
        pillowService.execute { (result) in
            if result.isSuccess {
                if let pillows = result.value as? [PillowModel] {
                    self.transcriptViewModel = TranscriptViewModel.init(pillows)
                }
            }
        }
    }
}


