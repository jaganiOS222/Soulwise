//
//  PillowService.swift
//  Soulwise
//
//  Created by apple on 06/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class PillowService:LocalService {
    
    override func filePath() -> String {
        return "pillowProducts"
    }
    
    override func processData(response: Data) -> Any? {
        do {
            let companies = try JSONDecoder().decode([PillowModel].self, from: response)
            return companies
        } catch {
            print("error while decoding")
        }
        return nil
    }
}
