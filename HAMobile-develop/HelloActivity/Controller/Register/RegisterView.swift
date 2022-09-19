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
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView (.vertical, showsIndicators: false) {
                    VStack {
                        Text("Register")
                            .font(.largeTitle)
                        
                        buildLable(geometry: geometry, text: "Your email")
                        .padding(.top, -20)
                        CustomTextField(geometry: geometry, textHint: "enter email", valueText: $registerVM.credentials.yourName)
                        
                        buildLable(geometry: geometry, text: "Name")
                        CustomTextField(geometry: geometry, textHint: "enter name", valueText: $registerVM.credentials.name)
                        
                        buildLable(geometry: geometry, text: "NickName")
                        CustomTextField(geometry: geometry, textHint: "enter nickName", valueText: $registerVM.credentials.nickName)

                        buildLable(geometry: geometry, text: "EmailAddress")
                        CustomTextField(geometry: geometry, textHint: "enter emailAddress", valueText: $registerVM.credentials.emailAddress)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .frame(width: geometry.size.width)
                    
                    VStack {
                        buildLable(geometry: geometry, text: "Password")
                        CustomTextField(geometry: geometry, textHint: "enter password", valueText: $registerVM.credentials.password)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .frame(width: geometry.size.width)
                    
                    VStack {
                        // login button
                        HStack(alignment: .top, spacing: 10){
                            Button(action: {
                                // register
                                registerVM.postRegister{ isSuccess in
                                    authenticationRegister.updateValidation(success: isSuccess)
                                }
                            }, label: {
                                Text("ログイン").foregroundColor(.white)
                                    .font(.system(size: 16))
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
                
                if registerVM.iSShowProgressView {
                    LoadingView()
                        .background(Color.white)
                        .opacity(0.5)
                }
            }
            .frame(height: geometry.size.height)
        }
        .disabled(registerVM.iSShowProgressView)
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

struct CustomTextField123: View {
    @Binding var text: String
    
    var body: some View {
        
        TextField("メールアドレス", text: $text)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 1)
            )
    }
}
