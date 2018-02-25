//
//  Author.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import SwiftyJSON

class Committer {
    
    var username: String
    var avatarLink: String
    var name: String
    var email: String
    
    init(){
        username = ""
        avatarLink = ""
        name = ""
        email = ""
    }
    
    convenience init(withJSON json: JSON){
        self.init()
        name = json["name"].stringValue
        email = json["email"].stringValue
    }
}
