//
//  HomeBackend.swift
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
class HomeBackend: NSObject {
    static let shared = HomeBackend()
    static func initialize() -> HomeBackend {
        return .shared
    }
    func fetchSubscriptionList(userId:String?,suc:@escaping (_ list:Array<UserSubscriptionTrainerListModel>)->Void){
        Amplify.API.query(request: .getSubscriptionList(byId: userId ?? "")){
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
}
