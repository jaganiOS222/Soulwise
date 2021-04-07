//
//  VideosService.swift
//  Soulwise
//
//  Created by apple on 06/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation
class VideosService:LocalService {
    static let baseURL:String = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/"
    
    override func filePath() -> String {
        return "videos"
    }
    
    override func processData(response: Data) -> Any? {
        do {
            let companies = try JSONDecoder().decode(VideosModel.self, from: response)
            return companies
        } catch {
            print("error while decoding")
        }
        return nil
    }
}

