//
//  PreferencesView.swift
//  Pomo
//
//  Created by João Medeiros on 05/11/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct PreferencesView: View {
    @State private var profileName: String = "João Gabriel A."
    @State private var bioText: String = "Só agradece 🙏🏼"
    @State private var isPresenting = false
    var body: some View {
        ZStack {
            NavigationView {
                VStack() {
                    Image("mepic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .clipShape(Circle())
                    Text(profileName)
                        .font(.title2).bold()
                    Text(bioText)
                        .font(.callout)
                        .padding(.top, 5)
                    Divider()
                    Spacer()
                    
                    Button(action: { withAnimation { isPresenting.toggle() } }) {
                        ZStack {
                            Capsule().frame(width: 300, height: 50)
                            Text("Edit Profile")
                                .foregroundColor(.primary)
                        }
                        .foregroundColor(Color(.systemGray4))
                        
                    }
                    .padding(.vertical, 25)
                    
                        .navigationTitle("Preferences")
                }
            }
        }
        .fullScreenCover(isPresented: $isPresenting, content: {
            ChangePreferencesView(showAddModal: $isPresenting, name: $profileName, bio: $bioText)
        })
    }
}

@available(iOS 14.0, *)
struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}

@available(iOS 14.0, *)
struct ChangePreferencesView: View {
    @Binding var showAddModal: Bool
    @Binding var name: String
    @Binding var bio: String
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Update your name:", text: $name)
                TextField("Update your bio:", text: $bio)
            }
            .navigationBarItems(trailing: Button(action: { showAddModal = false }) {
                Text("Confirm")
            })
            .navigationTitle(Text("Update Profile"))
        }
        .accentColor(.red)
    }
}
