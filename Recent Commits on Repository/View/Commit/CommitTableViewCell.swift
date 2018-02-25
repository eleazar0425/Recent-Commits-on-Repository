//
//  CommitTableViewCell.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/25/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import UIKit

class CommitTableViewCell: UITableViewCell {

    @IBOutlet weak var committerAvatar: UIImageView!
    @IBOutlet weak var commitMessageLabel: UILabel!
    
    @IBOutlet weak var commiterNameLabel: UILabel!
}
