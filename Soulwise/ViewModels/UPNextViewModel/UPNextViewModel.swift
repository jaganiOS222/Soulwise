//
//  UPNextViewModel.swift
//  Soulwise
//
//  Created by apple on 07/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class UPNextViewModel: TranscriptViewModel {
   override func display() -> [TBSection] {
           var sections: [TBSection] = []
           let headerdata = TBRowData.init()
           headerdata.hideHeaderIcon  = false
           headerdata.title = "Up Next"
           let row = TBRow.init(.transriptHeaderCell, headerdata)
           sections.append(TBSection.init(nil, [row]))
           var rows:[TBRow] = []

           transcriptItemViewModel.forEach({
               rows.append($0.display())
           })
           let secondSection = TBSection.init(nil, rows)
           sections.append(secondSection)
           return sections
       }
}
