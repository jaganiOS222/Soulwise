//
//  CompaniesModel.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation


struct CompaniesModel:Decodable {
    var slug:String?
   var name:String?
   var address:String?
   var city:String?
   var state:String?
   var zip:String?
   var account:Int?
   var contact: String?
    var isLiked:Bool?
}
