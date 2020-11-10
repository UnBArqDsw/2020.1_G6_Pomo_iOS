//
//  StatsView.swift
//  Pomo
//
//  Created by João Medeiros on 05/11/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct StatsView: View {
    var body: some View {
        NavigationView {
            Text("Stats Go Here!")
            
                .navigationTitle("Stats")
        }
    }
}

@available(iOS 14.0, *)
struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
