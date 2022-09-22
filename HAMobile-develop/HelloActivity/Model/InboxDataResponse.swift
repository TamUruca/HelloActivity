//
//  InboxDataResponse.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/22/22.
//

import Foundation

struct InboxDataResponse: Hashable, Codable {
    let status: Int
    let data: [ItemInboxData]

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

struct ItemInboxData: Hashable, Codable {
    var entry: Entry
    var activity: Activity
    var latestMessage: LatestMessage
    
    enum CodingKeys: String, CodingKey {
        case entry = "entry"
        case activity = "activity"
        case latestMessage = "latest_message"
    }
}

struct Entry: Hashable, Codable {
    var code: String
    var status: Int
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case status = "status"
        case date = "date"
    }
}

struct Activity: Hashable, Codable {
    var title: String
    var displayImage: [String]
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case displayImage = "display_images"
    }
}

struct LatestMessage: Hashable, Codable {
    var date: String
    var text: String
    var read: Bool
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case text = "text"
        case read = "read"
    }
}


