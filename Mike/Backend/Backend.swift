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
                self.updateUserData(withSignInStatus: true)
//                print("==HUB== \(payload)")
                break
            }
        }
         
        // let's check if user is signedIn or not
         _ = Amplify.Auth.fetchAuthSession { (result) in
             do {
                 let session = try result.get()
                        
        // let's update UserData and the UI
             self.updateUserData(withSignInStatus: session.isSignedIn)
                        
             } catch {
                  print("Fetch auth session failed with error - \(error)")
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
    
    public func login(userName:String!,pwd:String!,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void){
//        signOut()
        _ = Amplify.Auth.signIn(username: userName, password: pwd) { result in
            switch result {
            case .success:
                print("Sign in succeeded \(result)")
                self.getSession(suc: suc, fail: fail)
            case .failure(let error):
                print("Sign in failed \(error)")
                self.getSession(suc: suc, fail: fail)
            }
        }
    }

    // signout
    public func signOut() {

        _ = Amplify.Auth.signOut() { (result) in
            switch result {
            case .success:
                print("Successfully signed out")
            case .failure(let error):
                print("Sign out failed with error \(error)")
            }
        }
    }

    // change our internal state, this triggers an UI update on the main thread
    func updateUserData(withSignInStatus status : Bool) {
        DispatchQueue.main.async() {
            LoginTools.sharedTools.isLogin = status
        }
    }
    public func getSession(suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.Auth.fetchAuthSession { result in
            do {
                let session = try result.get()

                // Get user sub or identity id
                if let identityProvider = session as? AuthCognitoIdentityProvider {
                    let usersub = try identityProvider.getUserSub().get()
                    let identityId = try identityProvider.getIdentityId().get()
                    print("User sub - \(usersub) and identity id \(identityId)")
//                    self.getUserProfile(userId: usersub,suc: suc,fail: fail)
//                    self.getUserContentList(userId: usersub)
                    self.testGraphQL(userId: usersub)
                }

//                // Get aws credentials
//                if let awsCredentialsProvider = session as? AuthAWSCredentialsProvider {
//                    let credentials = try awsCredentialsProvider.getAWSCredentials().get()
//                    print("Access key - \(credentials.accessKey) ")
//                }
//
//                // Get cognito user pool token
//                if let cognitoTokenProvider = session as? AuthCognitoTokensProvider {
//                    let tokens = try cognitoTokenProvider.getCognitoTokens().get()
//                    print("Id token - \(tokens.idToken) ")
//                }

            } catch {
                print("Fetch auth session failed with error - \(error)")
            }
        }
    }
    public func getUserProfile(userId:String,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .get(UserProfile.self, byId: userId)){ event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let profile):
                    guard let profileModel = profile else {
                        print("Could not find todo")
                        return
                    }
                    LoginTools.sharedTools.userProfile = profileModel;
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    suc()
                    print("Successfully retrieved todo")
                case .failure(let error):
                    fail("Got failed result with \(error.errorDescription)")
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                fail("Got failed result with \(error)")
                print("Got failed event with error \(error)")
            }
        }
    }
    func fetchUserIcon(imageKey:String!){
        Amplify.Storage.getURL(key: "banner1.jpg") { event in
            switch event {
            case let .success(url):
                print("Completed: \(url)")
            case let .failure(storageError):
                print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
            default:
                break
            }
        }
    }
    public func fetchUserContent(cotentId:String,suc:@escaping (_ userContent:UserContent)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .get(UserContent.self, byId: cotentId)){ event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let userContent):
                    guard let contentModel = userContent else {
                        print("Could not find todo")
                        return
                    }
                    suc(contentModel)
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    print("Successfully retrieved todo")
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
    func testGraphQL(userId:String?){
        Amplify.API.query(request: .getWithoutDescription(byId: userId ?? "")){
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
                                if let thirddic = subDic["Subscriptions"] as? NSDictionary{
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
}
