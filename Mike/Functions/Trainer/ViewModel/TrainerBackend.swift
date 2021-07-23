//
//  TrainerBackend.swift
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

class TrainerBackend: NSObject {
    static let shared = TrainerBackend()
    static func initialize() -> TrainerBackend {
        return .shared
    }
    //fetch UserProfile For Trainer Simple Info
    func fetchTrainerSimpleInfo(userId:String?,suc:@escaping (_ userCenterModel:UserCenterModel)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchSimpleTrainerModel(byId: userId ?? "")){
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
    func createUserContent(title:String!,desc:String!,contentName:String!,thumbnail:String!,segments:String!,suc:@escaping (_ isSuc:Bool)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.mutate(request: .createUserContent(byTitle: title, description: desc, ContentName: contentName, Thumbnail: thumbnail, Segments: segments)){
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
    func createNewContentSubscription(complete:@escaping ()->Void) {
        let subscription: GraphQLSubscriptionOperation<JSONValue> = Amplify.API.subscribe(request: .subscriptionNewContent(byCreatorId: LoginTools.sharedTools.userId()), valueListener: { (subscriptionEvent) in
            switch subscriptionEvent {
            case .connection(let subscriptionConnectionState):
                print("Subscription connect state is \(subscriptionConnectionState)")
                if subscriptionConnectionState == .disconnected {
                    SubscriptionTools.sharedTools.createContentSubscription?.start()
                }
            case .data(let result):
                switch result {
                case .success(let data):
                    guard let postData = try? JSONEncoder().encode(data) else {
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        return
                    }
                    let dic = d as! NSDictionary
                    if let subDic = dic["onUpdateByCreatorID"] as? NSDictionary {
                        print("\(subDic)")
                        complete()
                    }else {
                        
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            }
        }) { result in
            switch result {
            case .success:
                print("Subscription has been closed successfully")
            case .failure(let apiError):
                print("Subscription has terminated with \(apiError)")
            }
        }
        SubscriptionTools.sharedTools.createContentSubscription = subscription
    }
}
