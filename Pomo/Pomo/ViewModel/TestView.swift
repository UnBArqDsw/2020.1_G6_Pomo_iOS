//
//  TestView.swift
//  Pomo
//
//  Created by João Medeiros on 17/05/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct TestView: View {
    var columns = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                AlphaView()
                Divider()
                
                LazyVGrid(columns: columns) {
                    ForEach(sessionData, id: \.self) { session in
                        SessionGridView(session: session)
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle(Text("Sessions"))
            
        }
    }
}

@available(iOS 14.0, *)
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

struct Session: Identifiable, Equatable, Hashable {
    var id = UUID()
    var name: String
    var description: String
    var color: UIColor
    var icon: String
}

var sessionData = [
    Session(name: "Music", description: "2 hours and 45 minutes", color: #colorLiteral(red: 0.3624243657, green: 0.5161542337, blue: 0.8742916127, alpha: 1), icon: "music.note"),
    Session(name: "Math", description: "1 hour and 20 minutes", color: #colorLiteral(red: 0.3268991468, green: 0.6610265544, blue: 0.5774719788, alpha: 1), icon: "x.squareroot"),
    Session(name: "Coding", description: "4 hours and 30 minutes", color: #colorLiteral(red: 0.7804201749, green: 0.6376316827, blue: 0.3796870435, alpha: 1), icon: "chevron.left.slash.chevron.right"),
    Session(name: "Planning", description: "2 hours and 45 minutes", color: #colorLiteral(red: 0.7111469476, green: 0.5082620199, blue: 0.7908233485, alpha: 1), icon: "pencil.and.outline"),
    Session(name: "Writting", description: "2 hours and 45 minutes", color: #colorLiteral(red: 0.829966807, green: 0.4737551377, blue: 0.409722206, alpha: 1), icon: "keyboard")
]

var colors = [#colorLiteral(red: 0.3624243657, green: 0.5161542337, blue: 0.8742916127, alpha: 1), #colorLiteral(red: 0.3268991468, green: 0.6610265544, blue: 0.5774719788, alpha: 1), #colorLiteral(red: 0.7804201749, green: 0.6376316827, blue: 0.3796870435, alpha: 1), #colorLiteral(red: 0.7111469476, green: 0.5082620199, blue: 0.7908233485, alpha: 1), #colorLiteral(red: 0.829966807, green: 0.4737551377, blue: 0.409722206, alpha: 1)]

struct SessionGridView: View {
    var session: Session
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: session.icon)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.white.opacity(0.4))
                    .clipShape(Circle())
            }
            Spacer()
            Text(session.name)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            Text(session.description)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color.white.opacity(0.7))
        }
        .frame(maxWidth: 135)
        .frame(maxHeight: 100)
        .padding(15)
        .background(Color(session.color))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}

struct AlphaView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                SessionGridView(session: sessionData[2])
                    .contextMenu {
                        Text("Button 1")
                        Text("Button 1")
                        Text("Button 1")
                    }
                SessionGridView(session: sessionData[1])
            }
            
            HStack {
                SessionGridView(session: sessionData[3])
                SessionGridView(session: sessionData[0])
            }
            
            HStack {
                SessionGridView(session: sessionData[1])
                SessionGridView(session: sessionData[4])
            }
            
            HStack {
                SessionGridView(session: sessionData[0])
                SessionGridView(session: sessionData[2])
            }
        }
    }
}
