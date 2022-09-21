//
//  RegisterViewModel.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/16/22.
//

import Foundation
import Alamofire

enum TypeSocial {
    case facebook(String)
    case google(String)
    case line(String)
    case yahoo(String)
    case unknow
}

struct RegisterCredentials: Codable {
    var name_jp = ""
    var name = ""
    var nick_name = ""
    var email = ""
    var password = ""
    var magazine_accepted = 0
}

class RegisterViewModel: ObservableObject {
    @Published var credentials = RegisterCredentials()
    @Published var error: ErrorApp.ErrorProvider?
    @Published var userLogindata: UserLoginResponse?
    
    var registerDisabled: Bool {
        credentials.name_jp.isEmpty || credentials.name.isEmpty || credentials.nick_name.isEmpty || credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    // MARK: - Call API
    func postRegister(progressApp: ProgressApp, completion: @escaping (Bool) -> Void) {
        progressApp.isShowProgressView = true
        var parameters = credentials.setParams()
        let dataSocial = UserDefaultUtils.shared.get(object: DataRegisterSocial.self, fromKey: UserDefaultsKeys.loginSocial)
        
        switch dataSocial?.type {
        case "Facebook":
            parameters["social_facebook"] = dataSocial?.token
        case "Google":
            parameters["social_google"] = dataSocial?.token
        case "Line":
            parameters["social_line"] = dataSocial?.token
        case "Yahoo":
            parameters["social_yahoo"] = dataSocial?.token
        default:
            break
        }
        
        ApiManager.shareInstance.requestAPIJSON(api: ClientApi.register, parameters: parameters, typeContentHeader: .urlncoded, encoding: URLEncoding.default) { [weak self] (success, IsFailResponseError, data, message) -> (Void) in
            progressApp.isShowProgressView = false
            if !success, !message.isEmpty {
                self?.error = .errorAPI(error: message)
                completion(false)
                return
            }
            if success && !IsFailResponseError , let data = data {
                if let json = data as? [String: Any], let code = json["status"] as? Int, code == 200 {
                    completion(true)
                } else {
                    self?.error = .errorAPI(error: "Can not pass data !")
                }
            } else if let data = data {
                progressApp.isShowProgressView = false
                if let json = data as? [String: Any] {
                    let message = json["message"] as? String ?? ""
                    self?.error = .errorAPI(error: message)
                }
                completion(false)
            }
        }
    }
}
