//
//  FeedsModel.swift
//  Soulwise
//
//  Created by apple on 02/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct FeedsModel: Codable {
    let success: Bool
    let exceptionData, error, userDisplayName: JSONNull?
    let errorCode: Int
    let popup: JSONNull?
    let newsFeedList: [NewsFeedList]
    let feedCount, pageSize, numFeedsInPage: Int
}

// MARK: - NewsFeedList
struct NewsFeedList: Codable {
    let feedID: Int
    let header: String
    let content: String?
    let icon: JSONNull?
    let button: Button
    let type: String
    let timeStamp: JSONNull?
    let deepLinkInfo: DeepLinkInfo
    let image: String
    let createTime: String
    let landingBannerMessage: String?
    let feedExpiry: Int
    let shareable, autoAssignToNewUser: Bool
    let feedTag: String
    let createEvent, specialFeed, isTitleVisible, isDescVisible: Bool
    let numComments: Int
    let newsFeedListDescription: String?
    let bgImg: JSONNull?
    let bannerImg, selectedName, fileName, fileSize: String?
    let fileType: String?
    let mappedCourseID, feedCoins, numOfDistributedUsers: Int
    let markFeedForAnnouncement, titleVisible, descVisible: Bool

    enum CodingKeys: String, CodingKey {
        case feedID = "feedId"
        case header, content, icon, button, type, timeStamp, deepLinkInfo, image, createTime, landingBannerMessage, feedExpiry, shareable, autoAssignToNewUser, feedTag, createEvent, specialFeed, isTitleVisible, isDescVisible, numComments
        case newsFeedListDescription = "description"
        case bgImg, bannerImg, selectedName, fileName, fileSize, fileType
        case mappedCourseID = "mappedCourseId"
        case feedCoins, numOfDistributedUsers, markFeedForAnnouncement, titleVisible, descVisible
    }
}

// MARK: - Button
struct Button: Codable {
    let btnText, btnActionURI, btnActionHTTPMethod, btnActionRequest: JSONNull?

    enum CodingKeys: String, CodingKey {
        case btnText, btnActionURI
        case btnActionHTTPMethod = "btnActionHttpMethod"
        case btnActionRequest
    }
}

// MARK: - DeepLinkInfo
struct DeepLinkInfo: Codable {
    let buttonLabel: JSONNull?
    let deepLinkType, id: String
    let bannerImage: JSONNull?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
