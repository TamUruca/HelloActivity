//
//  AreaItem.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/16.
//

import Foundation

// MARK: - AreaItem
struct AreaItem: Hashable, Codable {
    let areaName: String
    let activities: [ActivityItem]

    enum CodingKeys: String, CodingKey {
        case activities
        case areaName = "current_page"
    }
}
