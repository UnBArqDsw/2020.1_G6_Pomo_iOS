//
//  SearchControllerProvider.swift
//  Pomo
//
//  Created by João Medeiros on 05/11/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import Foundation
import SwiftUI

class SearchControllerProvider: NSObject, ObservableObject {
    
    @Published var searchText: String = ""
    let searchController: UISearchController = UISearchController(searchResultsController: nil) 
    
    override init() {
        super.init()
        //self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchResultsUpdater = self
    }
    
}

extension SearchControllerProvider: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            self.searchText = searchText
        }
    }
    
}
