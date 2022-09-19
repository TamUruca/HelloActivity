//
//  ListTourArea.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/15.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListTourArea: View {
    
    let toursList = TourPageItem(activities: [
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
        TourItem(areaName: "Hawaii", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", displayImages: "https://d3r0o7svow7zdi.cloudfront.net/upload/2018/11/5bed39ebc97f5.jpg"),
    ], count: 1, currentPage: "1")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 10)
                        .frame(width: 50)
                    Text("エリア")
                        .font(Font.largeTitle)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0))
                
//                 Custom Grid View
                UIGrid(columns: 2, list: toursList.activities ?? []) { activity in
                    VStack {
                        WebImage(url: URL(string: activity.displayImages))
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .cornerRadius(10)
                        
                        HStack {
                            Text(activity.title + "\n")
                                .font(
                                    .system(size: 18, weight: .semibold)
                                )
                                .lineLimit(1)
                            
                            Text("201#")
                                .font(
                                    .system(size: 12)
                                )
                                .foregroundColor(.gray)
                                .lineLimit(1)
                                .padding(.leading, 20)
                        }
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
