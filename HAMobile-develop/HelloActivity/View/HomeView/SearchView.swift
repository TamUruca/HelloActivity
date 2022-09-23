//
//  SearchView.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/20.
//

import SwiftUI

struct SearchView: View {
    
    @State private var area: String = ""
    @State private var time: String = ""
    @State private var number: String = ""
    @State private var price: String = ""
    
    let tag = ["longg text", "nor text", "text", "longggg textt", "longggg texttt", "longg text", "nor text", "text", "longggg textt", "longggg texttt"]
    
    @State private var celsius: Double = 0
    @ObservedObject var slider = CustomSlider(start: 0, end: 100)
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 15) {
                    Text("アクティビティを探す")
                        .font(Font.largeTitle)
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                    
                    VStack(spacing: 10) {
                        TextField(R.string.localizable.hint_username_screen_login(), text: $area)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1)
                            )
                        
                        TextField(R.string.localizable.hint_username_screen_login(), text: $time)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1)
                            )
                        
                        TextField(R.string.localizable.hint_username_screen_login(), text: $number)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1)
                            )

                        TextField(R.string.localizable.hint_username_screen_login(), text: $price)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }
                    
                    Divider()
                    VStack(alignment: .trailing) {
                        HStack {
                            Text("Opition")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Opition")
                        }
                        
                        HStack {
                            Text("Opition")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 20)
                        }
                        HStack {
                            Text("Opition")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 20)
                        }
                        HStack {
                            Text("Opition")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 20)
                        }
                        Divider()
                    }
                    
                    FlexibleView(availableWidth: geometry.size.width, data: tag, spacing: 15, alignment: .leading) { item in
                        Text(item)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.2))
                            )
                            .onTapGesture {
                                print(item)
                            }
                    }
                    Divider()
                    
                    FlexibleView(availableWidth: UIScreen.main.bounds.width, data: tag, spacing: 15, alignment: .leading) { item in
                        Text(item)
                                  .padding(8)
                                  .background(
                                    RoundedRectangle(cornerRadius: 8)
                                      .fill(Color.gray.opacity(0.2))
                                   )
                                  .onTapGesture {
                                      print(item)
                                  }
                    }
                    Divider()
                    
                    VStack {
                        Text("Value: " + slider.valueBetween)
                        Text("Percentages: " + slider.percentagesBetween)
                        
                        Text("High Value: \(Int(slider.highHandle.currentValue))")
                        Text("Low Value: \(Int(slider.lowHandle.currentValue))")
                        
                        //Slider
                        SliderView(slider: slider)
                        
                        Slider(value: $celsius, in: 0...100)
                                    Text("\(Int(celsius)) Celsius is \(celsius * 9 / 5 + 32, specifier: "%.1f") Fahrenheit")
                    }
                    
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
