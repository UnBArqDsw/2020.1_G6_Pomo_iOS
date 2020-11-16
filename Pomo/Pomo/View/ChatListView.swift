//
//  ChatListView.swift
//  Pomo
//
//  Created by João Medeiros on 16/11/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

struct ChatListView: View {
    @Binding var pageIndex: Int
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .offset(x: 10, y:23)
                    .padding(.leading, 13)
                    .font(.title)
                    .onTapGesture {
                        withAnimation {
                            pageIndex = 0
                        }
                    }
                Text("Chat")
                    .font(.largeTitle).bold()
                    .frame(width: 100, height: 100)
                    .offset(y: 23)
                Spacer()
            }
            List {
                ForEach(friends, id: \.self) { item in
                    ButtonLinkView(chatName: item.name)
                }
                
            }
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView(pageIndex: .constant(1))
    }
}

struct ButtonLinkView: View {
    var chatName: String
    var body: some View {
        HStack {
            Text(chatName)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.pink)
        }
    }
}
