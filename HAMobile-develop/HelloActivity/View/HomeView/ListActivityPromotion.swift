//
//  ListActivityPromotion.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/16.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListActivityPromotion: View {
    
    @StateObject private var activityPromotionVm = ActivityPromotionViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 10)
                        .frame(width: 50)
                    Text("タイムセール")
                        .font(Font.largeTitle)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                
//                 Double List
                ForEach(activityPromotionVm.promotionData ?? [], id: \.self) { promotion in
                    VStack(alignment: .leading) {
                        VStack {
                            Text(promotion.name ?? "")
                                .bold()
                                .font(
                                    .system(size: 12)
                                )
                        }
                        .padding(.horizontal, 15)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(promotion.activities ?? [], id: \.self) { activity in
                                    VStack(alignment: .leading) {
                                        WebImage(url: URL(string: activity.displayImages.first ?? ""))
                                            .resizable()
                                            .aspectRatio(1, contentMode: .fit)
                                            .cornerRadius(10)

                                        Text("\(activity.areaName)")
                                            .foregroundColor(.gray)
                                            .font(
                                                .system(size: 12)
                                            )
                                            .lineLimit(2)

                                        Text("\(activity.title) \n")
                                            .bold()
                                            .lineLimit(2)
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.size.width/2, alignment: .leading)
                            }
                            .padding(.horizontal, 15)
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
            .padding(.bottom, 20)
        }
        .onAppear {
            self.activityPromotionVm.getListActivityArea()
        }
    }
}

