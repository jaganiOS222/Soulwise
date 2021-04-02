//
//  FeedsViewModel.swift
//  Soulwise
//
//  Created by apple on 02/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class FeedsViewModel {
    var itemsViewModel:[FeedsItemViewModel] = []
    
    init(_ list:[NewsFeedList]) {
        list.forEach({
            itemsViewModel.append(FeedsItemViewModel.init($0))
        })
    }
    
    func display() -> [TBSection] {
        
        return self.sectionsData()
    }
    
    func headerRow(_ title:String) -> TBRow? {
        let rowData = TBRowData.init()
        rowData.title = title
        let headerRow = TBRow.init(.feedsHeaderCell, rowData)
        return headerRow
    }
    
    func sectionsData() ->[TBSection] {
        var sections: [TBSection] = []
        var titles:[String] = []
        
        itemsViewModel.forEach({
            if !titles.contains($0.type) {
                titles.append($0.type)
            }
        })
        titles.forEach({
            sections.append(addingSection($0))
        })
        return sections
    }
    
    func addingSection(_ type:String) -> TBSection {
        let section = TBSection.init(nil, [])
        itemsViewModel.forEach({
            if type == $0.type {
                if let tbRows = $0.display() {
                    section.rows.append(contentsOf: tbRows)
                }
            }
        })
        if let header = self.headerRow(type) {
            if section.rows.count > 0 {
                section.rows.insert(header, at: 0)
            }
        }
        return section
    }
}
