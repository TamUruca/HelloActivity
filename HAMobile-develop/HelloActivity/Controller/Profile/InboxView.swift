//
//  InboxView.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/21/22.
//

import SwiftUI

enum TypeItemInbox {
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

struct InboxView: View {

    @ObservedObject var tabbarRouter: TabBarRouter
    @StateObject private var registerVM = RegisterViewModel()
    @EnvironmentObject var progressApp: ProgressApp
    let inboxList: [InboxItem] = {
        var array: [InboxItem] = []
        
        for i in 1...15 {
            let item = InboxItem(activityName: "chat1", activityStatus: 0, activityId: "ST-ST-001", inboxContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", inboxImage: "banner", inboxTime: "10:21", typeInboxItem: (i%2) == 0 ? .read : .normal)
            array.append(item)
        }
        return array
    }()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // header title view
                headerTitleView(geometry)
                // content scroll view
                contentScrollView(geometry)
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
    
    //MARK: Views children
    fileprivate func headerTitleView(_ geometry: GeometryProxy) -> some View {
        return ZStack {
            Text(R.string.localizable.title_screen_inbox())
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
    
    fileprivate func contentScrollView(_ geometry: GeometryProxy) -> some View {
        return ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(inboxList, id: \.self) { item in
                    itemView(item)
                    .frame(height: 110)
                    Divider()
                }
            }
            
        }
    }
    
    fileprivate func itemView(_ item: InboxItem) -> some View {
        return VStack {
            Spacer()
            Button {
                print("action ...\(item.activityName)")
            } label: {
                HStack {
                    Image(item.inboxImage)
                        .resizable()
                        .frame(width: 75, height: 75)
                        .cornerRadius(10, antialiased: true)
                    
                    VStack {
                        HStack {
                            let color = item.typeInboxItem.color
                            Text(item.activityName)
                                .foregroundColor(color)
                                .padding(EdgeInsets(top: 1, leading: 8, bottom: 1, trailing: 8))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(color, lineWidth: 1)
                                )
                                .font(
                                    .system(size: 15)
                                )
                            Text(item.activityId)
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                            Spacer()
                            Text(item.inboxTime)
                                .foregroundColor(.gray)
                                .font(
                                    .system(size: 15)
                                )
                        }
                        Text(item.inboxContent)
                            .font(
                                .system(size: 18, weight: .semibold)
                            )
                            .foregroundColor(.black)
                            .lineSpacing(3)
                    }
                    .frame(alignment: .leading)
                    .padding(.leading, 10)
                }
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 25))

            }
            Spacer()
        }
    }
    
    func back() {
        progressApp.isShowHeaderMainApp = true
        tabbarRouter.currentPage = .profile
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(tabbarRouter: TabBarRouter())
    }
}
