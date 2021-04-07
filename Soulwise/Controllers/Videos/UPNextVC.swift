//
//  UPNextVC.swift
//  Soulwise
//
//  Created by apple on 07/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class UPNextVC: TBController {
   
    let pillowService:PillowService = PillowService.init()
    var upNextViewModel:UPNextViewModel? {
        didSet {
            if let model = upNextViewModel {
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
                 TBCellTypes.transcriptCell,
                 TBCellTypes.transriptHeaderCell
        ]
    }
    
    func loadData() {
        pillowService.execute { (result) in
            if result.isSuccess {
                if let pillows = result.value as? [PillowModel] {
                    self.upNextViewModel = UPNextViewModel.init(pillows)
                }
            }
        }
    }
}
