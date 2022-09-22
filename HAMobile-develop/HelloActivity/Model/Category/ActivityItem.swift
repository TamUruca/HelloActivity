//
//  ActivityItem.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/14.
//
import Foundation

struct ActivityItem: Hashable, Codable {
    let id: String?
    let areaID: String?
    let areaName: String
    let code: String?
    let title: String
    let titleEn: String?
    let titleTc: String?
    let titleSc: String?
    let displayStatus: String?
    let currencyCode: String?
    let displayImages: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case areaID = "area_id"
        case areaName = "area_name"
        case code = "code"
        case title = "title"
        case titleEn = "title_en"
        case titleTc = "title_tc"
        case titleSc = "title_sc"
        case displayStatus = "display_status"
        case displayImages = "display_images"
        case currencyCode = "currency_code"
    }
}
