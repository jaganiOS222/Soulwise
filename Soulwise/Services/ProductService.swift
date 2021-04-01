//
//  ProductService.swift
//  Soulwise
//
//  Created by apple on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class ProductService:LocalService {
    
    override func filePath() -> String {
        return "products"
    }
    
    override func processData(response: Data) -> Any? {
        do {
            let companies = try JSONDecoder().decode([ProductsModel].self, from: response)
            return companies
        } catch {
            print("error while decoding")
        }
        return nil
    }
}
