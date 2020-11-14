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
        TabView(selection: $pageIndex) {
            VStack() {
                HStack {
                    Text("Social")
                        .font(.largeTitle).bold()
                        .offset(y: 32)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            pageIndex = 1
                        }
                    }) {
                        Image(systemName: "paperplane")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .offset(y: -10)
                }
                .padding()

                Spacer()
                
                FriendsView()
                Spacer()
                
            }
            .tag(0)
            
            Text("ChatView")
                .tag(1)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
    }
}

@available(iOS 14.0, *)
struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}

@available(iOS 14.0, *)
struct FriendsView: View {
    var body: some View {
        ZStack {
            Text("SocialView")
        }
    }
}
