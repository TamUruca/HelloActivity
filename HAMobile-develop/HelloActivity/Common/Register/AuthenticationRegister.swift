//
//  AuthenticationRegister.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/16/22.
//

import SwiftUI

class AuthenticationRegister: ObservableObject {
    @Published var isValidated = false
    
    enum AuthenticationRegisterError: Error, LocalizedError, Identifiable {
        case invalidaCredentials
        case errorAPI(error: String)
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidaCredentials:
                return NSLocalizedString("chua register ok nha !!", comment: "")
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
