//
//  MikeApp.swift
//  Mike
//
//  Created by Fanghao Yang on 4/26/21.
//

import UIKit
import Amplify
import IQKeyboardManagerSwift
import UserNotifications
import AWSPinpoint
import SwiftUI
import AWSCognitoAuthPlugin
import AWSMobileClientXCF
import AWSAPIPlugin
import AWSPinpointAnalyticsPlugin
import AWSPluginsCore
import AWSS3StoragePlugin
import AWSS3
@main
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    var pinpoint: AWSPinpoint?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // initialize Amplify
//        let _ = Backend.initialize()
        self.configAmplify()
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
        // reset icon badege is 0
        UIApplication.shared.applicationIconBadgeNumber = 0
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
        UIApplication.shared.applicationIconBadgeNumber = 0
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:restartSubscription), object: nil)
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:cancelSubscription), object: nil)
    }
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if url.absoluteString.hasPrefix("mike://") {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "dismissSafari"), object: nil)
        }
        AWSMobileClient.default().handleAuthResponse(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        return true
    }
    // MARK: Remote Notifications Lifecycle
    func application(_: UIApplication,
                    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("Device Token: \(token)")
        
        if !StringUtils.isBlank(value: LoginTools.sharedTools.userId()) {
            MessageBackend.shared.updateUserDeviceToken(deviceToken: token) {
                
            } fail: {
                
            }
        }else{
            LoginTools.sharedTools.deviceToken = token
        }

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
//        if application.applicationState == .active {
//            let alert = UIAlertController(title: "Notification Received",
//                                          message: userInfo.description,
//                                          preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//            UIApplication.shared.keyWindow?.rootViewController?.present(
//                alert, animated: true, completion: nil
//            )
//        }
        if application.applicationState != .active {
            UIApplication.shared.applicationIconBadgeNumber = 1
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
    func configAmplify(){
        do {
          try Amplify.add(plugin: AWSCognitoAuthPlugin())
          try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: AmplifyModels()))
          try Amplify.add(plugin: AWSS3StoragePlugin())
  //        try Amplify.add(plugin: AWSPinpointAnalyticsPlugin())
          try Amplify.configure()
          print("Initialized Amplify");
          // listen to auth events
          // see https://github.com/aws-amplify/amplify-ios/blob/master/Amplify/Categories/Auth/Models/AuthEventName.swift
          _ = Amplify.Hub.listen(to: .auth) { (payload) in

              switch payload.eventName {

              case HubPayload.EventName.Auth.signedIn:
                  print("==HUB== User signed In, update UI")
                  self.updateUserData(withSignInStatus: true)

              case HubPayload.EventName.Auth.signedOut:
                  print("==HUB== User signed Out, update UI")
                  self.updateUserData(withSignInStatus: false)

              case HubPayload.EventName.Auth.sessionExpired:
                  print("==HUB== Session expired, show sign in UI")
                  self.updateUserData(withSignInStatus: false)
                  self.signOut()
              default:
                  self.updateUserData(withSignInStatus: false)
  //                print("==HUB== \(payload)")
                  break
              }
          }
        } catch {
          print("Could not initialize Amplify: \(error)")
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
    func signOut(){
        LoginBackend.shared.signOut {
            LoginTools.sharedTools.removeUserInfo()
            SubscriptionTools.sharedTools.outterSubscription?.cancel()
            for key in SubscriptionTools.sharedTools.groupSubscription {
                let subscription = SubscriptionTools.sharedTools.groupSubscription["\(key)"]
                subscription?.cancel()
            }
            DispatchQueue.main.async {
                let loginVC:LoginViewController = LoginViewController()
                let navVC:UINavigationController  = UINavigationController(rootViewController: loginVC)
                navVC.isNavigationBarHidden = true
                let transtition = CATransition()
                transtition.duration = 0.5
                transtition.timingFunction = CAMediaTimingFunction(name: .easeOut)
                keyWindow?.layer.add(transtition, forKey: "animation")
                keyWindow?.rootViewController = navVC;
            }
        } fail: {
            
        }
    }
    // MARK: -  change our internal state, this triggers an UI update on the main thread
    func updateUserData(withSignInStatus status : Bool) {
        DispatchQueue.main.async() {

        }
    }
}
