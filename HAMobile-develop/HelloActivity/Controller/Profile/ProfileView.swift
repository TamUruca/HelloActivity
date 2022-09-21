//
//  ProfileView.swift
//  HelloActivity
//
//  Created by mac on 30/08/2022.
//

import SwiftUI

enum TypeButtonProfile {
    case applicationList
    case inbox
    case favorite
    case browsingHistory
    case reviews_submited
    case memberInformation
    case creditCartInformation
    case emailAddressChange
    case changePassword
    case setting
    case frequenrlyAskedQuestions
    case inquiry
    case withdraw
}

struct ProfileView: View {
    //@Binding var selection: Int
    @SceneStorage("selectedTab") var selection = 3
    @EnvironmentObject var tabbarRouter: TabBarRouter
    @StateObject private var loginVM: LogoutViewModel = LogoutViewModel()
    @EnvironmentObject var progressApp: ProgressApp
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                contentView(geometry: geometry)
            }
        }
    }
    
    @ViewBuilder func contentView(geometry: GeometryProxy) -> some View {
        VStack(alignment: .center, spacing: 10) {
            headerView(geometry: geometry)
            Divider()
            buttonActivity(geometry: geometry)
            Divider()
            buttonAccount(geometry: geometry)
            Divider()
            buttonsupport(geometry: geometry)
            Divider()
            buttonLogout(geometry: geometry)
        }
        .frame(width: geometry.size.width, alignment: .center)
    }
    
    @ViewBuilder func headerView(geometry: GeometryProxy) -> some View {
        VStack {
            VStack {
                Text("USER NAME")
                    .font(
                        .system(size: 22, weight: .bold)
                    )
                    .frame(alignment: .leading)
                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 0))
                Button {
                    print("view information")
                } label: {
                    ZStack {
                        Text(R.string.localizable.string_view_member_information_screen_profile())
                            .foregroundColor(.blue)
                        LineView(colorLine: .blue)
                            .frame(height: 1)
                            .padding(.top, 30)
                    }
                    .fixedSize()
                    .padding(EdgeInsets(top: -15, leading: -5, bottom: 0, trailing: 0))
                }
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .padding(.bottom, 10)
            
            Divider()
            
            HStack(spacing: 50) {
                Spacer()
                    Button {
                        print("string_application_list_screen_profile")
                    } label: {
                        VStack {
                            Image(systemName: "case")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.green)
                                .clipShape(Circle())
                            Text(R.string.localizable.string_application_list_screen_profile())
                        }
                    }
                ZStack {
                    Button {
                        showInboxView()
                       
                    } label: {
                        VStack {
                            Image(systemName: "envelope")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.blue)
                                .clipShape(Circle())
                            Text(R.string.localizable.string_inbox_screen_profile())
                        }
                    }
                    Button {
                        print("notifications....")
                    } label: {
                        ZStack {
                            Circle()
                                .strokeBorder(Color.blue,lineWidth: 0)
                                .background(Circle().foregroundColor(Color.red))
                                .frame(width: 20, height: 20, alignment: .topTrailing)
                            Text("13")
                                .font(.system(size: 15))
                                .foregroundColor(Color.white)
                        }
                        
                            
                    }
                    .offset(x: 25, y: -30)
                }
                Spacer()
            }
            .padding(.horizontal, 15)
        }
    }
    
    @ViewBuilder func buttonActivity(geometry: GeometryProxy) -> some View {
        VStack {
            Text(R.string.localizable.string_activity_screen_profile())
                .frame(width: geometry.size.width, alignment: .leading)
                .padding(.leading, 30)
                .foregroundColor(.gray)
            buildButtonProfileMain(type: .applicationList, geometry: geometry)
            buildButtonProfileMain(type: .inbox, geometry: geometry)
            buildButtonProfileMain(type: .favorite, geometry: geometry)
            buildButtonProfileMain(type: .browsingHistory, geometry: geometry)
            buildButtonProfileMain(type: .reviews_submited, geometry: geometry)
        }
    }
    
    @ViewBuilder func buttonAccount(geometry: GeometryProxy) -> some View {
        VStack {
            Text(R.string.localizable.string_account_screen_profile())
                .frame(width: geometry.size.width, alignment: .leading)
                .padding(.leading, 30)
                .foregroundColor(.gray)
            buildButtonProfileMain(type: .memberInformation, geometry: geometry)
            buildButtonProfileMain(type: .creditCartInformation, geometry: geometry)
            buildButtonProfileMain(type: .emailAddressChange, geometry: geometry)
            buildButtonProfileMain(type: .changePassword, geometry: geometry)
            buildButtonProfileMain(type: .setting, geometry: geometry)
        }
    }
    
    @ViewBuilder func buttonsupport(geometry: GeometryProxy) -> some View {
        VStack {
            Text(R.string.localizable.string_support_screen_profile())
                .frame(width: geometry.size.width, alignment: .leading)
                .padding(.leading, 30)
                .foregroundColor(.gray)
            buildButtonProfileMain(type: .frequenrlyAskedQuestions, geometry: geometry)
            buildButtonProfileMain(type: .inquiry, geometry: geometry)
            buildButtonProfileMain(type: .withdraw, geometry: geometry)
        }
    }
    
    @ViewBuilder func buildButtonProfileMain(type: TypeButtonProfile, geometry: GeometryProxy) -> some View {
        switch type {
        case .applicationList:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_application_list_screen_profile(), action: {
                print("string_button_application_list_screen_profile action")
            })
        case .inbox:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_inbox_screen_profile(), action: {
                print("string_button_inbox_screen_profile action")
            })
        case .favorite:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_favorite_screen_profile(), action: {
                print("string_button_favorite_screen_profile action")
            })
        case .browsingHistory:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_browsing_history_screen_profile(), action: {
                print("string_button_browsing_history_screen_profile action")
            })
        case .reviews_submited:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_reviews_submited_screen_profile(), action: {
                print("string_button_reviews_submited_screen_profile action")
            })
        case .memberInformation:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_member_information_screen_profile(), action: {
                print("string_button_member_information_screen_profile action")
            })
        case .creditCartInformation:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_credit_cart_information_screen_profile(), action: {
                print("string_button_credit_cart_information_screen_profile action")
            })
        case .emailAddressChange:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_email_address_change_screen_profile(), action: {
                print("string_button_email_address_change_screen_profile action")
            })
        case .changePassword:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_change_password_screen_profile(), action: {
                print("string_button_change_password_screen_profile action")
            })
        case .setting:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_setting_screen_profile(), action: {
                print("string_button_setting_screen_profile action")
            })
        case .frequenrlyAskedQuestions:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_frequenrly_asked_questions_screen_profile(), action: {
                print("string_button_frequenrly_asked_questions_screen_profile action")
            })
        case .inquiry:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_inquiry_screen_profile(), action: {
                print("string_button_inquiry_screen_profile action")
            })
        case .withdraw:
            buildButtonProfile(geometry: geometry, icon: R.image.ic_check_success()!, text: R.string.localizable.string_button_withdraw_screen_profile(), action: {
                print("string_button_withdraw_screen_profile action")
            })
        }
    }
    
    @ViewBuilder func buildButtonProfile(geometry: GeometryProxy, icon: UIImage, text: String,  action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack {
                Image(uiImage: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
                    .frame(width: 15, height: 15)
                    .padding(.top, 4)
                    .padding(.leading, 20)
                Text(text)
                    .frame(
                        minWidth: (geometry.size.width / 2) - 25,
                        maxWidth: .infinity, minHeight: 44, alignment: .leading
                    )
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
            }
        }
        .frame(width: geometry.size.width, height: 40, alignment: .leading)
    }
    
    @ViewBuilder func buttonLogout(geometry: GeometryProxy) -> some View {
        VStack() {
            Button {
                logout() 
            } label: {
                Text(R.string.localizable.string_button_logout_screen_profile())
                    .frame(
                        minWidth: (geometry.size.width / 2) - 40,
                        maxWidth: .infinity, minHeight: 40
                    )
                    .foregroundColor(.blue)
                    .padding(.leading, 0)
            }
            .frame(width: geometry.size.width - 40, height: 40, alignment: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.blue, lineWidth: 1)
            )
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
        }
    }
    
    func logout() {
        loginVM.postAPILogout(progressApp: progressApp){ isSuccess in
            if isSuccess {
                UserDefaultUtils.shared.delete(key: UserDefaultsKeys.token)
                tabbarRouter.currentPage = .login
            } else {
                print(loginVM.error?.errorDescription ?? "")
            }
        }
    }
    
    func showInboxView() {
        progressApp.isShowHeaderMainApp = false
        tabbarRouter.currentPage = .inbox
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct LineView: UIViewRepresentable {

    var colorLine: UIColor
    typealias UIViewType = UIView
    
    func makeUIView(context: UIViewRepresentableContext<LineView>) -> UIView {
        let view = UIView()
        view.backgroundColor = colorLine
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LineView>) {
        uiView.backgroundColor = colorLine
    }
}
