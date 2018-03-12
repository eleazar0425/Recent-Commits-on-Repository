//
//  SearchWireFrame.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 3/11/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import UIKit

class SearchWireFrame {
    
    var searchViewController: SearchViewController?
    
    func presentCommitsInterface(result: SearchResult){
        let commitsViewController = mainStoryBoard().instantiateViewController(withIdentifier: "CommitsViewController") as! CommitsOnRepositoryViewController
        commitsViewController.result = result
        searchViewController?.navigationController?.pushViewController(commitsViewController, animated: true)
    }
    
    func mainStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
