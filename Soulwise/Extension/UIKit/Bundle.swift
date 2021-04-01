//
//  Bundle.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation


extension Bundle {
        
    func jsonString(at path: String) -> String {
        return fileAt(path: path, type: "json")
    }
  
}

extension Bundle {
    
    func fileAt(path: String, type: String) -> String {
        if let filename = Bundle.main.path(forResource:path, ofType: type) {
            do {
                let text = try String(contentsOfFile: filename, encoding: String.Encoding.utf8)
                return text
            } catch {
                print("Error in loading file at \(path)")
            }
        } else {
            return ""
        }
        return ""
    }
    
}
