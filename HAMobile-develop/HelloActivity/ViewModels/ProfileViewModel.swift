//
//  ProfileViewModel.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/21/22.
//

import Foundation

final class LogoutViewModel: ObservableObject {
    
    @Published var error: ErrorApp.ErrorProvider?
    
    // MARK: - Call API
    func postAPILogout(progressApp: ProgressApp, completion: @escaping (Bool) -> Void) {
        progressApp.isShowProgressView = true
        
        ApiManager.shareInstance.requestAPIJSON(api: ClientApi.logout, typeContentHeader: .json) { [weak self] (success, IsFailResponseError, data, message) -> (Void) in
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
                    self?.error = .errorAPI(error: R.string.localizable.can_not_convert_data())
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
