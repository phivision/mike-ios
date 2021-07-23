//
//  MessageBackend.swift
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
class MessageBackend: NSObject {
    static let shared = MessageBackend()
    static func initialize() -> MessageBackend {
        return .shared
    }
    //MARK: - createSubscription
    func createInnerSubscription(userId:String!,recieveMsg:@escaping (_ messageModel:MessageListModel)->Void) {
        let subscription: GraphQLSubscriptionOperation<JSONValue> = Amplify.API.subscribe(request: .subscriptionMsg(byUserId: userId), valueListener: { (subscriptionEvent) in
            switch subscriptionEvent {
            case .connection(let subscriptionConnectionState):
                print("Subscription connect state is \(subscriptionConnectionState)")
                if subscriptionConnectionState == .disconnected {
                    SubscriptionTools.sharedTools.innderSubscription?.start()
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
                    if let subDic = dic["onMessagesByToUserID"] as? NSDictionary {
                        print("\(subDic)")
                        let model = MessageListModel(fromDictionary: subDic as! [String : Any])
                        recieveMsg(model)
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
        SubscriptionTools.sharedTools.innderSubscription = subscription
    }
    func createSubscription(userId:String!,recieveMsg:@escaping (_ messageModel:MessageListModel)->Void) {
        let subscription: GraphQLSubscriptionOperation<JSONValue> = Amplify.API.subscribe(request: .subscriptionMsg(byUserId: userId), valueListener: { (subscriptionEvent) in
            switch subscriptionEvent {
            case .connection(let subscriptionConnectionState):
                print("Subscription connect state is \(subscriptionConnectionState)")
                if subscriptionConnectionState == .disconnected {
                    SubscriptionTools.sharedTools.outterSubscription?.start()
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
                    if let subDic = dic["onMessagesByToUserID"] as? NSDictionary {
                        print("\(subDic)")
                        let model = MessageListModel(fromDictionary: subDic as! [String : Any])
                        recieveMsg(model)
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
        SubscriptionTools.sharedTools.outterSubscription = subscription
    }
    //createMsg
    //trainer send msg to user
    func sendMsgToUser(toUserId:String!,msgContent:String!,suc:@escaping (_ messageModel:MessageListModel)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.mutate(request: .createMsgToUser(byToUserId: toUserId, msgContent)){
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
                    if let subDic = dic["createMessage"] as? NSDictionary {
                        print("\(subDic)")
                        let model = MessageListModel(fromDictionary: subDic as! [String : Any])
                        suc(model)
                    }else {
                        fail("Send Message Failed!")
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
    //user send msg to trainer
    func sendMsgToTrainer(trainerId:String!,msgContent:String!,suc:@escaping (_ messageModel:MessageListModel)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.mutate(request: .createMsgToTrainer(byToTrainerId: trainerId, msgContent)){
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
                    if let subDic = dic["createMessage"] as? NSDictionary {
                        print("\(subDic)")
                        let model = MessageListModel(fromDictionary: subDic as! [String : Any])
                        suc(model)
                    }else {
                        fail("Send Message Failed!")
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
    //fetch lastMsgList by fromUserId status
    func fetchMessageListByStatus(toUserId:String?,fromUserId:String?,status:String?,suc:@escaping (_ list:Array<MessageListModel>)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchMessageByUser(fromUserId: fromUserId ?? "", toUserId: toUserId ?? "", status: status ?? "")){
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
                    let key:String = LoginTools.sharedTools.userInfo().userRole == "student" ? "messageByFromUserID" : "messageByToUserID"
                    guard let subDic = dic[key] as? NSDictionary else {
                        return
                    }
                    guard let itemList = subDic["items"] as? NSArray else {
                        return
                    }
                    print("~~~~~~~~~~~~\(itemList)")
                    var contentList = Array<MessageListModel>()
                    for item in itemList {
                        if let itemDic = item as? NSDictionary {
                            contentList.append(MessageListModel(fromDictionary: itemDic as! [String : Any]))
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
    //fetch lastMsgList by toUserId status
    func fetchMessageListByToUserId(toUserId:String?,status:String?,suc:@escaping (_ list:Array<MessageListModel>)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchMessageByToUserId(toUserId: toUserId ?? "", status: status ?? "")){
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
                    guard let subDic = dic["messageByToUserID"] as? NSDictionary else {
                        return
                    }
                    guard let itemList = subDic["items"] as? NSArray else {
                        return
                    }
                    print("~~~~~~~~~~~~\(itemList)")
                    var contentList = Array<MessageListModel>()
                    for item in itemList {
                        if let itemDic = item as? NSDictionary {
                            contentList.append(MessageListModel(fromDictionary: itemDic as! [String : Any]))
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
    //updateMessage status
    func updateMessageStatus(messageModel:MessageListModel,status:String,suc:@escaping ()->Void,fail:@escaping ()->Void) {
        Amplify.API.mutate(request: .updateMessageStatus(byToMessageModel: messageModel, messageStatus: status)){
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
                    if let subDic = dic["createMessage"] as? NSDictionary {
                        print("\(subDic)")
                        let model = MessageListModel(fromDictionary: subDic as! [String : Any])
                        suc()
                    }else {
                        fail()
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail()
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail()
            }
        }
    }
    //token balance
    func fetchTokenBalance(userId:String?,suc:@escaping (_ tokenBalance:Int)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchUserTokenBalance(byUserId: userId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
                    guard let postData = try? JSONEncoder().encode(data) else {
                        suc(0)
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        suc(0)
                        return
                    }
                    let dic = d as! NSDictionary
                    guard let subDic = dic["getUserProfile"] as? NSDictionary else {
                        suc(0)
                        return
                    }
                    guard let tokenBalance = subDic["TokenBalance"] as? Int else {
                        suc(0)
                        return
                    }
                    print("~~~~~~~~~~~~\(tokenBalance)")
                    suc(tokenBalance)
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
    //token price
    func fetchTokenPrice(trainerId:String?,suc:@escaping (_ tokenPrice:Int)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchUserTokenPrice(byTrainerId: trainerId ?? "")){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
                    guard let postData = try? JSONEncoder().encode(data) else {
                        suc(0)
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        suc(0)
                        return
                    }
                    let dic = d as! NSDictionary
                    guard let subDic = dic["getUserProfile"] as? NSDictionary else {
                        suc(0)
                        return
                    }
                    guard let tokenPrice = subDic["TokenPrice"] as? Int else {
                        suc(0)
                        return
                    }
                    print("~~~~~~~~~~~~\(tokenPrice)")
                    suc(tokenPrice)
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
    //update user's deviceToken
    func updateUserDeviceToken(deviceToken:String,suc:@escaping ()->Void,fail:@escaping ()->Void) {
        Amplify.API.mutate(request: .uploadUserDeviceToken(byUserId: LoginTools.sharedTools.userId(), deviceToken: deviceToken)){
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
                    if let subDic = dic["updateUserProfile"] as? NSDictionary {
                        print("\(subDic)")
                        suc()
                    }else {
                        fail()
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail()
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail()
            }
        }
    }
    func createGroupSubscription(groupId:String!,recieveMsg:@escaping (_ messageModel:MessageListModel)->Void) {
        let subscription: GraphQLSubscriptionOperation<JSONValue> = Amplify.API.subscribe(request: .subscriptionGroupMsg(byGroupId: groupId), valueListener: { (subscriptionEvent) in
            switch subscriptionEvent {
            case .connection(let subscriptionConnectionState):
                print("Subscription connect state is \(subscriptionConnectionState)")
                if subscriptionConnectionState == .disconnected {
                    SubscriptionTools.sharedTools.outterSubscription?.start()
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
                    if let subDic = dic["onMessageByGroupID"] as? NSDictionary {
                        print("\(subDic)")
                        let model = MessageListModel(fromDictionary: subDic as! [String : Any])
                        recieveMsg(model)
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
        SubscriptionTools.sharedTools.innderSubscription = subscription
    }
    func createOutrerGroupSubscription(groupId:String!,trainerId:String!,recieveMsg:@escaping (_ messageModel:MessageListModel)->Void) {
        let subscription: GraphQLSubscriptionOperation<JSONValue> = Amplify.API.subscribe(request: .subscriptionGroupMsg(byGroupId: groupId), valueListener: { (subscriptionEvent) in
            switch subscriptionEvent {
            case .connection(let subscriptionConnectionState):
                print("Subscription connect state is \(subscriptionConnectionState)")
                if subscriptionConnectionState == .disconnected {
                    SubscriptionTools.sharedTools.outterSubscription?.start()
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
                    if let subDic = dic["onMessageByGroupID"] as? NSDictionary {
                        print("\(subDic)")
                        let model = MessageListModel(fromDictionary: subDic as! [String : Any])
                        recieveMsg(model)
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
        SubscriptionTools.sharedTools.groupSubscription[trainerId] = subscription;
    }
    //createMsg
    func sendMsgToGroup(groupId:String!,msgContent:String!,suc:@escaping (_ messageModel:MessageListModel)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.mutate(request: .createMsgToGroup(byGroupId: groupId, msgContent)){
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
                    if let subDic = dic["createMessage"] as? NSDictionary {
                        print("\(subDic)")
                        let model = MessageListModel(fromDictionary: subDic as! [String : Any])
                        suc(model)
                    }else {
                        fail("Send Message Failed!")
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
    //fetch groupMsgList
    func fetchGroupMessageListByTrainerId(trainerId:String?,suc:@escaping (_ list:Array<MessageListModel>)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchMessageByTrainerId(trainerId: trainerId ?? "")){
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
                    guard let secondDic = subDic["UserMessageGroup"] as? NSDictionary else {
                        return
                    }
                    guard let thirdDic = secondDic["Messages"] as? NSDictionary else {
                        return
                    }
                    guard let itemList = thirdDic["items"] as? NSArray else {
                        return
                    }
                    print("~~~~~~~~~~~~\(itemList)")
                    var contentList = Array<MessageListModel>()
                    for item in itemList {
                        if let itemDic = item as? NSDictionary {
                            contentList.append(MessageListModel(fromDictionary: itemDic as! [String : Any]))
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
}
