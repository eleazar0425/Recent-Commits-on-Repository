//
//  CommitsOnRepositoryViewController.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/25/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import UIKit

class CommitsOnRepositoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var onwerAvatar: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var result: SearchResult!
    var commitViewModel: CommitViewModelType!
    
    override func viewDidLoad() {
        onwerAvatar.setImage(withPath: result.ownerAvatarLink)
        ownerNameLabel.text = result.ownerName
        repositoryNameLabel.text = result.repositoryName
        descriptionLabel.text = result.description
        
        tableView.dataSource = self
        tableView.delegate = self
        
        commitViewModel.delegate = self
        
        commitViewModel.getRepositoryCommits(repositoryOwner: result.ownerName, repositoryName: result.repositoryName)
    }
}

extension CommitsOnRepositoryViewController: CommitResultsDelegate {
    func commitsResultsDidChanged() {
        self.tableView.reloadData()
    }
}

extension CommitsOnRepositoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commitViewModel.commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewCell = tableView.dequeueReusableCell(withIdentifier: "commitViewCellIdentifier") as! CommitTableViewCell
        
        let commit = commitViewModel.commits[indexPath.row]
        
        viewCell.commiterNameLabel.text = commit.committer.username
        viewCell.commitMessageLabel.text = commit.message
        viewCell.committerAvatar.setImage(withPath: commit.committer.avatarLink)
        
        return viewCell
    }
}
