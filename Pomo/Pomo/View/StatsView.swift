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
    @State private var searchText: String = ""
    @ObservedObject private var searchControllerProvider = SearchControllerProvider()
    
    var columns = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40) {
                    ForEach(sessionItems.filter{
                        searchControllerProvider.searchText.isEmpty || $0.name!.localizedStandardContains(searchControllerProvider.searchText)
                    }, id: \.self) { item in
                        LineChartView(data: demoData.randomElement()!, title: item.name!, legend: item.sessionDescription!, style: Styles.lineChartStylePomo, dropShadow: false)
                        
                    }
                    .padding()
                }
                .navigationTitle("Stats")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .overlay(ViewControllerResolver { viewController in
                viewController.navigationItem.searchController = self.searchControllerProvider.searchController
                    }
                        .frame(width: 0, height: 0))
        }
        
    }
}

@available(iOS 14.0, *)
struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}

let demoData: [[Double]] = [[10, 12, 9, 2, 5, 13, 16],
                [3, 2, 9, 10, 15, 23, 26],
                [15, 20, 19, 25, 52, 33, 46],
                [25, 25, 15, 32, 25, 13, 16]]
