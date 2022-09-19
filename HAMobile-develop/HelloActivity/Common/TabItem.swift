//
//  TabItem.swift
//  HelloActivity
//
//  Created by mac on 30/08/2022.
//

import SwiftUI

struct FxTabItem: View {
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    @ObservedObject var tabbarRouter: TabBarRouter
    let assignedPage: Page
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(systemName: systemIconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .padding(.top, geometry.size.height/6)
    //            Text(tabName)
    //                .font(.footnote)
                Spacer()
            }
            .padding(.horizontal, -4)
            .foregroundColor(tabbarRouter.currentPage == assignedPage ? .blue : .black)
            .onTapGesture {
                tabbarRouter.currentPage = assignedPage
            }
        }
    }
}

struct FxPlusTabBarButton: View {
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: width, height: height)
                .shadow(radius: 4)
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width-6 , height: height-6)
                .foregroundColor(Color("PlusButtonColor"))
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            action()
        }
    }
}
