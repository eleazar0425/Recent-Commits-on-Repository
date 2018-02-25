//
//  SearchViewModel.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation

protocol SearchRepositoriesDelegate {
    func searchResultsDidChanged()
}

protocol SearchViewModelType {
    var results: [SearchResult] {get}
    
    var query: String {get set}
    
    func performSearch()
    
    var delegate: SearchRepositoriesDelegate? {get set }
}

class SearchViewModel : SearchViewModelType {
    var delegate: SearchRepositoriesDelegate?
    
    var results : [SearchResult] = [] {//0 results by default
        didSet{
            delegate?.searchResultsDidChanged()
        }
    }
    
    var searchService: SearchService
    
    var query: String = "" {
        didSet {
            if query == "" {
                results = []
            }
        }
    }
    
    init(service: SearchService) {
        self.searchService = service
    }
    
    func performSearch() {
        searchService.search(query: self.query)
            .onSuccess { results in
                self.results = results
            }.onFailure { error in
                //do nothing
        }
    }
}
