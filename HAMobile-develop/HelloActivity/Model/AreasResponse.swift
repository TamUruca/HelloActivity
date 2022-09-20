//
//  AreaItem.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/16.
//

import Foundation

struct AreasResponse: Hashable, Codable {
    let status: Int
    let data: [AreaData]

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

// MARK: - AreaItem
struct AreaData: Hashable, Codable {
    var name: String?
    var activities: [ActivityItem]?
    var activity_count: String?
    var photo: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case activities = "activities"
        case activity_count = "activity_count"
        case photo = "photo"
    }
    
    init(name: String, activities: [ActivityItem]) {
        self.name = name
        self.activities = activities
    }
}
