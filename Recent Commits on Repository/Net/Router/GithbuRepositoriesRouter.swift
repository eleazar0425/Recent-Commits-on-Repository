//
//  SearchRepositoriesRouter.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import Alamofire

enum GithbuRepositoriesRouter : URLRequestConvertible {
    
    case search(query: String)
    case getCommits(owner: String, repository: String)
    
    var path: String {
        switch  self {
        case .search(_):
            return "/search/repositories"
        case .getCommits(let owner, let repository):
            return "/repos/\(owner)/\(repository)/commits"
        }
    }
    
    var params: [String:Any] {
        switch  self {
        case .search(let query):
            return ["q":query]
        default:
            return [:]
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try AppDelegate.GITHUB_API_REST.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return try URLEncoding.default.encode(urlRequest, with: params)
    }
}
