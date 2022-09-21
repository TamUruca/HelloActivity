//
//  ErrorApp.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/21/22.
//

import SwiftUI

class ErrorApp: ObservableObject {
    @Published var isValidated = false
    
    enum ErrorProvider: Error, LocalizedError, Identifiable {
        case invalidaCredentials
        case errorAPI(error: String)
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidaCredentials:
                return NSLocalizedString("invalida Credentials !!", comment: "")
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

