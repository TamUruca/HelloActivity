//
//  FavoriteResponse.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/20.
//

import Foundation


struct FavoriteResponse: Hashable, Codable {
    let status: Int
    let data: FavoriteData

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

// MARK: - AreaItem
struct FavoriteData: Hashable, Codable {
    var count: Int?
    var activities: [ActivityItem]?

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case activities = "activities"
    }
}
