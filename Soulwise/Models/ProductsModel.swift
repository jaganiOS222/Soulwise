//
//  ProductsModel.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.

import Foundation

// MARK: - WelcomeElement
struct ProductsModel: Codable {
    let imageCredit: ImageCredit
    let tags: [String]
    let imageURL: String
    let filename, imageHash: String
    let price: Float
    let name, productDescription, slug: String
    let added: Int
    let manufacturer: Manufacturer
    let itemType: ItemType
    let productImg: String

    enum CodingKeys: String, CodingKey {
        case imageCredit, tags
        case imageURL = "imageUrl"
        case filename, imageHash, price, name
        case productDescription = "description"
        case slug, added, manufacturer, itemType, productImg
    }
}

// MARK: - ImageCredit
struct ImageCredit: Codable {
    let artist: String
    let link: String
}

enum ItemType: String, Codable {
    case mug = "mug"
    case shirt = "shirt"
}

enum Manufacturer: String, Codable {
    case bayerAndSons = "Bayer-and-Sons"
    case bernierHane = "Bernier-Hane"
    case boyleLLC = "Boyle-LLC"
    case cruickshankBayerAndGerlach = "Cruickshank-Bayer-and-Gerlach"
    case dickensFranecki = "Dickens-Franecki"
    case feilDooleyAndReinger = "Feil-Dooley-and-Reinger"
    case franeckiGaylord = "Franecki---Gaylord"
    case heathcoteKautzerAndTurner = "Heathcote-Kautzer-and-Turner"
    case hodkiewiczInc = "Hodkiewicz-Inc"
    case konopelskiGroup = "Konopelski-Group"
    case konopelskiInc = "Konopelski-Inc"
    case leannonFaheyAndSawayn = "Leannon-Fahey-and-Sawayn"
    case leuschkeSmithAndConroy = "Leuschke-Smith-and-Conroy"
    case loweWunschAndStoltenberg = "Lowe-Wunsch-and-Stoltenberg"
    case mcCulloughLueilwitz = "McCullough---Lueilwitz"
    case metzKautzer = "Metz---Kautzer"
    case nikolausSchinner = "Nikolaus-Schinner"
    case oHaraGroup = "OHara-Group"
    case oberbrunnerBlockAndMills = "Oberbrunner-Block-and-Mills"
    case riceInc = "Rice-Inc"
    case sipesInc = "Sipes-Inc"
    case weissnatSchowalterAndKoelpin = "Weissnat-Schowalter-and-Koelpin"
}

typealias products = [ProductsModel]
