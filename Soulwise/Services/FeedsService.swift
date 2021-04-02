//
//  FeedsService.swift
//  Soulwise
//
//  Created by apple on 02/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class FeedsService:LocalService {
    
    override func filePath() -> String {
        return "feeds"
    }
    
    override func processData(response: Data) -> Any? {
        do {
            let companies = try JSONDecoder().decode(FeedsModel.self, from: response)
            return companies
        } catch {
            print("error while decoding")
        }
        return nil
    }
}
