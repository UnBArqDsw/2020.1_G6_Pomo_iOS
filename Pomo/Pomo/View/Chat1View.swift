//
//  Chat1View.swift
//  Pomo
//
//  Created by João Medeiros on 16/11/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI
import SwiftyChat

struct Chat1View: View {
    @State var messages: [MockMessages.ChatMessageItem] = MockMessages.generateMessage(kind: .Text, count: 20)
        
        // MARK: - InputBarView variables
        @State private var message = ""
        @State private var isEditing = false
        
        var body: some View {
            chatView
        }
        
        private var chatView: some View {
            ChatView<MockMessages.ChatMessageItem, MockMessages.ChatUserItem>(messages: $messages) {

                BasicInputView(
                    message: $message,
                    isEditing: $isEditing,
                    placeholder: "Type something",
                    onCommit: { messageKind in
                        self.messages.append(
                            .init(user: MockMessages.sender, messageKind: messageKind, isSender: true)
                        )
                    }
                )
                .padding(8)
                .padding(.bottom, isEditing ? 0 : 8)
                .accentColor(.chatBlue)
                .background(Color.primary.colorInvert())
                .animation(.linear)
                .embedInAnyView()
                
            }
            
            .environmentObject(ChatMessageCellStyle.basicStyle)
            .navigationBarTitle("Basic")
            .listStyle(PlainListStyle())
        }
}

struct Chat1View_Previews: PreviewProvider {
    static var previews: some View {
        Chat1View()
    }
}
