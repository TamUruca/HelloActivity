//
//  RegisterViewModel.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/16/22.
//

import Foundation

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
    @Published var error: AuthenticationRegister.AuthenticationRegisterError?
    @Published var userLogindata: UserLoginResponse?
    
    var registerDisabled: Bool {
        credentials.name_jp.isEmpty || credentials.name.isEmpty || credentials.nick_name.isEmpty || credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    // MARK: - Call API
    func postRegister(progressApp: ProgressApp, completion: @escaping (Bool) -> Void) {
        progressApp.isShowProgressView = true
        ApiManager.shareInstance.requestAPIJSON(api: ClientApi.login, parameters: credentials.setParams()) { (success, IsFailResponseError, data) -> (Void) in
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
                self.error = .errorAPI(error: data as! String)
                completion(false)
            }
        }
        
//        progressApp.isShowProgressView = true
//        ApiManager.shareInstance.postAPIRegister(credentials: credentials, success: { [weak self] (isSuccess, data) in
//            progressApp.isShowProgressView = false
//            guard isSuccess else {
//                completion(false)
//                return
//            }
//            self?.userData = data
//            completion(isSuccess)
//        }, failured: { [weak self] (message) in
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                progressApp.isShowProgressView = false
//                self?.error = .errorAPI(error: message)
//                completion(false)
//            }
//        })
    }
}
