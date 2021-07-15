//
//  UserContentBackend.swift
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
class UserContentBackend: NSObject {
    static let shared = UserContentBackend()
    static func initialize() -> UserContentBackend {
        return .shared
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
//                    fail("\(error.errorDescription)")
                    suc(false)
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                suc(false)
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
}
