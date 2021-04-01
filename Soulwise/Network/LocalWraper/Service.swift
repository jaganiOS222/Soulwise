//
//  Service.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

typealias Completion = (Result<Any>) -> Void

class Service: NSObject {
    
    func processData(response: Data) -> Any? {
        return nil
    }
    
    func cancel() { }
    
    func execute(completion: @escaping Completion) { }
}
