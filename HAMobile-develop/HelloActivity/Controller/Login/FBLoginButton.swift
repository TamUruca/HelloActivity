//
//  FBLoginApp.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/15/22.
//

import Foundation
import FBSDKLoginKit
import SwiftUI

struct FBLogin: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return FBLogin.Coordinator(parent1: self)
    }
    
    @Binding var logged: Bool
    @Binding var email: String
    
    func makeUIView(context: Context) ->  FBLoginButton {
        let button = FBLoginButton()
        
        button.delegate = context.coordinator
        return button
    }
    
    func updateUIView(_ uiView: FBLoginButton, context: Context) {
        
    }
    
    class Coordinator: NSObject, LoginButtonDelegate {
        
        var parent: FBLogin
        
        init(parent1: FBLogin) {
            parent = parent1
        }
        
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if !result!.isCancelled {
                print(result?.token?.tokenString)
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            parent.logged = false
            parent.email = ""
        }
    }
}


