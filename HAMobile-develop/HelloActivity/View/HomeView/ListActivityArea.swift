//
//  ListActivityArea.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/15.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListActivityArea: View {
    
    @StateObject private var activityAreaVm = ActivityAreaViewModel()
    
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
                UIGrid(columns: 2, list: activityAreaVm.areaDatas ?? []) { area in
                    VStack {
                        WebImage(url: URL(string: area.photo ?? ""))
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .cornerRadius(10)
                        
                        HStack() {
                            Text(area.name ?? "")
                                .font(
                                    .system(size: 18, weight: .semibold)
                                )
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(area.activity_count ?? "")
                                .font(
                                    .system(size: 12)
                                )
                                .foregroundColor(.gray)
                                .lineLimit(1)
                                .padding(.leading, 20)
                                .frame(maxWidth: .infinity, alignment: .trailing)
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
        .onAppear {
            activityAreaVm.getListActivityArea()
        }
    }
}
