//
//  BannerTab.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/15.
//

import SwiftUI

struct BannerTab: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                
                Button {
                    print("Edit button was tapped")
                } label: {
                    Label("Tap to search", systemImage: "magnifyingglass")
                }
                .font(
                    .system(size: 20, weight: .semibold)
                )
                .frame(width: geometry.size.width*0.75, height: geometry.size.width*0.14, alignment: .center)
                .background(Color(red: 255, green: 0, blue: 0))
                .cornerRadius(geometry.size.width*0.07)
                .foregroundColor(.white)
                .padding(.bottom, 60)
            }
            .frame(width: geometry.size.width)
        }
    }
}
