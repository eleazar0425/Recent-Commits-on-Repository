//
//  SwiftinjectSetup+Storyboard.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        defaultContainer.register(NetClient.self){
            _ in GithubClient()
        }.inObjectScope(.container)
        
        defaultContainer.register(SearchService.self){ r in
            SearchService(client: r.resolve(NetClient.self)!)
        }.inObjectScope(.container)
        
        defaultContainer.register(CommitService.self) { r  in
            CommitService(client: r.resolve(NetClient.self)!)
        }.inObjectScope(.container)
        
        defaultContainer.register(CommitViewModelType.self) { r in
            CommitViewModel(service: r.resolve(CommitService.self)!)
        }.inObjectScope(.container)
        
        defaultContainer.register(SearchViewModelType.self){ r in
            SearchViewModel(service: r.resolve(SearchService.self)!)
        }.inObjectScope(.container)
        
        defaultContainer.storyboardInitCompleted(SearchViewController.self) { (r, vc) in
            vc.searchViewModel = r.resolve(SearchViewModelType.self)!
        }
        
        defaultContainer.storyboardInitCompleted(CommitsOnRepositoryViewController.self) { (r,vc) in
            vc.commitViewModel = r.resolve(CommitViewModelType.self)!
        }
    }
}
