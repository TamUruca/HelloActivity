//
//  ProfileView.swift
//  HelloActivity
//
//  Created by mac on 30/08/2022.
//

import SwiftUI

struct ProfileView: View {
    //@Binding var selection: Int
    @SceneStorage("selectedTab") var selection = 3
    @EnvironmentObject var tabbarRouter: TabBarRouter
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("USER NAME")
                        .font(
                            .system(size: 22, weight: .bold)
                        )
                        .frame(alignment: .leading)
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                    Text("Quy Nguyen")
                        .foregroundColor(.blue)
                    Divider()
                    
                    HStack(spacing: 50) {
                        Spacer()
                        VStack {
                            Image(systemName: "case")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.green)
                                .clipShape(Circle())
                            Text("text")
                        }
                        
                        VStack {
                            Image(systemName: "envelope")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.blue)
                                .clipShape(Circle())
                            Text("text")
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 15)
                    
                    Divider()
                    ForEach((0...2).reversed(), id: \.self) {
                        Text("Example text \($0)")
                            .font(
                                .system(size: 14)
                            )
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                        ForEach((0...3).reversed(), id: \.self) {_ in
                            HStack{
                                Image(systemName: "case")
                                Text("example text")
                            }
                        }
                        Divider()
                    }
                    HStack() {
                        Button("Button") {
                            print("tap")
                        }
                        .frame(width: geometry.size.width * 0.9 - 1, height: 40)
                        .foregroundColor(.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.blue, lineWidth: 1)
                        )
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                    }
                }
                .frame(width: geometry.size.width * 0.9)
                .padding(EdgeInsets(top: 0, leading: geometry.size.width * 0.05, bottom: 0, trailing: 0))
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
