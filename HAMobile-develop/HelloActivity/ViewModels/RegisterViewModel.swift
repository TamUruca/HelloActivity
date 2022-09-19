//
//  RegisterViewModel.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/16/22.
//

import Foundation

enum TypeSocialRegister: Codable {
    case facebook(String)
    case google(String)
    case line(String)
    case unknow
    
    var tokenString: String? {
        switch self {
        case .facebook(let token):
            return token
        case .google(let token):
            return token
        case .line(let token):
            return token
        case .unknow:
            return ""
        }
    }
}

struct RegisterCredentials: Codable {
    var yourName = ""
    var name = ""
    var nickName = ""
    var emailAddress = ""
    var password = ""
    var typeSocial: TypeSocialRegister = .unknow
}

class RegisterViewModel: ObservableObject {
    @Published var credentials = RegisterCredentials()
    @Published var error: AuthenticationRegister.AuthenticationRegisterError?
    
    var registerDisabled: Bool {
        credentials.yourName.isEmpty || credentials.name.isEmpty || credentials.nickName.isEmpty || credentials.emailAddress.isEmpty || credentials.password.isEmpty
    }
    
    // MARK: - Call API
    func postRegister(progressApp: ProgressApp, completion: @escaping (Bool) -> Void) {
        progressApp.isShowProgressView = true
        ApiManager.shareInstance.postAPIRegister(credentials: credentials, success: { (isSuccess, data) in
            progressApp.isShowProgressView = true
            guard isSuccess else {
                completion(false)
                return
            }
            completion(isSuccess)
        }, failured: { [weak self] (message) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                progressApp.isShowProgressView = false
                self?.error = .errorAPI(error: message)
                completion(false)
            }
        })
        
    }
}
