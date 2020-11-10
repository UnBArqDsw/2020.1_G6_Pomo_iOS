//
//  StatsView.swift
//  Pomo
//
//  Created by João Medeiros on 05/11/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI
import SwiftUICharts

@available(iOS 14.0, *)
struct StatsView: View {
    @FetchRequest(fetchRequest: SessionItem.getAllSessionItems()) var sessionItems: FetchedResults<SessionItem>
    
    var columns = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(sessionItems, id: \.self) { item in
                        LineChartView(data: [10, 12, 9, 2, 5, 13, 16], title: item.name!, legend: item.sessionDescription!, style: Styles.lineChartStylePomo, dropShadow: false)
                        
                    }
                }
                .navigationTitle("Stats")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
        }
    }
}

@available(iOS 14.0, *)
struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
