//
//  HomeVC.swift
//  Soulwise
//
//  Created by apple on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class FeedsVC:TBController {
    let feedsService = FeedsService.init()
    
    var feedsViewModel:FeedsViewModel? {
        didSet {
            if let model = feedsViewModel {
                sections = model.display()
            }
        }
    }
    override func cellTypes() -> [TBCellTypes] {
           return [
               TBCellTypes.tbcell,
               TBCellTypes.feedsHeaderCell,
               TBCellTypes.meditationCell
           ]
       }
    
    override func viewDidLoad() {
           super.viewDidLoad()
           loadData()
       }
    
    func loadData() {
        feedsService.execute { [weak self] (result)  in
            if result.isSuccess {
                if let value = result.value as? FeedsModel  {
                    self?.feedsViewModel = FeedsViewModel.init(value.newsFeedList)
                }
            }
        }
    }

}
