//
//  CompaniesService.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class CompaniesService:LocalService {
    
    override func filePath() -> String {
        return "companies"
    }
    
    override func processData(response: Data) -> Any? {
        do {
            let companies = try JSONDecoder().decode([CompaniesModel].self, from: response)
            return companies
        } catch {
            print("error while decoding")
        }
        return nil
    }
}
