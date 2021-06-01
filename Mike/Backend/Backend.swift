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
import AWSS3

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
    
    //MARK: - register
    func signUp(username: String, password: String, firstName: String,lastName: String,needConfirm:@escaping ()->Void,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void) {
        let userAttributes = [
            AuthUserAttribute(.custom("role"),value: "student"),
            AuthUserAttribute(.custom("first_name"), value: firstName),
            AuthUserAttribute(.custom("last_name"), value: lastName),
        ]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        Amplify.Auth.signUp(username: username, password: password, options: options) { result in
            switch result {
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                    needConfirm()
                } else {
                    print("SignUp Complete")
                    suc()
                }
            case .failure(let error):
                print("An error occurred while registering a user \(error)")
                fail("\(error)")
            }
        }
    }
    // confirmSignUp
    func confirmSignUp(for username: String, with confirmationCode: String,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void) {
        Amplify.Auth.confirmSignUp(for: username, confirmationCode: confirmationCode) { result in
            switch result {
            case .success:
                print("Confirm signUp succeeded")
                suc()
            case .failure(let error):
                print("An error occurred while confirming sign up \(error)")
                fail("\(error)")
            }
        }
    }
    //result profile
    func resultProfile(userName:String?){
        let properties: AnalyticsProperties = ["Email": userName ?? "", "FirstName": "Dan","LastName":"Yin","UserRole":"student"]

        let userProfile = AnalyticsUserProfile(name: "Dan Yin",location: nil, properties: properties)

        Amplify.Analytics.identifyUser("432289c0-6a40-492d-93dc-cc3c48c0d027", withProfile: userProfile)
    }
    
    //MARK: - fogotPwd
    func resetPassword(username: String,needConfirm:@escaping ()->Void,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void) {
        Amplify.Auth.resetPassword(for: username) { result in
                do {
                    let resetResult = try result.get()
                    switch resetResult.nextStep {
                    case .confirmResetPasswordWithCode(let deliveryDetails, let info):
                        print("Confirm reset password with code send to - \(deliveryDetails) \(String(describing: info))")
                        needConfirm()
                    case .done:
                        print("Reset completed")
                        suc()
                    }
                } catch {
                    print("Reset password failed with error \(error)")
                    fail("\(error)")
                }
            }
    }
    
    func confirmResetPassword(
        username: String,
        newPassword: String,
        confirmationCode: String,
        suc:@escaping ()->Void,
        fail:@escaping (_ msg:String)->Void
    ) {
        Amplify.Auth.confirmResetPassword(
            for: username,
            with: newPassword,
            confirmationCode: confirmationCode
        ) { result in
            switch result {
            case .success:
                print("Password reset confirmed")
                suc()
            case .failure(let error):
                print("Reset password failed with error \(error)")
                fail("\(error)")
            }
        }
    }
    
    //MARK:  - signout
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
                    guard let postData = try? JSONEncoder().encode(data) else {
                        fail("fetch User Profile Fail");
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        fail("fetch User Profile Fail");
                        return
                    }
                    let dic = d as! NSDictionary
                    guard let subDic = dic["getUserProfile"] as? NSDictionary else {
                        fail("fetch User Profile Fail");
                        return
                    }
                    guard let userRole = subDic["UserRole"] as? String else {
                        fail("fetch User Profile Fail");
                        return
                    }
//                    if userRole.elementsEqual("trainer") {
//                        fail("Trainer Should Sign in Later");
//                    }else{
                        LoginTools.sharedTools.saveUserInfo(dic: subDic as! [String : Any])
                        suc();
                        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\(LoginTools.sharedTools.userId())");
//                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("\(error.errorDescription)");
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)");
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
                fail("\(error)")
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
                    print("Got failed result with \(error)")
                    fail("\(error)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)")
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
                    fail("\(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)")
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
                    fail("\(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)")
            }
        }
    }
    //fetch Trainer's Content
    func fetchTrainerContentList(trainerId:String?,suc:@escaping (_ list:Array<UserCenterContent>)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchTrainerContentList(byId: trainerId ?? "")){
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
                    guard let contentDic = subDic["Contents"] as? NSDictionary else {
                        return
                    }
                    guard let itemList = contentDic["items"] as? NSArray else {
                        return
                    }
                    print("~~~~~~~~~~~~\(itemList)")
                    var contentList = Array<UserCenterContent>()
                    for item in itemList {
                        if let itemDic = item as? NSDictionary {
                            contentList.append(UserCenterContent(fromDictionary: itemDic as! [String : Any]))
                        }
                    }
                    suc(contentList)
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("\(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)")
            }
        }
    }
    //MARK: - favorite
    //favUserList by ContentId
    func fetchContentIsFav(contentId:String?,suc:@escaping (_ isFav:Bool)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchUserList(byContentId: contentId ?? "")){
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
                    guard let subDic = dic["getUserContent"] as? NSDictionary else {
                        return
                    }
                    guard let contentDic = subDic["FavoriteUser"] as? NSDictionary else {
                        return
                    }
                    guard let itemList = contentDic["items"] as? NSArray else {
                        return
                    }
                    print("\(itemList)")
                    var userList = Array<String>()
                    for item in itemList {
                        guard let itemDic = item as? NSDictionary else{
                            continue
                        }
                        guard let userDic = itemDic["User"] as? NSDictionary else {
                            continue
                        }
                        userList.append("\(userDic["id"] ?? "")")
                    }
                    suc(userList.contains(LoginTools.sharedTools.userId()))
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("\(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)")
            }
        }
    }
    //add fav
    func addContentToFav(contentId:String?,suc:@escaping (_ isSuc:Bool)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.mutate(request: .addFav(byContentId: contentId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    guard let postData = try? JSONEncoder().encode(data) else {
                        fail("Failed")
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        fail("Failed")
                        return
                    }
                    let dic = d as! NSDictionary
                    if let subDic = dic["createUserFavoriteContent"] as? NSDictionary {
                        print("\(subDic)")
                        suc(true)
                    }else {
                        fail("Failed")
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("\(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)")
            }
        }
    }
    //del fav
    func delContentToFav(favRelationId:String?,suc:@escaping (_ isSuc:Bool)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.mutate(request: .delFav(byFavRelationId: favRelationId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    guard let postData = try? JSONEncoder().encode(data) else {
                        fail("Failed")
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        fail("Failed")
                        return
                    }
                    let dic = d as! NSDictionary
                    if let subDic = dic["deleteUserFavoriteContent"] as? NSDictionary {
                        print("\(subDic)")
                        suc(true)
                    }else {
                        fail("Failed")
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("\(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)")
            }
        }
    }
    func fetchFavIdList(suc:@escaping (_ relationDic:[String:Any])->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchFavRelationIdList()){
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
                    guard let contentDic = subDic["Favorites"] as? NSDictionary else {
                        return
                    }
                    guard let itemList = contentDic["items"] as? NSArray else {
                        return
                    }
                    var relationDic:[String:Any] = [:]
                    for item in itemList {
                        guard let itemDic = item as? NSDictionary else{
                            continue
                        }
                        guard let userDic = itemDic["Content"] as? NSDictionary else {
                            continue
                        }
                        guard let favId = itemDic["id"] as? String else {
                            continue
                        }
                        guard let contentId = userDic["id"] as? String else {
                            continue
                        }
                        relationDic[contentId] = favId
                    }
                    suc(relationDic)
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("\(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)")
            }
        }
    }
    //edit profile
    func editUserProfile(firstname:String?,lastname:String?,descValue:String?,userImage:String?,suc:@escaping (_ isSuc:Bool)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.mutate(request: .editUserProfile(byFirstName: firstname ?? "", LastName: lastname ?? "", Description: descValue ?? "", UserImage: userImage ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    guard let postData = try? JSONEncoder().encode(data) else {
                        fail("Failed")
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        fail("Failed")
                        return
                    }
                    let dic = d as! NSDictionary
                    if let subDic = dic["updateUserProfile"] as? NSDictionary {
                        print("\(subDic)")
                        suc(true)
                    }else {
                        fail("Failed")
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("\(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)")
            }
        }
    }
    //upload video
    func uploadVideo(videoData:Data!,videoKey:String?,progressBlock:@escaping (_ progress:Progress)->Void,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void){
        let transferUtility = AWSS3TransferUtility.default()
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.progressBlock = {(task, progress) in
            progressBlock(progress)
        }
        var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
        completionHandler = { (task, error) -> Void in
            if error == nil {
                suc()
            }else{
                fail("\(String(describing: error?.localizedDescription))")
            }
        }
        transferUtility.uploadData(videoData, key: "input/\(videoKey ?? "")", contentType: "video/*", expression: expression, completionHandler: completionHandler)
    }
    //upload image
    func uploadImage(imgData:Data!,imgName:String?,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.Storage.uploadData(
            key: imgName ?? "",
            data: imgData,
            progressListener: { progress in
                print("Progress: \(progress)")
            }, resultListener: { event in
                switch event {
                case .success(let data):
                    print("Completed: \(data)")
                    suc()
                case .failure(let storageError):
                    print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                    fail("\(storageError.errorDescription)")
                }
            }
        )
    }
    //createUserContent
    func createUserContent(title:String!,desc:String!,isDemo:Bool!,contentName:String!,thumbnail:String!,segments:String!,suc:@escaping (_ isSuc:Bool)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.mutate(request: .createUserContent(byTitle: title, description: desc, IsDemo: isDemo, ContentName: contentName, Thumbnail: thumbnail, Segments: segments)){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
//                    self.fetchUserIcon(imageKey: profileModel.UserImage ?? "")
                    guard let postData = try? JSONEncoder().encode(data) else {
                        fail("Failed")
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        fail("Failed")
                        return
                    }
                    let dic = d as! NSDictionary
                    if let subDic = dic["createUserContent"] as? NSDictionary {
                        print("\(subDic)")
                        suc(true)
                    }else {
                        fail("Failed")
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("\(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)")
            }
        }
    }
}
