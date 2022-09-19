//
//  ActivityItem.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/14.
//
import SwiftUI

struct ActivityItem: Hashable, Codable{
//    let areaId: String?
    let areaName: String
//    let supplierId: String?
//    let code: String?
    let title: String
//    let displayStatus: String?
//    let participantNumberFrom: String?
//    let participantNumberTo: String?
//    let expireType: String?
//    let expireTime: String?
//    let expireHour: String?
//    let expireDays: String?
//    let openWeekdays: String?
//    let startTimes: String?
//    let description: String?
//    let cancelPolicy: String?
//    let question: String?
//    let unit: String?
    let displayImages: String
//    let lowerPrice: String?
//    let higherPrice: String?
//    let averageRate: String?
//    let reviewCount: String?
//    let recentEntryCount: String?
//    let isRecommend: String?
//    let url: String?
//    let memo: String?
//    let updatedAt: String?
//    let createdAt: String?
//    let isDelete: String?
//    let currencyCode: String?
//    let currencyRate: String?
//    let currencyDecimals: String?
    
    enum CodingKeys: String, CodingKey {
//        case areaId = "area_id"
        case areaName = "area_name"
//        case supplierId = "supplier_id"
//        case code = "code"
        case title = "title"
//        case displayStatus = "display_status"
//        case participantNumberFrom = "participant_number_from"
//        case participantNumberTo = "participant_number_to"
//        case expireType = "expire_type"
//        case expireTime = "expire_time"
//        case expireHour = "expire_hour"
//        case expireDays = "expire_days"
//        case openWeekdays = "open_weekdays"
//        case startTimes = "start_times"
//        case description = "description"
//        case cancelPolicy = "cancel_policy"
//        case question = "question"
//        case unit = "unit"
        case displayImages = "display_images"
//        case lowerPrice = "lower_price"
//        case higherPrice = "higher_price"
//        case averageRate = "average_rate"
//        case reviewCount = "review_count"
//        case recentEntryCount = "recent_entry_count"
//        case isRecommend = "is_recommend"
//        case url = "url"
//        case memo = "memo"
//        case updatedAt = "updated_at"
//        case createdAt = "created_at"
//        case isDelete = "is_delete"
//        case currencyCode = "currency_code"
//        case currencyRate = "currency_rate"
//        case currencyDecimals = "currency_decimals"
    }
}
