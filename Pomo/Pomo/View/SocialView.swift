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
    @State private var friends = ["marco", "andre", "arthur", "thallys"]
    
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
                
                VStack {
                    ForEach(friends, id: \.self) { friend in
                        FriendsView(imgName: friend)
                    }
                }
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
    var imgName: String
    var friendName: String
    var friendDesc: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .foregroundColor(Color(.systemGray3))
            
            HStack {
                Image(imgName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
    
                VStack {
                    Text("Name")
                        .font(.title2).bold()
                    Text("Name")
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: 300, maxHeight: 150)
    }
}


