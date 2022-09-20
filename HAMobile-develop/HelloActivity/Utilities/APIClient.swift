//
//  ClientAPI.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/14/22.
//

import Foundation
class Utils {
    enum Environment {
        case development
        case product
    }
    
    class func getBaseUrl() -> String {
        return "http://localhost:8062"
    }
    
    class func postAPILogin() -> String {
        return getBaseUrl() + "/api/app/user/authorize"
    }
    
    class func postAPIRegister() -> String {
        return getBaseUrl() + "/api/app/user/authorize"
    }
    
}
