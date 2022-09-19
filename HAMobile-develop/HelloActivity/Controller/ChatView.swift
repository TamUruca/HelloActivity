//
//  ChatView.swift
//  HelloActivity
//
//  Created by mac on 30/08/2022.
//

import SwiftUI

struct ChatView: View {
    //@Binding var selection: Int
    @SceneStorage("selectedTab") var selection = 2
    @EnvironmentObject var tabbarRouter: TabBarRouter
    
    let chatList = [
        ChatItem(activityName: "chat1", activityStatus: 0, activityId: "ST-ST-001", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21"),
        ChatItem(activityName: "chat id 2", activityStatus: 1, activityId: "ST-002", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21"),
        ChatItem(activityName: "chat3", activityStatus: 2, activityId: "ST-003", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21"),
        ChatItem(activityName: "chat4", activityStatus: 0, activityId: "ST-004", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21"),
        ChatItem(activityName: "chat5 name", activityStatus: 1, activityId: "ST-005", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21"),
        ChatItem(activityName: "chat6", activityStatus: 2, activityId: "ST-006", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21"),
        ChatItem(activityName: "chat7", activityStatus: 0, activityId: "ST-007", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21"),
        ChatItem(activityName: "chat8", activityStatus: 1, activityId: "ST-008", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21"),
        ChatItem(activityName: "chat9", activityStatus: 2, activityId: "ST-009", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21"),
        ChatItem(activityName: "chat10", activityStatus: 0, activityId: "ST-0010", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21"),
        ChatItem(activityName: "chat11", activityStatus: 1, activityId: "ST-0011", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21"),
        ChatItem(activityName: "chat12", activityStatus: 2, activityId: "ST-0012", chatContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15ST-00s,", chatImage: "banner", chatTime: "10:21")
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(chatList, id: \.self) { chat in
                    VStack {
                        Spacer()
                        HStack {
                            Image(chat.chatImage)
                                .resizable()
                                .frame(width: 75, height: 75)
                                .cornerRadius(10, antialiased: true)
                            
                            VStack {
                                HStack {
                                    Text(chat.activityName)
                                        .foregroundColor(.gray)
                                        .padding(EdgeInsets(top: 1, leading: 8, bottom: 1, trailing: 8))
                                        .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(.gray, lineWidth: 1)
                                            )
                                        .font(
                                            .system(size: 15)
                                        )
                                    Text(chat.activityId)
                                        .foregroundColor(.gray)
                                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                    Spacer()
                                    Text(chat.chatTime)
                                        .foregroundColor(.gray)
                                        .font(
                                            .system(size: 15)
                                        )
                                }
                                Text(chat.chatContent)
                                    .font(
                                       .system(size: 18, weight: .semibold)
                                    )
                                    .lineLimit(2)
                                    .lineSpacing(3)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 15))
                        Spacer()
                    }
                    .frame(height: 110)
                    Divider()
                }
            }

        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
