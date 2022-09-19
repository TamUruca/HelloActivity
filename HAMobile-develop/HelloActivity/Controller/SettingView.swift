//
//  SettingView.swift
//  HelloActivity
//
//  Created by mac on 30/08/2022.
//

import SwiftUI

struct SettingView: View {
    //@Binding var selection: Int
    @SceneStorage("selectedTab") var selection = 4
    @EnvironmentObject var tabbarRouter: TabBarRouter
    @State private var showGreeting = true
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                Text("Setting")
                    .font(.title)
                    .padding(.top, 25)
                Text("Title Setting")
                    .font(
                        .system(size: 22, weight: .semibold)
                    )
                    .frame(width: geometry.size.width - 30, alignment: .leading)
                    .padding(.top, 15)
                Divider()
                ForEach((0...2).reversed(), id: \.self) {_ in
                    Toggle("Opition toggle", isOn: $showGreeting)
                    Divider()
                }
                
                Text("GPS")
                    .font(
                        .system(size: 22, weight: .semibold)
                    )
                    .frame(width: geometry.size.width - 30, alignment: .leading)
                    .padding(.top, 30)
                Divider()
                HStack {
                    Text("GPS permission")
                    Spacer()
                    Button("Get >") {
                        print("tap")
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    .background(Color(red: 233 / 255, green: 233 / 255, blue: 233 / 255))
                    .foregroundColor(.black)
                    .font(
                        .system(size: 22)
                    )
                }
                Divider()
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 15)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
