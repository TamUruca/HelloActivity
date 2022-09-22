//
//  ClientAPI.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/14/22.
//

import Foundation
import Alamofire

enum ClientApi {
    case login
    case register
    case areas
    case logout
    case promotion
    case favorite
    case inbox
}

extension ClientApi: TargetType {
    
    var baseURL: String {
        return "http://localhost:8062"
    }
    
    var path: String {
        switch self {
            // profile
        case .login:
            return "/api/app/user/authorize"
        case .register:
            return "/api/app/user/signup"
        case .logout:
            return "/api/app/user/signout"
            
            //category
        case .areas:
            return "/api/app/home/areas"
        case .promotion:
            return "/api/app/home/promotion"
        case .favorite:
            return "/api/app/home/favorite"
        case .inbox:
            return "/api/app/message"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .areas:
            return .get
        case .logout:
            return .post
        case .promotion:
            return .get
        case .favorite:
            return .get
        case .inbox:
            return .get
        }
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        return .request
    }
}
