//
//  LoginViewModel.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/14/22.
//

import Foundation
import UIKit

struct LoginCredentials: Codable {
    var email = ""
    var password = ""
    var device_id = UIDevice.current.identifierForVendor?.uuidString
}

final class LoginViewModel: ObservableObject {
    
    @Published var credentials = LoginCredentials()
    @Published var error: ErrorApp.ErrorProvider?
    @Published var userLogindata: UserLoginResponse?
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    // MARK: - Call API
    func postAPILogin(progressApp: ProgressApp, completion: @escaping (Bool) -> Void) {
        progressApp.isShowProgressView = true
        
        ApiManager.shareInstance.requestAPIJSON(api: ClientApi.login, parameters: credentials.setParams(), typeContentHeader: .json) { (success, IsFailResponseError, data) -> (Void) in
            progressApp.isShowProgressView = false
            if success && !IsFailResponseError , let data = data {
               guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: JSONSerialization.WritingOptions.prettyPrinted) else {return}
                let decoder = JSONDecoder()
                do {
                    let userLogindata = try decoder.decode(UserLoginResponse.self, from: jsonData)
                    self.userLogindata = userLogindata
                    UserDefaultUtils.shared.set(key: UserDefaultsKeys.token, value: userLogindata.data.token)
                    completion(success)
                } catch {
                    print(error.localizedDescription)
                }
            } else if let data = data {
                progressApp.isShowProgressView = false
                if let json = data as? [String: Any] {
                    let message = json["message"] as? String ?? ""
                    self.error = .errorAPI(error: message)
                }
                completion(false)
            }
        }
    }
    
    func isLoginSocial(type: String) -> Bool {
        guard let dataSocial = UserDefaultUtils.shared.get(object: DataRegisterSocial.self, fromKey: UserDefaultsKeys.loginSocial) else {
            return false
        }
        return dataSocial.type == type
    }
}
