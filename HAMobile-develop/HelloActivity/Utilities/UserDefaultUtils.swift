//
//  UserDefaultUtils.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/20.
//

import Foundation

enum UserDefaultsKeys: String {
    case loginSocial = "loginSocial"
    case fcmToken = "fcmToken"
    case token = "token"
    case isShowedOnboarding = "isShowedOnboarding"
}

class UserDefaultUtils {

    static let shared = UserDefaultUtils()

    private var userDefault: UserDefaults = UserDefaults.standard

    func set<T>(key: UserDefaultsKeys, value: T) {
        userDefault.set(value, forKey: key.rawValue)
        userDefault.synchronize()
    }
    
    func get(key: UserDefaultsKeys) -> Any? {
        return userDefault.value(forKey: key.rawValue)
    }
    
    func setObject<T: Encodable>(customObject object: T, inKey key: UserDefaultsKeys) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            userDefault.set(encoded, forKey: key.rawValue)
        }
    }

    func get<T: Decodable>(object type: T.Type, fromKey key: UserDefaultsKeys) -> T? {
        if let data = userDefault.data(forKey: key.rawValue) {
            let decoder = JSONDecoder()
            if let object = try? decoder.decode(type, from: data) {
                return object
            } else {
                print("Couldnt decode object")
                return nil
            }
        } else {
            print("Couldnt find key")
            return nil
        }
    }
    
    func delete(key: UserDefaultsKeys) {
       if self.userDefault.value(forKey: key.rawValue) != nil {
           self.userDefault.removeObject(forKey: key.rawValue)
       }
    }
}
