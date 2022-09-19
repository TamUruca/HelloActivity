//
//  HomeView.swift
//  HelloActivity
//
//  Created by mac on 30/08/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    //@Binding var Category: Int
    @SceneStorage("selectedTab") var Category = 0
    @EnvironmentObject var tabbarRouter: TabBarRouter
    
    @ViewBuilder var bannerTab: some View {
        BannerTab()
    }
    
    @ViewBuilder var listTourPromotion: some View {
        ListTourPromotion()
    }
    
    @ViewBuilder var listTourArea: some View {
        ListTourArea()
    }
    
    @ViewBuilder var listTourTrending: some View {
        ListTourTrending()
    }
    
    @ViewBuilder var listTourNew: some View {
        ListTourNew()
    }
    
    @ViewBuilder var listTourFavorite: some View {
        ListTourFavorite()
    }
    
    @State var currentFill = 0
    let fillColor = Color(red: 69/255, green: 200/255, blue: 180/255)
    
    let categoryList = [
        CategoryItem(title: "Search", image: "magnifyingglass"),
        CategoryItem(title: "Promotion", image: "clock"),
        CategoryItem(title: "Area", image: "map"),
        CategoryItem(title: "Trending", image: "flame"),
        CategoryItem(title: "New", image: "n.circle"),
        CategoryItem(title: "♡ Favorite", image: "heart")
    ]
    
    @Binding var name: String {
        didSet {
            print(name)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                //Category
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(0..<categoryList.count) { index in
                            Button {
                                currentFill = index
                            } label: {
                                Image(systemName: categoryList[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal, 10)
                                    .frame(width: currentFill == index ? 40 : 0, alignment: .center)
                                Text(currentFill == index ? "" : categoryList[index].title)
                                    .font(
                                    .system(size: 17, weight: .semibold)
                                    )
                            }
                            .frame(height: 40)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                            .background(currentFill == index ? fillColor : .white)
                            .foregroundColor(currentFill == index ? .white : .black)
                            .animation(.easeInOut(duration: 0.1), value: currentFill == index)
                        }
                     }
                }
                .frame(height: 40)
                
                Divider()
                    .background(Color.black)
    //                .padding(EdgeInsets(top: 0, leading: 0, bottom: -8, trailing: 0))
               
                //Content
                ZStack {
                    bannerTab
                        .opacity(currentFill == 0 ? 1 : 0)
//                        .offset(x: currentFill == 0 ? 0 : -geometry.size.width)
//                        .animation(Animation.easeIn.delay(0.1))
                    
                    listTourPromotion
                        .opacity(currentFill == 1 ? 1 : 0)
//                        .offset(x: currentFill == 1 ? 0 : -geometry.size.width)
//                        .animation(Animation.easeIn.delay(0.1))
                    
                    listTourArea
                        .opacity(currentFill == 2 ? 1 : 0)
//                        .offset(x: currentFill == 2 ? 0 : -geometry.size.width)
//                        .animation(Animation.easeIn.delay(0.1))
                    
                    listTourTrending
                        .opacity(currentFill == 3 ? 1 : 0)
                    
                    listTourNew
                        .opacity(currentFill == 4 ? 1 : 0)
                    
                    listTourFavorite
                        .opacity(currentFill == 5 ? 1 : 0)
                    
                }
            }
            .frame(width: geometry.size.width)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(name: .constant("name"))
    }
}
