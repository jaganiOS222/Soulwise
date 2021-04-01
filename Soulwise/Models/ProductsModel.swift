//
//  ProductsModel.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

struct ProductsModel:Decodable {
    var name:String?
    var description:String?
    var price:Float?
    var itemType:String?
    var productImg:String?
    var tags:[String]?
    var added:Int?
    var manufacturer:String?
    var imageCredit:ImageCredit?
    var slug:String?
}

struct ImageCredit:Decodable {
    var artist:String?
    var link:String?
}
