//
//  CompaniesModel.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation


struct CompaniesModel:Codable {
    let slug, name, address, city: String
    let state, zip: String
    let account: Int
    let contact: String
    let isLiked: Bool
}
