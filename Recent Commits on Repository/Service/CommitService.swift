//
//  CommitService.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import BrightFutures

class CommitService: Service {
    
    var client: NetClient
    
    required init(client: NetClient) {
        self.client = client
    }
    
    
    func getRepositoryCommits(repositoryOwner: String, repositoryName: String) -> Future<[Commit], ServiceError> {
        let promise = Promise<[Commit], ServiceError>()
        
        client.request(GithbuRepositoriesRouter.getCommits(owner: repositoryOwner, repository: repositoryName))
            .onSuccess { data in
                let results = data.arrayValue.flatMap {
                    Commit(withJSON: $0)
                }
                promise.success(results)
            }.onFailure { error in
                promise.failure(error)
        }
        
        return promise.future
    }
}
