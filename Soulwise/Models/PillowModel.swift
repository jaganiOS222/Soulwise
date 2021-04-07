//
//  PillowModel.swift
//  Soulwise
//
//  Created by apple on 06/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

struct PillowModel: Codable {
    let productID: Int
    let sku, name: String
    let productURL: String
    let price, retailPrice: Double
    let thumbnailURL: String
    let searchKeywords: SearchKeywords
    let welcomeDescription: Description
    let category: String
    let categoryID: CategoryID
    let brand, childSKU: String
    let childPrice: ChildPrice
    let color, colorFamily, colorSwatches, size: String
    let shoeSize: String
    let pantsSize: PantsSize
    let occassion: Occassion
    let season: Season
    let badges: String
    let ratingAvg: Double
    let ratingCount, inventoryCount: Int
    let dateCreated: String

    enum CodingKeys: String, CodingKey {
        case productID = "Product ID"
        case sku = "SKU"
        case name = "Name"
        case productURL = "Product URL"
        case price = "Price"
        case retailPrice = "Retail Price"
        case thumbnailURL = "Thumbnail URL"
        case searchKeywords = "Search Keywords"
        case welcomeDescription = "Description"
        case category = "Category"
        case categoryID = "Category ID"
        case brand = "Brand"
        case childSKU = "Child SKU"
        case childPrice = "Child Price"
        case color = "Color"
        case colorFamily = "Color Family"
        case colorSwatches = "Color Swatches"
        case size = "Size"
        case shoeSize = "Shoe Size"
        case pantsSize = "Pants Size"
        case occassion = "Occassion"
        case season = "Season"
        case badges = "Badges"
        case ratingAvg = "Rating Avg"
        case ratingCount = "Rating Count"
        case inventoryCount = "Inventory Count"
        case dateCreated = "Date Created"
    }
}

enum CategoryID: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(CategoryID.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for CategoryID"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum ChildPrice: String, Codable {
    case empty = ""
    case the425999 = "42|59.99"
    case the5072108 = "50|72|108"
}

enum Occassion: String, Codable {
    case empty = ""
    case formal = "Formal"
    case graduation = "Graduation"
    case party = "Party"
}

enum PantsSize: String, Codable {
    case empty = ""
    case the242526273031 = "24|25|26|27|30|31"
}

enum SearchKeywords: String, Codable {
    case loremIpsumDolor = "lorem, ipsum, dolor, ..."
}

enum Season: String, Codable {
    case empty = ""
    case summerSpring = "Summer|Spring"
    case winter = "Winter"
}

enum Description: String, Codable {
    case sociosquFacilisisDuis = "Sociosqu facilisis duis ..."
}


