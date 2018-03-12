//
//  RootWireFrame.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 3/11/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import UIKit

class RootWireFrame: NSObject {
    func prensetRootViewController(rootViewController: UIViewController, window: UIWindow){
        let navigationController = UINavigationController()
        navigationController.viewControllers = [rootViewController]
        window.rootViewController = navigationController
    }
}
