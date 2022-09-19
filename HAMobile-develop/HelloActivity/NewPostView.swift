//
//  File.swift
//  HelloActivity
//
//  Created by mac on 30/08/2022.
//

import SwiftUI

struct NewPostView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Add a new post")
                .font(.largeTitle)
            Divider()
            Button {
                dismiss()
            } label: {
                Text("Dismiss")
            }

        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
