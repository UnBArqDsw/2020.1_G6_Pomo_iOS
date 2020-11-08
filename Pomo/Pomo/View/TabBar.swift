//
//  TabBar.swift
//  Pomo
//
//  Created by João Medeiros on 21/05/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct TabBar: View {
    var body: some View {
        TabView {
            SessionView().tabItem {
                Image(systemName: "rectangle.fill.on.rectangle.angled.fill")
                Text("Focus Sessions")
            }
            StatsView().tabItem {
                Image(systemName: "chart.bar.xaxis")
                Text("Stats")
            }
            ContentView().tabItem {
                Image(systemName: "stopwatch.fill")
                Text("Pomodoro")
            }
            SocialView().tabItem {
                Image(systemName: "person.3.fill")
                Text("Social")
            }
            PreferencesView().tabItem {
                Image(systemName: "person.crop.circle")
                Text("Preferences")
            }
        }
        .accentColor(.pink)
    }
}

@available(iOS 14.0, *)
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
