//
//  SearchBackend.swift
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
class SearchBackend: NSObject {
    static let shared = SearchBackend()
    static func initialize() -> SearchBackend {
        return .shared
    }
    // MARK: - fetch Trainer for message system
    func fetchTrainerListWithKeyword(keyword:String,suc:@escaping (_ trainerList:Array<UserCenterTrainer>)->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchTrainerList(byKeyword: keyword)){
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
                    guard let subDic = dic["trainerSearch"] as? NSDictionary else {
                        return
                    }
                    guard let itemList = subDic["items"] as? NSArray else {
                        return
                    }
                    print("~~~~~~~~~~~~\(itemList)")
                    var trainerList = Array<UserCenterTrainer>()
                    for item in itemList {
                        if let itemDic = item as? NSDictionary {
                            trainerList.append(UserCenterTrainer(fromDictionary: itemDic as! [String : Any]))
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
}
