//
//  MikeApp.swift
//  Mike
//
//  Created by Fanghao Yang on 4/26/21.
//

import UIKit
@main
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // initialize Amplify
        let _ = Backend.initialize()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let loginVC:LoginViewController = LoginViewController()
        let navVC:UINavigationController  = UINavigationController(rootViewController: loginVC)
        navVC.isNavigationBarHidden = true
        self.window?.backgroundColor = .white
        self.window?.rootViewController = navVC
        self.window?.makeKeyAndVisible()
        return true
    }
}
