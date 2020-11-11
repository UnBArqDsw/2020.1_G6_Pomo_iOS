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
    var body: some View {
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
                
                Button(action: {}) {
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
}

@available(iOS 14.0, *)
struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
