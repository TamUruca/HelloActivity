//
//  ChatItem.swift
//  HelloActivity
//
//  Created by mac on 07/09/2022.
//

import SwiftUI

struct ChatItem: Hashable, Codable {
    let tourName: String
    let tourStatus: Int
    let tourId: String
    let chatContent: String
    let chatImage: String
    let chatTime: String
    
    enum CodingKeys: String, CodingKey {
        case tourName = "q"
        case tourStatus
        case tourId = "e"
        case chatContent = "r"
        case chatImage = "t"
        case chatTime = "y"
    }
}


