//
//  AppDelegate.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static let GITHUB_API_REST = "https://api.github.com"

    var window: UIWindow?
    var wireFrame = RootWireFrame()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame:UIScreen.main.bounds)
        let rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController")
        wireFrame.prensetRootViewController(rootViewController: rootViewController, window: window!)
        window?.makeKeyAndVisible()
        return true
    }
}

