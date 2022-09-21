//
//  ApplicationListContentView.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/21/22.
//

import SwiftUI

struct ApplicationListContentView: View {

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
                // content scroll view
                contentScrollView(geometry)
            }
            .frame(height: geometry.size.height)
        }
        .disabled(progressApp.isShowProgressView)
    }
    
    //MARK: Views children
    
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
}

struct ApplicationListContentView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationListContentView()
    }
}
