//
//  LoginView.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/12.
//

import SwiftUI
import FBSDKLoginKit
import GoogleSignInSwift
import GoogleSignIn
import LineSDK

enum TypeButton {
    case facebook
    case google
    case line
}

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var loginVM: LoginViewModel = LoginViewModel()
    @State private var isError: Bool = false
    @State private var error: String = ""
    @ObservedObject var tabbarRouter: TabBarRouter
    @State private var  loggedFB = false
    @State private var  loggedGoogle = false
    @State var mangaerFB = LoginManager()
    @State var mangaerGoogle = LoginManager()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView (.vertical, showsIndicators: false) {
                    VStack {
                        Text(R.string.localizable.title_screen_login())
                            .font(.largeTitle)
                            .padding(.top, 0)
                        
                        // email
                        TextField(R.string.localizable.hint_username_screen_login(), text: $username)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1)
                            )
                        
                        HStack(alignment: .top, spacing: 10){
                            if isError {
                                Image(uiImage: R.image.logo()!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.red)
                                    .padding(.leading, 0)
                                Text(error)
                                    .foregroundColor(.red)
                            }
                            Spacer()
                        }
                        .frame(width: geometry.size.width - 40, height: 40)
                        
                        //password
                        SecureTextField(text: $password)
                        
                        // forgot password
                        HStack(alignment: .top, spacing: 10){
                            Spacer()
                            Button(action: {
                                // do something
                            }, label: {
                                Text(R.string.localizable.string_forgot_password_screen_login()).foregroundColor(.blue)
                                    .font(.system(size: 12))
                            })
                            .padding(.trailing, 0)
                            
                        }
                        .frame(width: geometry.size.width - 40)
                        .padding(.top, 10)
                        
                        // login button
                        HStack(alignment: .top, spacing: 10){
                            Button(action: {
                                
                                if username.isEmpty {
                                    isError = true
                                    error = "Please enter username."
                                    return
                                }
                                
                                if password.isEmpty {
                                    isError = true
                                    error = "Please enter password."
                                    return
                                }
                                
                                // login
                                loginVM.postAPILogin{ isSuccess in
                                    if isSuccess {
                                        tabbarRouter.currentPage = .profile
                                    } else {
                                        print(loginVM.error?.errorDescription)
                                        isError = true
                                        error = loginVM.error?.errorDescription ?? ""
                                    }
                                    
                                }
                                
//                                startLoading(isShow: true)
//                                loginViewModel.postAPILogin(email: username, password: password, completion: { (isSuccess, message) in
//                                    startLoading(isShow: false)
//                                    if isSuccess {
//                                        isError = false
//                                        error = ""
//                                        tabbarRouter.currentPage = .profile
//                                    } else {
//                                        isError = true
//                                        error = message
//                                    }
//                                })
                            }, label: {
                                Text(R.string.localizable.string_button_login_screen_login()).foregroundColor(.white)
                                    .font(.system(size: 16))
                            })
                            .padding(.trailing, 0)
                            .frame(width: geometry.size.width - 40, height: 40)
                            .background(Color.red)
                            .cornerRadius(5)
                            
                        }
                        .frame(width: geometry.size.width - 40)
                        .padding(.top, 10)
                        
                        // register button
                        HStack(alignment: .top, spacing: 10){
                            Button(action: {
                                // do something
                            }, label: {
                                Text(R.string.localizable.string_button_register_screen_login()).foregroundColor(.white)
                                    .font(.system(size: 16))
                            })
                            .padding(.trailing, 0)
                            .frame(width: geometry.size.width - 40, height: 40)
                            .background(Color.orange)
                            .cornerRadius(5)
                            
                        }
                        .frame(width: geometry.size.width - 40)
                        .padding(.top, 10)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .frame(width: geometry.size.width)
                    
                    VStack {
                        // login Facabook
                        Divider()
                            .padding(.top, 30)
                        // button facebook
                        buildButton(type: .facebook, geometry: geometry)
                        Divider()
                            .padding(.top, 0)
                        // button line
                        buildButton(type: .line, geometry: geometry)
                        Divider()
                            .padding(.top, 0)
                        // button google
                        buildButton(type: .google, geometry: geometry)
                        Divider()
                            .padding(.top, 0)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .frame(width: geometry.size.width)
                }
                .padding(.top, 10)
                
                if loginVM.isShowProgressView {
                    LoadingView()
                        .background(Color.red)
                        .opacity(0.5)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .frame(height: geometry.size.height)
        }
        .onAppear {
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                // Check if `user` exists; otherwise, do something with `error`
            }
        }
    }
    
    func loginFacebook() {
        if loggedFB {
            print("da logout FB")
            mangaerFB.logOut()
            loggedFB = false
        } else {
            mangaerFB.logIn(permissions: [], from: nil) {
                (result, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                // check user cancel
                if !result!.isCancelled {
                    //login success facebook
                    loggedFB = true
                    print(result?.token?.tokenString as Any)
                    tabbarRouter.currentPage = .newRegister
                }
            }
        }
    }
    
    func loginGoogle() {
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: ApplicationUtility.rootViewController) { user, error in
                guard let signInUser = user else {
                    // Inspect error
                    return
                }
                // ucceeded
                loggedGoogle = true
                print("success: \(signInUser.authentication.refreshToken)")
            }
    }
    
    func loginLine() {
        LoginManager.shared.login(
            permissions: [.profile]
        ) {
            result in
            switch result {
            case .success(let loginResult):
                print(loginResult)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @ViewBuilder func buildButton(type: TypeButton, geometry: GeometryProxy) -> some View {
        switch (type){
        case .facebook:
            Button {
                loginFacebook()
            } label: {
                HStack {
                    Image(systemName: "case")
                        .foregroundColor(.red)
                        .padding(.leading, 10)
                    Text(R.string.localizable.string_button_facbook_screen_login())
                        .frame(
                            minWidth: (geometry.size.width / 2) - 25,
                            maxWidth: .infinity, minHeight: 44, alignment: .leading
                        )
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                }
                
            }
            .frame(width: geometry.size.width - 40, height: 40, alignment: .leading)
        case .google:
            Button {
                loginGoogle()
            } label: {
                HStack {
                    Image(systemName: "case")
                        .foregroundColor(.red)
                        .padding(.leading, 10)
                    Text(R.string.localizable.string_button_google_screen_login())
                        .frame(
                            minWidth: (geometry.size.width / 2) - 25,
                            maxWidth: .infinity, minHeight: 44, alignment: .leading
                        )
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                }
                
            }
            .frame(width: geometry.size.width - 40, height: 40, alignment: .leading)
        case .line:
            Button {
                loginLine()
            } label: {
                HStack {
                    Image(systemName: "case")
                        .foregroundColor(.red)
                        .padding(.leading, 10)
                    Text(R.string.localizable.string_button_line_screen_login())
                        .frame(
                            minWidth: (geometry.size.width / 2) - 25,
                            maxWidth: .infinity, minHeight: 44, alignment: .leading
                        )
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                }
                
            }
            .frame(width: geometry.size.width - 40, height: 40, alignment: .leading)
        }
        EmptyView()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(tabbarRouter: TabBarRouter())
    }
}

struct SecureTextField: View {
    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View {
        
        ZStack {
            HStack {
                if isSecureField {
                    SecureField(R.string.localizable.hint_password_screen_login(), text: $text)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 1)
                        )
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .offset(x: 20, y: 0)
                } else {
                    TextField("", text: $text)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 1)
                        )
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .offset(x: 20, y: 0)
                }
                Button(action: {
                    isSecureField.toggle()
                }) {
                    Image(systemName: isSecureField ? "eye.slash": "eye")
                        .onTapGesture {
                            isSecureField.toggle()
                        }
                        .padding(.trailing)
                        .foregroundColor(isSecureField == true ? Color.black : Color.gray)
                }.offset(x: -20, y: 0)
            }
            .offset(x: 5, y: 0)
        }
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(3)
        }
    }
}
