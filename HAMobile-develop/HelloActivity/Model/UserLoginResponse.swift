//
//  UserLoginResponse.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/14/22.
//

import Foundation

struct UserLoginResponse: Hashable, Codable {
    let status: Int
    let data: UserLoginData

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

struct UserLoginData: Hashable, Codable {
    
    var user: UserData
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case user = "user"
        case token = "token"
    }
}

struct UserData: Hashable, Codable {
    var nameJP: String
    var name: String
    var chatUred: Int
    
    enum CodingKeys: String, CodingKey {
        case nameJP = "name_jp"
        case name = "name"
        case chatUred = "chat_unread"
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
