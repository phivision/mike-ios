//
//  MikeApp.swift
//  Mike
//
//  Created by Fanghao Yang on 4/26/21.
//

import UIKit
import Amplify
import IQKeyboardManagerSwift
@main
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // initialize Amplify
        let _ = Backend.initialize()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if StringUtils.isBlank(value: LoginTools.sharedTools.userId()) == false {
            let homeVC:HomeTabViewController = HomeTabViewController()
            let navVC:UINavigationController  = UINavigationController(rootViewController: homeVC)
            navVC.isNavigationBarHidden = true
            self.window?.rootViewController = navVC
            self.window?.backgroundColor = .white
            self.window?.makeKeyAndVisible()
        }else{
            let loginVC:LoginViewController = LoginViewController()
            let navVC:UINavigationController  = UINavigationController(rootViewController: loginVC)
            navVC.isNavigationBarHidden = true
            self.window?.rootViewController = navVC
            self.window?.backgroundColor = .white
            self.window?.makeKeyAndVisible()
        }
        self.window?.overrideUserInterfaceStyle = .light
        self.configKeyBoard()
        return true
    }
    var blockRotation: UIInterfaceOrientationMask = .portrait{
            didSet{
                if blockRotation.contains(.portrait){
                    //强制设置成竖屏
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                }else{
                    //强制设置成横屏
                    UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")

                }
            }
        }
    func configKeyBoard(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
}
extension AppDelegate{

//    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
//
//        return blockRotation
//    }
}
