//
//  ChatItem.swift
//  HelloActivity
//
//  Created by mac on 07/09/2022.
//

import SwiftUI

struct ChatItem: Hashable, Codable {
    let activityName: String
    let activityStatus: Int
    let activityId: String
    let chatContent: String
    let chatImage: String
    let chatTime: String
    
    enum CodingKeys: String, CodingKey {
        case activityName = "q"
        case activityStatus
        case activityId = "e"
        case chatContent = "r"
        case chatImage = "t"
        case chatTime = "y"
    }
}


