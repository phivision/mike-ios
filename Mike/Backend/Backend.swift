//
//  Backend.swift
//  Mike
//
//  Created by Fanghao Yang on 4/26/21.
//
import UIKit
import Amplify
import AWSCognitoAuthPlugin
import AWSMobileClientXCF
import AWSAPIPlugin
import AWSPinpointAnalyticsPlugin
import AWSPluginsCore
import AWSS3StoragePlugin

class Backend {
    static let shared = Backend()
    static func initialize() -> Backend {
        return .shared
    }
    private init() {
      // initialize amplify
      do {
        try Amplify.add(plugin: AWSCognitoAuthPlugin())
        try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: AmplifyModels()))
        try Amplify.add(plugin: AWSS3StoragePlugin())
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
    
    // MARK: - User Authentication

    // signin with Cognito web user interface
    public func signIn() {

        _ = Amplify.Auth.signInWithWebUI(presentationAnchor: UIApplication.shared.windows.first!) { result in
            switch result {
            case .success(_):
                print("Sign in succeeded")
            case .failure(let error):
                print("Sign in failed \(error)")
            }
        }
    }
    //  login with userName and password
    public func login(userName:String!,pwd:String!,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void){
//        signOut()
        _ = Amplify.Auth.signIn(username: userName, password: pwd) { result in
            switch result {
            case .success:
                print("Sign in succeeded \(result)")
                self.fetchSession(suc: suc, fail: fail)
            case .failure(let error):
                print("Sign in failed \(error)")
                fail(error.errorDescription)
            }
        }
    }

    //  - signout
    public func signOut(suc:@escaping ()->Void,fail:@escaping ()->Void) {
        _ = Amplify.Auth.signOut() { (result) in
            switch result {
            case .success:
                print("Successfully signed out")
                suc()
            case .failure(let error):
                print("Sign out failed with error \(error)")
                fail()
            }
        }
    }

    // MARK: -  change our internal state, this triggers an UI update on the main thread
    func updateUserData(withSignInStatus status : Bool) {
        DispatchQueue.main.async() {

        }
    }
    /*
     // Get aws credentials
     if let awsCredentialsProvider = session as? AuthAWSCredentialsProvider {
         let credentials = try awsCredentialsProvider.getAWSCredentials().get()
         print("Access key - \(credentials.accessKey) ")
     }

     // Get cognito user pool token
     if let cognitoTokenProvider = session as? AuthCognitoTokensProvider {
         let tokens = try cognitoTokenProvider.getCognitoTokens().get()
         print("Id token - \(tokens.idToken) ")
     }
     */
    // MARK: - Login relations API Query
    //  fetchSession After Login Success
    public func fetchSession(suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.Auth.fetchAuthSession { result in
            do {
                let session = try result.get()
                // Get user sub or identity id
                if let identityProvider = session as? AuthCognitoIdentityProvider {
                    let usersub = try identityProvider.getUserSub().get()
                    let identityId = try identityProvider.getIdentityId().get()
                    print("User sub - \(usersub) and identity id \(identityId)")
                    self.fetchUserProfile(userId: usersub, suc: suc, fail: fail)
                }else{
                    print("Fetch auth session failed")
                    fail("Fetch auth session failed")
                }
            } catch {
                print("Fetch auth session failed with error - \(error)")
                fail("\(error)")
            }
        }
    }
    //  fetchUserProfile After fetchSession Success
    public func fetchUserProfile(userId:String,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchUserProfile(byId: userId)){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    if let postData = try? JSONEncoder().encode(data) {
                        if let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) {
                            let dic = d as! NSDictionary
                            if let subDic = dic["getUserProfile"] as? NSDictionary{
                                LoginTools.sharedTools.saveUserInfo(dic: subDic as! [String : Any])
                                suc();
                                print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\(LoginTools.sharedTools.userId())");
                            }else{
                                fail("fetch User Profile Fail");
                            }
                        }else{
                            fail("fetch User Profile Fail");
                        }
                    }else{
                        fail("fetch User Profile Fail");
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("Got failed result with \(error.errorDescription)");
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("Got failed result with \(error)");
            }
        }
    }
    // MARK: - fetch imageUrl by imageKey for loading image in UIImageView
    func fetchUserIcon(imageKey:String!){
        Amplify.Storage.getURL(key: "banner1.jpg") { event in
            switch event {
            case let .success(url):
                print("Completed: \(url)")
            case let .failure(storageError):
                print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
            }
        }
    }
    // MARK: - test custom GraphQL query document
    func fetchSubscriptionList(userId:String?,suc:@escaping (_ list:Array<UserSubscriptionTrainerListModel>)->Void){
        Amplify.API.query(request: .getSubscriptionList(byId: userId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    guard let postData = try? JSONEncoder().encode(data) else {
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        return
                    }
                    let dic = d as! NSDictionary
                    guard let subDic = dic["getUserProfile"] as? NSDictionary else {
                        return
                    }
                    guard let thirddic = subDic["Subscriptions"] as? NSDictionary else {
                        return
                    }
                    guard let itemList = thirddic["items"] as? NSArray else {
                        return
                    }
                    print("~~~~~~~~~~~~\(itemList)")
                    var subscriptionList = Array<UserSubscriptionTrainerListModel>()
                    for item in itemList {
                        if let itemDic = item as? NSDictionary {
                            subscriptionList.append(UserSubscriptionTrainerListModel(fromDictionary: itemDic as! [String : Any]))
                        }
                    }
                    suc(subscriptionList)
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    func fetchContentList(userId:String?){
        Amplify.API.query(request: .getContentList(byId: userId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    if let postData = try? JSONEncoder().encode(data) {
                        if let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) {
                            let dic = d as! NSDictionary
                            if let subDic = dic["getUserProfile"] as? NSDictionary{
                                if let thirddic = subDic["Contents"] as? NSDictionary{
                                    print(thirddic["items"])
                                }
                            }
                        }
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    // MARK: - fetch UserProfile for user profile page,get trainerList and favoriteList
    func fetchUserProfileModel(userId:String?,suc:@escaping (_ userCenterModel:UserCenterModel)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchUserProfileModel(byId: userId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    guard let postData = try? JSONEncoder().encode(data) else {
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        return
                    }
                    let dic = d as! NSDictionary
                    guard let subDic = dic["getUserProfile"] as? NSDictionary else {
                        return
                    }
                    suc(UserCenterModel.init(fromDictionary: subDic as! [String : Any]))
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("Got failed event with error \(error)")
            }
        }
    }
    // MARK: - fetch FavList for user profile page
    func fetchUserFavList(userId:String?,suc:@escaping (_ contentList:Array<UserCenterContent>)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchUserFavList(byId: userId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    guard let postData = try? JSONEncoder().encode(data) else {
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        return
                    }
                    let dic = d as! NSDictionary
                    guard let subDic = dic["getUserProfile"] as? NSDictionary else {
                        return
                    }
                    guard let favDic = subDic["Favorites"] as? NSDictionary else {
                        return
                    }
                    guard let itemList = favDic["items"] as? NSArray else {
                        return
                    }
                    print("~~~~~~~~~~~~\(itemList)")
                    var contentList = Array<UserCenterContent>()
                    for item in itemList {
                        if let itemDic = item as? NSDictionary {
                            contentList.append(UserCenterContent(fromDictionary: itemDic["Content"] as! [String : Any]))
                        }
                    }
                    suc(contentList)
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("Got failed event with error \(error)")
            }
        }
    }
    //fetch UserProfile For Trainer Simple Info
    func fetchTrainerSimpleInfo(userId:String?,suc:@escaping (_ userCenterModel:UserCenterModel)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchSimpleTrainerModel(byId: userId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    guard let postData = try? JSONEncoder().encode(data) else {
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        return
                    }
                    let dic = d as! NSDictionary
                    guard let subDic = dic["getUserProfile"] as? NSDictionary else {
                        return
                    }
                    suc(UserCenterModel(fromDictionary: subDic as! [String : Any]))
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("Got failed event with error \(error)")
            }
        }
    }
    //fetch Trainer's Profile
    func fetchTrainerDetail(trainerId:String?,suc:@escaping (_ trainerDetail:TrainerDetailModel)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchTrainerDetail(byId: trainerId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    guard let postData = try? JSONEncoder().encode(data) else {
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        return
                    }
                    let dic = d as! NSDictionary
                    guard let subDic = dic["getUserProfile"] as? NSDictionary else {
                        return
                    }
                    suc(TrainerDetailModel(fromDictionary: subDic as! [String : Any]))
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("Got failed event with error \(error)")
            }
        }
    }
}
