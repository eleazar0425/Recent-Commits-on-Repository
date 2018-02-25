//
//  SearchRepositoriesRouter.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import Alamofire

enum SearchRepositoriesRouter : URLRequestConvertible {
    
    case search(query: String)
    
    var path: String {
        switch  self {
        case .search(_):
            return "/search/repositories"
        }
    }
    
    var params: [String:Any] {
        switch  self {
        case .search(let query):
            return ["q":query]
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url = try AppDelegate.GITHUB_API_REST.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        return URLEncoding.default.encode(URLRequestConvertible, with: <#T##Parameters?#>)
    }
    
}
