//
//  ViewController.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchViewModel: SearchViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        searchViewModel.delegate = self
        
        searchBar.becomeFirstResponder()
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
        searchBar.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRepositoryDetailSegue" {
            let selectedRow = tableView.indexPathForSelectedRow?.row
            let result = searchViewModel.results[selectedRow!]
            let vc = segue.destination as! CommitsOnRepositoryViewController
            vc.result = result
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel?.query = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.endEditing(true)
    }
}

extension SearchViewController: SearchRepositoriesDelegate {
    func searchResultsDidChanged() {
        self.tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewCell = tableView.dequeueReusableCell(withIdentifier: "searchResultVieCell", for: indexPath) as! SearchResultTableViewCell
        
        let result = searchViewModel.results[indexPath.row]
        
        viewCell.ownerNameLabel.text = result.ownerName
        viewCell.repositoryNameLabel.text = result.repositoryName
        viewCell.descriptionLabel.text = result.description
        viewCell.avatar.setImage(withPath: result.ownerAvatarLink)
        
        return viewCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.results.count
    }
}
