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
    var yourName = ""
    var name = ""
    var nickName = ""
    var emailAddress = ""
    var password = ""
}

class RegisterViewModel: ObservableObject {
    @Published var credentials = RegisterCredentials()
    @Published var error: AuthenticationRegister.AuthenticationRegisterError?
    @Published var userData: UserLogin?
    
    var registerDisabled: Bool {
        credentials.yourName.isEmpty || credentials.name.isEmpty || credentials.nickName.isEmpty || credentials.emailAddress.isEmpty || credentials.password.isEmpty
    }
    
    // MARK: - Call API
    func postRegister(progressApp: ProgressApp, completion: @escaping (Bool) -> Void) {
        progressApp.isShowProgressView = true
        ApiManager.shareInstance.postAPIRegister(credentials: credentials, success: { [weak self] (isSuccess, data) in
            progressApp.isShowProgressView = true
            guard isSuccess else {
                completion(false)
                return
            }
            self?.userData = data
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
