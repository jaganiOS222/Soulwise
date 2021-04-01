//
//  LocalService.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class LocalService: Service {
    
    func filePath() -> String {
        return ""
    }
    
    override func execute(completion: @escaping Completion) {
        let jsonString = Bundle.main.jsonString(at: filePath())
        if let data = jsonString.data(using: .utf8) {
            if let response = processData(response: data) {
                let result = Result<Any>.success(response)
                completion(result)
            }
        }
    }
    
}
