//
//  PromotionResponse.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/20.
//

import Foundation

struct PromotionResponse: Hashable, Codable {
    let status: Int
    let data: [PromotionData]

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

// MARK: - AreaItem
struct PromotionData: Hashable, Codable {
    var id: String?
    var code: String?
    var name: String?
    var nameEn: String?
    var nameTc: String?
    var nameSc: String?
    var activityCount: String?
    var photo: String?
    var activities: [ActivityItem]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case code = "code"
        case name = "name"
        case nameEn = "name_en"
        case nameTc = "name_tc"
        case nameSc = "name_sc"
        case activityCount = "activity_count"
        case photo = "photo"
        case activities = "activities"
    }
}
