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
                
                VStack {
                    ForEach(friends, id: \.self) { friend in
//                        FriendsView(imgName: friend.imgName, friendName: friend.name, friendDesc: friend.description)
                        Text("\(friend.name)")
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
                    Text(friendName)
                        .font(.title2).bold()
                    Text(friendDesc)
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: 300, maxHeight: 150)
    }
}

struct FriendsDemo: Hashable {
    let name: String
    let imgName: String
    var description: String
}

var friends: [FriendsDemo] = [FriendsDemo(name: "Marco Antonio", imgName: "marco", description: "Dois desafios abertos."), FriendsDemo(name: "André Eduardo", imgName: "andre", description: "2 derrotas."), FriendsDemo(name: "Arthur Rodrigues", imgName: "arthur", description: "1 desafio aberto."), FriendsDemo(name: "Thallys Braz", imgName: "thallys", description: "1 vitória e 1 derrota.")]
