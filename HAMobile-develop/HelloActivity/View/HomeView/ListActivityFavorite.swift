//
//  ListActivityFavorite.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/16.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListActivityFavorite: View {
    
    let activitiesList = ActivityPageItem(activities: [
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        ActivityItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
    ], count: 1, currentPage: "1")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 10)
                        .frame(width: 50)
                    Text("お気に一覧")
                        .font(Font.largeTitle)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0))
                
//                 Custom Grid View
                UIGrid(columns: 2, list: activitiesList.activities ?? []) { activity in
                    VStack(alignment: .leading) {
                        WebImage(url: URL(string: activity.displayImages))
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .cornerRadius(10)
                        
                        Text("\(activity.areaName)、 ハワイ/ホノルル")
                            .foregroundColor(.gray)
                            .font(
                                .system(size: 12)
                            )
                            .lineLimit(2)

                        Text(activity.title + "\n")
                            .font(
                                .system(size: 18, weight: .semibold)
                            )
                            .lineLimit(2)
                    }
                }
                
                Button("もっと見つけます") {
                    print("Tìm kiếm thêm")
                }
                .font(.system(size: 18, weight: .semibold))
                .frame(width: UIScreen.main.bounds.size.width*0.6, height: 55)
                .foregroundColor(.blue)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 1)
                    )
                .padding(.vertical, 20)
            }
        }
    }
}

