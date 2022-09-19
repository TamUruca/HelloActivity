//
//  JobView.swift
//  HelloActivity
//
//  Created by mac on 30/08/2022.
//

import SwiftUI

struct JobView: View {
    //@Binding var selection: Int
    @SceneStorage("selectedTab") var selection = 1
    @EnvironmentObject var tabbarRouter: TabBarRouter
    @State private var date = Date()
    
    var body: some View {
        VStack {
            DatePicker("", selection: $date)
              .datePickerStyle(GraphicalDatePickerStyle())
              .accentColor(.red)
              .environment(\.locale, Locale.init(identifier: "ja_JP"))
        }
    }
}

struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView()
    }
}

//extension View {
//  @ViewBuilder func applyTextColor(_ color: Color) -> some View {
//      self.colorInvert().colorMultiply(color)
//  }
//}
