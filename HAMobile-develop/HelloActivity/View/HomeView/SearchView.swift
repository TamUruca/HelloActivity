//
//  SearchView.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/20.
//

import SwiftUI

struct SearchView: View {
    
    @State private var name: String = "Tim"
    
    @State private var celsius: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack() {
                    Text("Search Activities")
                        .font(.largeTitle)
                    
                    TextField(R.string.localizable.hint_username_screen_login(), text: $name)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 1)
                        )
                    
                    TextField(R.string.localizable.hint_username_screen_login(), text: $name)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 1)
                        )
                    
                    TextField(R.string.localizable.hint_username_screen_login(), text: $name)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 1)
                        )
                    
                    TextField(R.string.localizable.hint_username_screen_login(), text: $name)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 1)
                        )
                    
                    Divider()
                    HStack {
                        Text("Opition")
                        Text("Opition")
                    }
                    
                    Slider(value: $celsius, in: -100...100)
                                Text("\(celsius, specifier: "%.1f") Celsius is \(celsius * 9 / 5 + 32, specifier: "%.1f") Fahrenheit")
                    
                    Button("Search") {
                        print("tap")
                    }
                    .background(Color.red)
                    
                }
                .padding(.horizontal, 15)
                .frame(width: geometry.size.width)
            }
        }
    }
}
