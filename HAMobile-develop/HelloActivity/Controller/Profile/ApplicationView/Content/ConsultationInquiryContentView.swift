//
//  PastCancelContentView.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/21/22.
//

import SwiftUI

struct ConsultationInquiryContentView: View {

    @EnvironmentObject var progressApp: ProgressApp
    let applicationList: [ApplicationItem] = {
        var array: [ApplicationItem] = []
        
        for i in 1...15 {
            let item = ApplicationItem(iconImage: "", title: "予約中", reservationNumber: "予約番号ST-000000000", country: "ハワイ・ホノルル", date: "2021年12月23日 10:00", description: "オプショナルツアータイトルを記載オプシ ョナルツアータイトルタイトルを記載", color: .yellow)
            array.append(item)
        }
        return array
    }()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // content scroll view
                contentScrollView(geometry)
            }
            .frame(height: geometry.size.height)
        }
        .disabled(progressApp.isShowProgressView)
    }
    
    //MARK: Views children
    
    fileprivate func contentScrollView(_ geometry: GeometryProxy) -> some View {
        return ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(applicationList, id: \.self) { item in
                    ApplicationListItemViewCustom(applicationItem: item)
                        .frame(width: geometry.size.width - 40, height: 350, alignment: .center)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                }
            }
        }
    }
}

struct ConsultationInquiryContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationInquiryContentView()
    }
}
