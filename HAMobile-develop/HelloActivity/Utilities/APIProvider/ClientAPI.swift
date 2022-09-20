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
            //other
        case .areas:
            return "/api/app/home/areas"
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
        }
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        return .request
    }
}

//class Utils {
//    enum Environment {
//        case development
//        case product
//    }
//
//    class func getBaseUrl() -> String {
//        return "http://localhost:8062"
//    }
//
//    class func postAPILogin() -> String {
//        return getBaseUrl() + "/api/app/user/authorize"
//    }
//
//    class func postAPIRegister() -> String {
//        return getBaseUrl() + "/api/app/user/authorize"
//    }
//
//}
