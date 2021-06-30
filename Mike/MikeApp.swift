//
//  MikeApp.swift
//  Mike
//
//  Created by Fanghao Yang on 4/26/21.
//

import UIKit
import Amplify
import IQKeyboardManagerSwift
import AWSAppSync
import UserNotifications
import AWSPinpoint
import SwiftUI
@main
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    var pinpoint: AWSPinpoint?
    
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
        
//        let loginUIView = UIHostingController(rootView: LoginUIView())
////        let navVC:UINavigationController  = UINavigationController(rootViewController: loginUIView)
////        navVC.isNavigationBarHidden = true
//        self.window?.rootViewController = loginUIView
//        self.window?.backgroundColor = .white
//        self.window?.makeKeyAndVisible()
        
        if #available(iOS 13.0, *) {
            self.window?.overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        self.configKeyBoard()
        self.configVideoHost()
        // Instantiate Pinpoint
        let pinpointConfiguration = AWSPinpointConfiguration.defaultPinpointConfiguration(launchOptions: launchOptions)
        // Set debug mode to use APNS sandbox, make sure to toggle for your production app
        pinpointConfiguration.debug = true
        pinpoint = AWSPinpoint(configuration: pinpointConfiguration)
        // Present the user with a request to authorize push notifications
        registerForPushNotifications()
        AWSDDLog.sharedInstance.logLevel = .verbose
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        return true
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:restartSubscription), object: nil)
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:cancelSubscription), object: nil)
    }
    // MARK: Remote Notifications Lifecycle
    func application(_: UIApplication,
                    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("Device Token: \(token)")

        // Register the device token with Pinpoint as the endpoint for this user
        pinpoint?.notificationManager
            .interceptDidRegisterForRemoteNotifications(withDeviceToken: deviceToken)
    }

    func application(_: UIApplication,
                    didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }
    func application(_ application: UIApplication,
                    didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult)
                        -> Void) {
        // if the app is in the foreground, create an alert modal with the contents
        if application.applicationState == .active {
            let alert = UIAlertController(title: "Notification Received",
                                          message: userInfo.description,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            UIApplication.shared.keyWindow?.rootViewController?.present(
                alert, animated: true, completion: nil
            )
        }

        // Pass this remote notification event to pinpoint SDK to keep track of notifications produced by AWS Pinpoint campaigns.
        pinpoint?.notificationManager.interceptDidReceiveRemoteNotification(userInfo)
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
    func configVideoHost(){
        let dic:NSDictionary = JsonHelper.convertJsonFileToDic(fileName: "amplifyconfiguration")
        guard let sdic = dic["storage"] as? NSDictionary else{
            return
        }
        guard let pdic = sdic["plugins"] as? NSDictionary else{
            return
        }
        guard let awss3dic = pdic["awsS3StoragePlugin"] as? NSDictionary else{
            return
        }
        guard let bucket = awss3dic["bucket"] as? String else{
           return
        }
        print("~~~~~~~~~~~~~~~~~~~~~\(bucket)")
        let hostDic:NSDictionary = JsonHelper.convertJsonFileToDic(fileName: "video_endpoints");
        print("~~~~~~~~~~~~~~~~~~~~\(hostDic)");
        var finalVideoHost = "";
        for key in hostDic.allKeys {
            if bucket.contains(key as? String ?? "") {
                finalVideoHost = hostDic[key] as? String ?? ""
                break
            }
        }
        print("url~~~~~~~~~~~~~~~~~~~~\(finalVideoHost)");
        LoginTools.sharedTools.videoHost = finalVideoHost;
    }
    // MARK: Push Notification methods
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, _ in
                print("Permission granted: \(granted)")
                guard granted else { return }

                // Only get the notification settings if user has granted permissions
                self?.getNotificationSettings()
            }
    }
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }

            DispatchQueue.main.async {
                // Register with Apple Push Notification service
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
}
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        // Handle foreground push notifications
        pinpoint?.notificationManager.interceptDidReceiveRemoteNotification(notification.request.content.userInfo)
     }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void)  {
        // Handle background and closed push notifications
        pinpoint?.notificationManager.interceptDidReceiveRemoteNotification(response.notification.request.content.userInfo)
    }
}
extension AppDelegate{

//    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
//
//        return blockRotation
//    }
}
