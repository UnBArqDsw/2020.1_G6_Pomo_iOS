//
//  SocialView.swift
//  Pomo
//
//  Created by João Medeiros on 05/11/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct SocialView: View {
    @State private var pageIndex = 0
    var body: some View {
        VStack {
            NavigationView {
                Text("SocialView")
                    .navigationTitle("Social")
                    .navigationBarItems(trailing: Button(action: {}) {
                        Image(systemName: "paperplane")
                            .font(.title)
                            .foregroundColor(.primary)
                    })
            }
        }
    }
}

@available(iOS 14.0, *)
struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
