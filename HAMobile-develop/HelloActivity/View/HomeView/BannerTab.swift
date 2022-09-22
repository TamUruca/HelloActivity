//
//  BannerTab.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/15.
//

import SwiftUI

struct BannerTab: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .bottom) {
                    Image("banner")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    
                    Button {
                        isActive = true
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
                    
                    NavigationLink(
                        destination:SearchView()
                            .navigationBarTitle("")
                            .navigationBarHidden(true),
                        isActive: $isActive
                    ) { }
                }
                .navigationBarHidden(true)
                .navigationBarTitle(Text(""))
                .frame(width: geometry.size.width)
            }
        }
    }
}
