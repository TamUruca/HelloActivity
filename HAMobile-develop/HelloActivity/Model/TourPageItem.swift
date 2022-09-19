//
//  TourPageItem.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/14.
//

import Foundation

// MARK: - TourPageItem
struct TourPageItem: Codable {
    var activities: [TourItem]?
    var areas: [AreaItem]?
    var count: Int
    var currentPage: String

    enum CodingKeys: String, CodingKey {
        case activities, areas, count
        case currentPage = "current_page"
    }
    
    init(activities: [TourItem], count: Int, currentPage: String) {
        self.activities = activities
        self.count = count
        self.currentPage = currentPage
    }
    
    init(areas: [AreaItem], count: Int, currentPage: String) {
        self.areas = areas
        self.count = count
        self.currentPage = currentPage
    }
}
