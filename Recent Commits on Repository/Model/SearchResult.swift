//
//  SearchResult.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import SwiftyJSON

class SearchResult {
    var repositoryName: String
    var ownerName: String
    var ownerAvatarLink: String
    var description: String
    
    init(withJSON json: JSON) {
        self.repositoryName = json["name"].stringValue
        self.ownerName = json["owner"]["login"].stringValue
        self.ownerAvatarLink = json["owner"]["avatar_url"].stringValue
        self.description = json["description"].stringValue
    }
}
