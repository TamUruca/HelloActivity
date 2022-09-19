//
//  LoginView.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/12.
//

import SwiftUI

struct RegisterView: View {

    @ObservedObject var tabbarRouter: TabBarRouter
    @EnvironmentObject var authenticationRegister: AuthenticationRegister
    @StateObject private var registerVM = RegisterViewModel()
    @EnvironmentObject var progressApp: ProgressApp
    var typeSocial: TypeSocialRegister = .unknow
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView (.vertical, showsIndicators: false) {
                    VStack {
                        Text(R.string.localizable.title_screen_register())
                            .font(.largeTitle)
                        
                        buildLable(geometry: geometry, text: R.string.localizable.label_your_email_screen_register())
                        .padding(.top, -20)
                        CustomTextField(geometry: geometry, textHint: R.string.localizable.hint_your_email_screen_register(), valueText: $registerVM.credentials.yourName)
                        
                        buildLable(geometry: geometry, text: R.string.localizable.label_name_screen_register())
                        CustomTextField(geometry: geometry, textHint: R.string.localizable.hint_name_screen_register(), valueText: $registerVM.credentials.name)
                        
                        buildLable(geometry: geometry, text: R.string.localizable.label_nick_name_screen_register())
                        CustomTextField(geometry: geometry, textHint: R.string.localizable.hint_nick_name_screen_register(), valueText: $registerVM.credentials.nickName)

                        buildLable(geometry: geometry, text: R.string.localizable.label_email_address_screen_register())
                        CustomTextField(geometry: geometry, textHint: R.string.localizable.hint_email_address_screen_register(), valueText: $registerVM.credentials.emailAddress)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .frame(width: geometry.size.width)
                    
                    VStack {
                        buildLable(geometry: geometry, text: R.string.localizable.label_password_screen_register())
                        CustomTextField(geometry: geometry, textHint: R.string.localizable.hint_password_screen_register(), valueText: $registerVM.credentials.password)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .frame(width: geometry.size.width)
                    
                    VStack {
                        // login button
                        HStack(alignment: .top, spacing: 10){
                            Button(action: {
                                // register
                                registerVM.postRegister(progressApp: progressApp){ isSuccess in
                                    authenticationRegister.updateValidation(success: isSuccess)
                                }
                            }, label: {
                                Text(R.string.localizable.string_button_register_screen_register()).foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .frame(
                                        minWidth: 0,
                                        maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center
                                    )
                            })
                            .padding(.trailing, 0)
                            .frame(width: geometry.size.width - 40, height: 40)
                            .background(registerVM.registerDisabled ? Color.gray : Color.red)
                            .cornerRadius(5)
                            .disabled(registerVM.registerDisabled)
                            
                        }
                        .frame(width: geometry.size.width - 40)
                        .padding(.top, 10)
                    }
                }
                .padding(.top, 10)
            }
            .frame(height: geometry.size.height)
        }
        .disabled(progressApp.isShowProgressView)
        .alert(item: $registerVM.error) { error in
            Alert(title: Text("Register Error"), message: Text(error.localizedDescription))
        }
    }
    
    @ViewBuilder func buildLable(geometry: GeometryProxy, text: String) -> some View {
        HStack(spacing: 10){
            // lable
            Text(text)
            Text("*")
        }
        .frame(width: geometry.size.width - 40, height: 20, alignment: .leading)
    }
    
    @ViewBuilder func CustomTextField(geometry: GeometryProxy, textHint: String, valueText: Binding<String>) -> some View {
        HStack {
            TextField(textHint, text: valueText)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                )
        }
        .frame(width: geometry.size.width - 40, height: 20, alignment: .leading)
        .padding([.top, .bottom], 15)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(tabbarRouter: TabBarRouter())
    }
}


struct LoadingViewRegister: View {
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
