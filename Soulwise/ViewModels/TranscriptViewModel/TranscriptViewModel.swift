//
//  TranscriptViewModel.swift
//  Soulwise
//
//  Created by apple on 07/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class TranscriptViewModel {
    var transcriptItemViewModel:[TranscriptItemViewModel] = []
    
    init(_ pillowsModel:[PillowModel]) {
        pillowsModel.forEach({
            transcriptItemViewModel.append(TranscriptItemViewModel.init($0))
        })
    }
    
    func display() -> [TBSection] {
        var sections: [TBSection] = []
        var rows:[TBRow] = []
        transcriptItemViewModel.forEach({
            rows.append($0.display())
        })
        let secondSection = TBSection.init(nil, rows)
        sections.append(secondSection)
        return sections
    }
}
