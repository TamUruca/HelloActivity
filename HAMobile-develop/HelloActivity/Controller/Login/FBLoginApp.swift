//
//  FBLoginApp.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/15/22.
//

import Foundation
import FBSDKLoginKit
import SwiftUI

//struct FBLoginApp: View {
//
//    @AppStorage("logged") var logged = false
//    @AppStorage("email") var email = ""
//    @State var manager = LoginManager()
//
//    var body: some View {
//        if true {
//            manager.logIn(permissions: ["public_profile", "email"], from: nil) {
//                (result, err) in
//
//
//
//
//            }
//        }
//    }
//}

//                        FBLog(logged: $logged, email: $email)
//                            .frame(width: 100, height: 50)
//                            .padding(.horizontal, 10)

struct FBLog: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return FBLog.Coordinator(parent1: self)
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
        
        var parent: FBLog
        
        init(parent1: FBLog) {
            parent = parent1
        }
        
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            
            // check user cancel
            
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


