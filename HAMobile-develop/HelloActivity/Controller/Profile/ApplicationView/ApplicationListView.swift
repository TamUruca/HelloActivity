//
//  InboxView.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/21/22.
//

import SwiftUI

enum TypeItemInbox1 {
    case normal
    case unRead
    case read
    
    var color: Color {
        switch self {
        case .normal:
            return .gray
        case .unRead:
            return .red
        case .read:
            return .blue
        }
    }
}

struct ApplicationListView: View {

    @ObservedObject var tabbarRouter: TabBarRouter
    @StateObject private var registerVM = RegisterViewModel()
    @EnvironmentObject var progressApp: ProgressApp
    let applicationListMenu = [R.string.localizable.menu_item_application_list_screen_application_list(),
                               R.string.localizable.menu_item_past_cancen_screen_application_list(),
                               R.string.localizable.menu_item_consultation_inquiry_screen_application_list()]
    @State var currentIndex = 0
    @State var menuCurrentIndex = 0
    
    @ViewBuilder var applicationListContentView: some View {
        ApplicationListContentView()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                headerTitleView(geometry)
                headerDescriptionView(geometry)
                headerMenuView(geometry)
                ZStack {
                    applicationListContentView
                        .opacity(currentIndex == 0 ? 1 : 0)
                }
            }
            .frame(height: geometry.size.height)
        }
        .disabled(progressApp.isShowProgressView)
        .alert(item: $registerVM.error) { error in
            Alert(title: Text("Register Error"), message: Text(error.localizedDescription))
        }
    }
    
    //MARK: Views children
    fileprivate func headerTitleView(_ geometry: GeometryProxy) -> some View {
        return ZStack {
            Text(R.string.localizable.title_screen_application_list())
                .font(.system(size: 25))
            LineView(colorLine: .gray)
                .frame(height: 1)
                .padding(.top, 60)
            Button {
                back()
            } label: {
                Image(uiImage: R.image.ic_check_success()!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 10)
                    .frame(width: 30, height: 30)
            }
            .frame(width: geometry.size.width, alignment: .leading)
        }
        .frame(width: geometry.size.width)
    }
    
//    fileprivate func headerMenuView(_ geometry: GeometryProxy) -> some View {
//        return ZStack{
//            LineView(colorLine: .gray)
//                .frame(height: 1)
//                .padding(.top, 15)
//                .frame(width: geometry.size.width - 80, height: 50)
//            HStack {
//                    ForEach(0..<applicationListMenu.count) { index in
//                        if index != 0 {
//                            Spacer()
//                        }
//                        Button {
//                            currentIndex = index
//                        } label: {
//                            ZStack {
//                                Text(applicationListMenu[index])
//                                    .foregroundColor(.blue)
//                                    .foregroundColor(currentIndex == index ? .red : .gray)
//                                LineView(colorLine: .red)
//                                    .frame(height: 1)
//                                    .padding(.top, 30)
//                                    .opacity(currentIndex == index ? 1 : 0)
//                            }
//                            .fixedSize()
//                            .padding(EdgeInsets(top: -15, leading: -5, bottom: 0, trailing: 0))
//                        }
//                    }
//            }
//            .frame(width: geometry.size.width - 80, height: 50)
//
//        }
//    }
    
    fileprivate func headerMenuView(_ geometry: GeometryProxy) -> some View {
        return VStack{
            ApplicationListMenuViewCustom(indexItem: $menuCurrentIndex)
                .frame(width: geometry.size.width - 40, height: 50)
        }
    }
    
    fileprivate func headerDescriptionView(_ geometry: GeometryProxy) -> some View {
        return HStack {
            
            Text(R.string.localizable.title_screen_application_list())
                .font(.system(size: 24))
                .foregroundColor(.black)
                .padding(.leading, 20)
            Spacer()
            Text("件数 : 2件")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .padding(.trailing, 20)
        }
        .frame(width: geometry.size.width, height: 30)
        .padding(.top, 10)
    }
    
    func back() {
        progressApp.isShowHeaderMainApp = true
        tabbarRouter.currentPage = .profile
    }
}

struct ApplicationListView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationListView(tabbarRouter: TabBarRouter())
    }
}
