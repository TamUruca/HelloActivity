//
//  AppDelegate.swift
//  HelloActivity
//
//  Created by mac on 07/09/2022.
//

import SwiftUI
import FBSDKCoreKit
import GoogleSignIn
import LineSDK

let signInConfig = GIDConfiguration(clientID: "654559220898-41r6ncovvl56s3ted9ns4sketeq2tkah.apps.googleusercontent.com")

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        LoginManager.shared.setup(channelID: "1657477151", universalLinkURL: nil)
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled: Bool = ApplicationDelegate.shared.application(app, open: url, options: options)
        let handledLine: Bool = LoginManager.shared.application(app, open: url, options: options)
          if handled && handledLine {
            return true
          }
        return false
    }
    
    func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
    {
        return LoginManager.shared.application(application, open: userActivity.webpageURL)
    }
}
