//
//  CompaniesItemViewModel.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class CompaniesItemViewModel {
    var itemdata:CompaniesModel?
    
    lazy var title:String = {
        return itemdata?.name ?? ""
    }()
    
    lazy var address:String = {
        if let address = itemdata?.address, let city = itemdata?.city  {
            return "\(address), \(city)"
        }
        return ""
    }()
    
    lazy var isLiked:Bool = {
        return itemdata?.isLiked ?? false
    }()
    
    func displaySections() -> TBSection {
        let rowData = TBRowData.init()
        rowData.model = self
        let itemRow = TBRow.init(.companiesTbCell, rowData)
        return TBSection.init(nil, [itemRow])
    }
    
    init(_ model:CompaniesModel) {
        itemdata = model
    }
}
