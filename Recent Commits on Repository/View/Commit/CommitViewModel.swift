//
//  CommitViewModel.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation

protocol CommitResultsDelegate {
    func commitsResultsDidChanged()
}

protocol CommitViewModelType {
    var delegate: CommitResultsDelegate? {get set }
    
    var commits: [Commit] { get }
    
    func getRepositoryCommits(repositoryOwner: String, repositoryName: String)
}

class CommitViewModel : CommitViewModelType {
    var delegate: CommitResultsDelegate?
    
    var commits: [Commit] = [] {
        didSet{
            delegate?.commitsResultsDidChanged()
        }
    }
    
    var service: CommitService
    
    init(service: CommitService) {
        self.service = service
    }
    
    func getRepositoryCommits(repositoryOwner: String, repositoryName: String){
        service.getRepositoryCommits(repositoryOwner: repositoryOwner, repositoryName: repositoryName)
            .onSuccess { results in
                self.commits = results
            }.onFailure { error in
                //do nothing
        }
    }
}
