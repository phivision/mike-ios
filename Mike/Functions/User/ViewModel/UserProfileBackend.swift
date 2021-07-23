//
//  UserProfileBackend.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/15.
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
class UserProfileBackend: NSObject {
    static let shared = UserProfileBackend()
    static func initialize() -> UserProfileBackend {
        return .shared
    }
    // MARK: - fetch UserProfile for user profile page,get trainerList and favoriteList
    func fetchUserProfileModel(userId:String?,suc:@escaping (_ userCenterModel:UserCenterModel)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchUserProfileModel(byId: userId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
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
    // MARK: - fetch Trainer for message system
    func fetchSubscriptionTrainerList(suc:@escaping (_ trainerList:Array<UserCenterTrainer>,_ subscribeId:Array<String>)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchSubscriptionTrainerList()){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
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
                    guard let favDic = subDic["Subscriptions"] as? NSDictionary else {
                        return
                    }
                    guard let itemList = favDic["items"] as? NSArray else {
                        return
                    }
                    print("~~~~~~~~~~~~\(itemList)")
                    var trainerList = Array<UserCenterTrainer>()
                    var subscribeIdList = Array<String>()
                    for item in itemList {
                        if let itemDic = item as? NSDictionary {
                            subscribeIdList.append("\(itemDic["id"] ?? "")")
                            trainerList.append(UserCenterTrainer(fromDictionary: itemDic["Trainer"] as! [String : Any]))
                        }
                    }
                    suc(trainerList,subscribeIdList)
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
    func fetchSubscriptionUserList(suc:@escaping (_ userList:Array<UserCenterTrainer>)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchSubscriptionUserList()){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
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
                    guard let favDic = subDic["Users"] as? NSDictionary else {
                        return
                    }
                    guard let itemList = favDic["items"] as? NSArray else {
                        return
                    }
                    print("~~~~~~~~~~~~\(itemList)")
                    var trainerList = Array<UserCenterTrainer>()
                    for item in itemList {
                        if let itemDic = item as? NSDictionary {
                            trainerList.append(UserCenterTrainer(fromDictionary: itemDic["User"] as! [String : Any]))
                        }
                    }
                    suc(trainerList)
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
    //edit profile
    func editUserProfile(firstname:String?,lastname:String?,descValue:String?,userImage:String?,suc:@escaping (_ isSuc:Bool)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.mutate(request: .editUserProfile(byFirstName: firstname ?? "", LastName: lastname ?? "", Description: descValue ?? "", UserImage: userImage ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
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
    //del subscription trainer
    func delSubscriptionTrainer(subscriptionId:String?,suc:@escaping (_ isSuc:Bool)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.mutate(request: .delSubscription(bySubscribeId: subscriptionId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
                    guard let postData = try? JSONEncoder().encode(data) else {
                        fail("Failed")
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        fail("Failed")
                        return
                    }
                    let dic = d as! NSDictionary
                    if let subDic = dic["deleteUserSubscriptionTrainer"] as? NSDictionary {
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
