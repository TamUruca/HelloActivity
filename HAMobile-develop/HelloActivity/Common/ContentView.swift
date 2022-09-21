//
//  ContentView.swift
//  HelloActivity
//
//  Created by mac on 26/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var tabbarRouter = TabBarRouter()
    @StateObject var progressApp = ProgressApp()
    
    @State var isShowPopUp = false
    
    @State var name = ""
    
    @State var menuOpen: Bool = false
    
    @State var colorToUpdate = Color.gray
    
    @State var token = ""
    
    @ViewBuilder var contentView: some View {
        
        switch tabbarRouter.currentPage {
        case .home:
            HomeView(name: $name).environmentObject(tabbarRouter)
        case .job:
            JobView().environmentObject(tabbarRouter)
        case .chat:
            ChatView().environmentObject(tabbarRouter)
        case .profile:
            ProfileView()
                .environmentObject(tabbarRouter)
                .environmentObject(progressApp)
        case .setting:
            SettingView().environmentObject(tabbarRouter)
        case .notification:
            NotificationView().environmentObject(tabbarRouter)
        case .login:
            LoginView(tabbarRouter: tabbarRouter)
                .environmentObject(tabbarRouter)
                .environmentObject(progressApp)
        case .newRegister:
            RegisterView(tabbarRouter: tabbarRouter)
                .environmentObject(tabbarRouter)
                .environmentObject(progressApp)
        case .inbox:
            InboxView(tabbarRouter: tabbarRouter)
                .environmentObject(tabbarRouter)
                .environmentObject(progressApp)
        }
    }
    
    fileprivate func headerMainApp(_ geometry: GeometryProxy) -> some View {
        return NavigationView {
            VStack {
                Spacer()
            }
            .navigationBarTitle(
                Text("")
                , displayMode: .inline)
            .navigationBarItems(
                leading:
                    HStack {
                        if !self.menuOpen {
                            Button(action: {
                                self.openMenu()
                            }) {
                                Image(systemName: "list.dash")
                                    .font(.title2)
                            }.foregroundColor(.black)
                        }
                    },
                trailing:
                    HStack {
                        Button(action: {
                            tabbarRouter.currentPage = .notification
                        }) {
                            Image(systemName: "bell.badge")
                                .font(.title2)
                        }.foregroundColor(.black)
                    })
            .navigationBarTitle(Text("Names"))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.4)
                    }
                }
                
            }
        }
        .frame(height: progressApp.isShowHeaderMainApp ? geometry.size.height/16 : 0, alignment: .top)
    }
    
    fileprivate func showMainView(_ geometry: GeometryProxy) -> some View {
        return VStack(spacing: 0) {
            
            headerMainApp(geometry)
            
            Divider().background(Color.black)
            
            VStack(spacing: 0) {
                contentView
                    .frame(width: geometry.size.width)
                    .fixedSize(horizontal: false, vertical: false)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: -9, trailing: 0))
                Spacer()
                Divider().background(Color.black)
                // Tabbar
                HStack {
                    FxTabItem(width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "homekit", tabName: "[TOP]", tabbarRouter: tabbarRouter, assignedPage: .home)
                    FxTabItem(width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "case", tabName: "Case", tabbarRouter: tabbarRouter, assignedPage: .job)
                    FxTabItem(width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "envelope", tabName: "[受信トレイ]", tabbarRouter: tabbarRouter, assignedPage: .chat)
                    FxTabItem(width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "person", tabName: "[マイページ]", tabbarRouter: tabbarRouter, assignedPage: checkLogin())
                    FxTabItem(width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "gearshape", tabName: "[設定]", tabbarRouter: tabbarRouter, assignedPage: .setting)
                }
                .frame(width: geometry.size.width, height: geometry.size.height/10)
                .background(Color("TabBarBackground").shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                showMainView(geometry)
                
                if progressApp.isShowProgressView {
                    withAnimation {
                        LoadingView()
                    }
                }
            }
            SideMenu(
                width: geometry.size.width*0.8,
                isOpen: self.menuOpen,
                menuClose: self.openMenu
            )
        }
        .onAppear {
//            UserDefaultUtils.shared.delete(key: UserDefaultsKeys.fcmToken)
//            UserDefaultUtils.shared.delete(key: UserDefaultsKeys.loginSocial)
//            UserDefaultUtils.shared.delete(key: UserDefaultsKeys.token)
        }
    }
    
    func openMenu() {
        self.menuOpen.toggle()
    }
    
    func checkLogin() -> Page {
        guard let _ = UserDefaultUtils.shared.get(key: UserDefaultsKeys.token)  else {
            return .login
        }
        return .profile
    }
}

struct MyTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.3))
    }
}
