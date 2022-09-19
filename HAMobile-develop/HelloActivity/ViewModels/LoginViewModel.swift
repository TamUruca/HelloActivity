//
//  LoginViewModel.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/14/22.
//

import Foundation

struct LoginCredentials: Codable {
    var email = ""
    var password = ""
}

final class LoginViewModel: ObservableObject {
    
    @Published var credentials = LoginCredentials()
    @Published var isShowProgressView = false
    @Published var error: AuthenticationLogin.AuthenticationLoginError?
    @Published var userData: UserLogin?
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    // MARK: - Call API
    func postAPILogin(completion: @escaping (Bool) -> Void) {
        isShowProgressView = true
        ApiManager.shareInstance.postAPILogin(credentials: credentials, success: { [weak self] (isSuccess, data) in
            self?.isShowProgressView = false
            guard isSuccess else {
                completion(false)
                return
            }
            
            completion(isSuccess)
        }, failured: { [weak self] (message) in
//            self?.isShowProgressView = false
            self?.error = .errorAPI(error: message)
            completion(false)
        })
    }
}

//
//final class LoginViewModel: ObservableObject {
//
//    @Published var userData: UserLogin?
//
//    // MARK: - Call API
//    func postAPILogin(email: String, password: String ,completion: @escaping Result ) {
//        ApiManager.shareInstance.postAPILogin(email: email, password: password,success: { (isSuccess, data) in
//            guard isSuccess else {
//                completion(false, "error unknow")
//                return
//            }
//            completion(isSuccess, "")
//        }, failured: { (message) in
//            completion(false, message)
//        })
//    }
//}
