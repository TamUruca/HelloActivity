//
//  AuthenticationLogin.swift
//  HelloActivity
//
//  Created by vuminhtam on 9/18/22.
//

import SwiftUI

class AuthenticationLogin: ObservableObject {
    @Published var isValidated = false
    
    enum AuthenticationLoginError: Error, LocalizedError, Identifiable {
        case invalidaCredentials
        case errorAPI(error: String)
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidaCredentials:
                return NSLocalizedString("chua login ok nha !!", comment: "")
            case .errorAPI(let error):
                return NSLocalizedString(error, comment: "")
            }
        }
    }
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
}

