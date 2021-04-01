//
//  CompaniesViewModel.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class CompaniesViewModel {
    var companiesItemViewModel = [CompaniesItemViewModel]()
    
    init(_ model:[CompaniesModel]) {
        model.forEach({
            companiesItemViewModel.append(CompaniesItemViewModel.init($0))
        })
    }
    
    func display() -> [TBSection] {
        var sections:[TBSection] = []
        companiesItemViewModel.forEach({
            sections.append($0.displaySections())
        })
        return sections
    }
}
