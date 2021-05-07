//
//  UserManager.swift
//  Boyaios
//
//  Created by huasen on 2020/3/21.
//  Copyright © 2020 yind. All rights reserved.
//

import UIKit
let kUserArchivePathKey = "userInfo.archive"
let key = "userInfo"
class UserManager: NSObject {
//    LoginInfoModel
    static func saveUerInfo(model:LoginInfoModel){
        let success:Bool = ArchiveTool.archiveModel(model: model, toPath: ArchiveTool.fetchPath(pathKey: kUserArchivePathKey))
        if (!success) {
            print("存储用户信息失败")
        }
    }
    
    static func readUserInfo()->LoginInfoModel{
        if let model = ArchiveTool.unarchive(path: ArchiveTool.fetchPath(pathKey: kUserArchivePathKey)) as? LoginInfoModel{
            return model
        }else{
            return LoginInfoModel(fromDictionary: [:])
        }
    }
    
    static func clearUserInfo(){
        let model:LoginInfoModel = LoginInfoModel(fromDictionary: [:])
        UserManager.saveUerInfo(model: model)
    }
}
