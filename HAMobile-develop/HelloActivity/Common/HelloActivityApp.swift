//
//  HelloActivityApp.swift
//  HelloActivity
//
//  Created by mac on 26/08/2022.
//

import SwiftUI
import GoogleSignIn
import LineSDK

@main
struct HelloActivityApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var IsShowedOnboarding = UserDefaults.standard.bool(forKey: "IsShowedOnboarding")

    var body: some Scene {
        WindowGroup {
            if IsShowedOnboarding {
                ContentView()
                    .onOpenURL { url in
                        let _ = GIDSignIn.sharedInstance.handle(url)
                        let _ = LoginManager.shared.application(.shared, open: url)
                    }
            } else {
                OnboardingView()
            }
        }
    }
}

