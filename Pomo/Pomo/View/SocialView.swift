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
    @State private var searchText: String = ""
    @ObservedObject private var searchControllerProvider = SearchControllerProvider()
    @State private var isSearching = false
    
    var body: some View {
        TabView(selection: $pageIndex) {
            VStack() {
                ScrollView {
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
                    .padding(.bottom)
                    
                    HStack {
                        HStack {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(.systemGray3))
                            
                            TextField("Search", text: $searchText)
                            

                        }
                        .frame(width: isSearching ? 300 : 350, height: 35, alignment: .center)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .offset(x: isSearching ? -5 : 0)
                        .onTapGesture {
                            withAnimation {
                                isSearching = true
                            }
                        }
                        
                        if isSearching {
                            Button(action: { isSearching.toggle() }) {
                                Text("Cancel")
                            }
                        }
                        
                    }
                    .animation(.easeInOut)
//                    .padding(.horizontal)
                    
                    
                    Spacer()
                    
                    VStack(spacing: 1) {
                        ForEach(friends.filter {
                            searchText.isEmpty || $0.name.contains(searchText)
                        }, id: \.self) { friend in
                            FriendsView(imgName: friend.imgName, friendName: friend.name, friendDesc: friend.description)
                            
                        }
                        .padding()
                    }
                    Spacer()
                    
                }
            }
            .tag(0)
            
            ChatView()
                .tag(1)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .accentColor(.pink)
        
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
                .foregroundColor(Color(.systemGray5))
            
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
        .frame(maxWidth: 340, maxHeight: 100)
    }
}

@available(iOS 14.0, *)
struct ChatView: View {
    var body: some View {
        Text("ChatView")
    }
}

struct FriendsDemo: Hashable {
    let name: String
    let imgName: String
    var description: String
}

var friends: [FriendsDemo] = [FriendsDemo(name: "Marco Antonio", imgName: "marco", description: "Dois desafios abertos."), FriendsDemo(name: "André Eduardo", imgName: "andre", description: "2 derrotas."), FriendsDemo(name: "Arthur Rodrigues", imgName: "arthur", description: "1 desafio aberto."), FriendsDemo(name: "Thallys Braz", imgName: "thallys", description: "1 vitória e 1 derrota.")]
