//
//  Commit.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import SwiftyJSON

class Commit {
    var message: String
    var committer: Committer
    
    init(withJSON json: JSON){
        message = json["message"].stringValue
        let committer = Committer(withJSON: json["commit"]["committer"])
        committer.username = json["committer"]["login"].stringValue
        committer.avatarLink = json["committer"]["avatar_url"].stringValue
        self.committer = committer
    }
}
