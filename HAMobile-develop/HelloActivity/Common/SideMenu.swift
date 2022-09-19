//
//  SideMenu.swift
//  HelloActivity
//
//  Created by mac on 31/08/2022.
//

import SwiftUI

enum SideMenuType: Hashable, Identifiable {
    var id: Self { self }
    
    case section
    case imageItem
    case item
}

struct SideMenuItem: Identifiable{
    var id = UUID()
    var type: SideMenuType?
    let title: String
}

let sideMenuList = [
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .section, title: "section"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .section, title: "Menu section test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .imageItem, title: "Image item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test"),
    SideMenuItem(type: .item, title: "Menu item test")
]

struct MenuContent: View {
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(sideMenuList) { item in
                        switch item.type {
                        case .section:
                            Text(item.title)
                                .frame(width: geometry.size.width, height: 50, alignment: .leading)
                                .padding(.leading, 30)
                                .font(
                                    .system(size: 16, weight: .semibold)
                                )
                                .foregroundColor(.gray)
                                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        case .imageItem:
                            VStack {
                                Image(systemName: "snowflake.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text(item.title)
                            }
                            .frame(width: geometry.size.width, height: 80, alignment: .center)
                            .font(
                                .system(size: 16, weight: .semibold)
                            )
                            .foregroundColor(.gray)
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        case .item:
                            Text(item.title)
                            .frame(width: geometry.size.width, height: 50, alignment: .leading)
                            .padding(.leading, 30)
                            .font(
                                .system(size: 16, weight: .semibold)
                            )
                        case .none:
                            Text(item.title)
                        }
                        Divider()
                    }
                }
                .frame(width: geometry.size.width)
            }
            .padding(.top)
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.2))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent()
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                
                Spacer()
            }
        }
    }
}
