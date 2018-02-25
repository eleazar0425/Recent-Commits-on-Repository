//
//  SearchService.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import BrightFutures
import Alamofire

class SearchService : Service {
    var client: NetClient
    required init(client: NetClient) {
        self.client = client
    }
    
    func search(query: String) -> Future<[SearchResult], ServiceError> {
        let promise = Promise<[SearchResult], ServiceError>()
        
        client.request(GithbuRepositoriesRouter.search(query: query))
            .onSuccess { data in
                let profiles = data["items"].arrayValue.flatMap({
                    SearchResult(withJSON: $0)
                })
                promise.success(profiles)
            }.onFailure { error in
                promise.failure(error)
        }
        return promise.future
    }
}
