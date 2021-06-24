//
//  SubscriptionTools.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/23.
//

import UIKit
import Amplify

class SubscriptionTools: NSObject {
    static let sharedTools = SubscriptionTools()
    var subscriptionList:Array<GraphQLSubscriptionOperation<JSONValue>> = []
    var innderSubscription:GraphQLSubscriptionOperation<JSONValue>?
    private override init() {
        super.init()
    }
    func fetchMsgListBy(toUserId:String!) -> Array<MessageListModel>{
        let dataFrom = UserDefaults.standard.data(forKey: "\(toUserId ?? "")")
        if dataFrom != nil {
            do {
                let savedList = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataFrom!) as? Array<MessageListModel>
                var msgList:Array<MessageListModel> = Array<MessageListModel>()
                msgList.append(contentsOf: savedList ?? [])
                return msgList
            } catch let error {
                print("\(error)")
                return []
            }
            
        }else{
            return []
        }
    }
}
