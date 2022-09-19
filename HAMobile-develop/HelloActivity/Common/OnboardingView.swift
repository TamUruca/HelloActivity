//
//  OnboardingView.swift
//  HelloActivity
//
//  Created by mac on 07/09/2022.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isActive = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Spacer()
                    Image("slogan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.7)
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.8)
                    
                    Spacer()
                    
                    Button("Get Started") {
                        isActive = true
                        UserDefaults.standard.set(true, forKey: "IsShowedOnboarding")
                    }
                    .frame(width: geometry.size.width * 0.6, height: 60)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(30, antialiased: true)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                    .font(
                        .system(size: 20, weight: .semibold)
                    )
                    
                    NavigationLink(
                        destination:ContentView()
                            .navigationBarTitle("")
                            .navigationBarHidden(true),
                        isActive: $isActive
                    ) { }
                }
            }
        }
    }
}



