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
    @Published var error: AuthenticationLogin.AuthenticationLoginError?
    @Published var userData: UserLogin?
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    // MARK: - Call API
    func postAPILogin(progressApp: ProgressApp, completion: @escaping (Bool) -> Void) {
        progressApp.isShowProgressView = true
        ApiManager.shareInstance.postAPILogin(credentials: credentials, success: { [weak self] (isSuccess, data) in
            progressApp.isShowProgressView = false
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
    
    func isLoginSocial(type: String) -> Bool {
        guard let dataSocial = UserDefaultUtils.shared.get(object: DataRegisterSocial.self, fromKey: UserDefaultsKeys.loginSocial) else {
            return false
        }
        return dataSocial.type == type
    }
}
