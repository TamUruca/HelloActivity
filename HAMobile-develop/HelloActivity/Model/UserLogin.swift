//
//  UserLogin.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/14/22.
//

import Foundation

class UserLogin {
    
    var user: User
    var token: String
    
    init(dic: [String: Any]) {
        self.user = User.init(dic: dic["user"] as? [String: Any] ?? [:])
        self.token = dic["token"] as? String ?? ""
    }
}

class User {
    var nameJP: String
    var name: String
    var chatUred: Int
    
    init(dic: [String: Any]) {
        self.nameJP = dic["name_jp"] as? String ?? ""
        self.chatUred = dic["chat_unread"] as? Int ?? 0
        self.name = dic["name"] as? String ?? ""
    }
}



class DataRegisterSocial: Codable {
    var type: String = ""
    var token: String = ""
    
    init(type: String, token: String) {
        self.type = type
        self.token = token
    }
}
