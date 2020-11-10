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
    var body: some View {
        NavigationView {
            Text("PreferencesView goes here.")
            
                .navigationTitle("Preferences")
        }
    }
}

@available(iOS 14.0, *)
struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
