//
//  ContentView.swift
//  Pomo
//
//  Created by João Medeiros on 14/05/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                TimerView()
                Spacer()
            }
            .padding(.top, 40)
            .onAppear {
                UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
