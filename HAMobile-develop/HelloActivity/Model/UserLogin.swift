//
//  UserLogin.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/14/22.
//

import Foundation

class UserLogin {
    
    var nameJP: String
    var name: String
    var notificationUnreadCount: Int
    var userID: Int
    var messageUnreadCount: Int
    var reservationRelateUnreadNum: Int
    var haNewsUnreadNum: Int
    var token: String
    
    
    init(dic: [String: Any]) {
        self.nameJP = dic["name_jp"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        self.notificationUnreadCount = dic["notification_unread_count"] as? Int ?? 0
        self.userID = dic["user_id"] as? Int ?? 0
        self.messageUnreadCount = dic["message_unread_count"] as? Int ?? 0
        self.reservationRelateUnreadNum = dic["reservationRelatedUnreadNum"] as? Int ?? 0
        self.haNewsUnreadNum = dic["haNewsUnreadNum"] as? Int ?? 0
        self.token = dic["token"] as? String ?? ""
    }
}
