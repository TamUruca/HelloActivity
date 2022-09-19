//
//  LineLoginButton.swift
//  HelloActivity
//
//  Created by vuminhtam on 9/15/22.
//

import LineSDK
import SwiftUI

//                        LineLoginButton()
//                            .onLoginStart {
//
//                            }
//                            .onLoginSuccess { result in
//                                print(result)
//                            }
//                            .onLoginFail { error in
//                                print(error)
//                            }

struct LineLoginButton: UIViewRepresentable {
    let permissions: Set<LoginPermission>

    fileprivate var onLoginSucceed: ((LoginResult) -> Void)?
    fileprivate var onLoginFail: ((LineSDKError) -> Void)?
    fileprivate var onLoginStart: (() -> Void)?

    init(permissions: Set<LoginPermission> = [.profile]) {
        self.permissions = permissions
    }

    // MARK: - Wrapping view

    func makeUIView(context: Context) -> LoginButton {
        let button = LoginButton()
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentHuggingPriority(.required, for: .vertical)
        button.delegate = context.coordinator
        return button
    }

    func updateUIView(_ uiView: LoginButton, context: Context) {}

    // MARK: - Coordinating

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    // MARK: - LoginButton Delegating

    func onLoginSuccess(perform: @escaping (LoginResult) -> Void) -> Self {
        modified(\.onLoginSucceed, with: perform)
    }

    func onLoginFail(perform: @escaping (LineSDKError) -> Void) -> Self {
        modified(\.onLoginFail, with: perform)
    }

    func onLoginStart(perform: @escaping () -> Void) -> Self {
        modified(\.onLoginStart, with: perform)
    }

    private func modified<Value>(_ keyPath: WritableKeyPath<Self, Value>, with value: Value) -> Self {
        var modified = self
        modified[keyPath: keyPath] = value
        return modified
    }
}

extension LineLoginButton {
    class Coordinator: NSObject, LoginButtonDelegate {
        private let parent: LineLoginButton

        init(parent: LineLoginButton) {
            self.parent = parent
        }

        // MARK: - LoginButtonDelegate

        func loginButtonDidStartLogin(_ button: LoginButton) {
            parent.onLoginStart?()
        }

        func loginButton(_ button: LoginButton, didSucceedLogin loginResult: LoginResult) {
            parent.onLoginSucceed?(loginResult)
        }

        func loginButton(_ button: LoginButton, didFailLogin error: LineSDKError) {
            parent.onLoginFail?(error)
        }
    }
}

