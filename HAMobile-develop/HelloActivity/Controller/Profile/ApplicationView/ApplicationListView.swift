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
    @State var menuCurrentIndex = 0
    
    @ViewBuilder var applicationListContentView: some View {
        ApplicationListContentView()
    }
    
    @ViewBuilder var pastCancelContentView: some View {
        PastCancelContentView()
    }
    
    @ViewBuilder var consultationInquiryContentView: some View {
        ConsultationInquiryContentView()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                headerTitleView(geometry)
                headerDescriptionView(geometry)
                headerMenuView(geometry)
                ZStack {
                    applicationListContentView
                        .opacity(menuCurrentIndex == 0 ? 1 : 0)
                    pastCancelContentView
                        .opacity(menuCurrentIndex == 1 ? 1 : 0)
                    consultationInquiryContentView
                        .opacity(menuCurrentIndex == 2 ? 1 : 0)
                }
            }
            .frame(height: geometry.size.height)
            .background(Color.white)
            .padding(.top, -1)
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
                Image(uiImage: R.image.ic_back()!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 10)
                    .frame(width: 40, height: 40)
            }
            .frame(width: geometry.size.width, alignment: .leading)
        }
        .frame(width: geometry.size.width)
    }
    
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
