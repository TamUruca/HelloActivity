//
//  ActivityPageItem.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/14.
//

import Foundation

// MARK: - ActivityPageItem
struct ActivityPageItem: Codable {
    var activities: [ActivityItem]?
    var areas: [AreaData]?
    var count: Int
    var currentPage: String

    enum CodingKeys: String, CodingKey {
        case activities, areas, count
        case currentPage = "current_page"
    }
    
    init(activities: [ActivityItem], count: Int, currentPage: String) {
        self.activities = activities
        self.count = count
        self.currentPage = currentPage
    }
    
    init(areas: [AreaData], count: Int, currentPage: String) {
        self.areas = areas
        self.count = count
        self.currentPage = currentPage
    }
}
