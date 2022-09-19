//
//  RegisterViewModel.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/16/22.
//

import Foundation

struct RegisterCredentials: Codable {
    var yourName = ""
    var name = ""
    var nickName = ""
    var emailAddress = ""
    var password = ""
}

class RegisterViewModel: ObservableObject {
    @Published var credentials = RegisterCredentials()
    @Published var iSShowProgressView = false
    @Published var error: AuthenticationRegister.AuthenticationRegisterError?
    
    var registerDisabled: Bool {
        credentials.yourName.isEmpty || credentials.name.isEmpty || credentials.nickName.isEmpty || credentials.emailAddress.isEmpty || credentials.password.isEmpty
    }
    
    // MARK: - Call API
    func postRegister(completion: @escaping (Bool) -> Void) {
        ApiManager.shareInstance.postAPIRegister(credentials: credentials, success: { [weak self] (isSuccess, data) in
            guard isSuccess else {
                completion(false)
                return
            }
            self?.iSShowProgressView = true
            completion(isSuccess)
        }, failured: { [weak self] (message) in
            self?.iSShowProgressView = false
            self?.error = .errorAPI(error: message)
//            error = .invalidaCredentials
            completion(false)
        })
        
    }
}
