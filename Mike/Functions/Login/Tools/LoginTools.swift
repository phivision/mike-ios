//
//  LoginTools.swift
//  Boyaios
//
//  Created by huasen on 2020/3/21.
//  Copyright © 2020 yind. All rights reserved.
//

import UIKit

class LoginTools: NSObject {
    static let sharedTools = LoginTools()
    var videoHost = ""
    var deviceToken = ""
    private override init() {
        super.init()
    }
    func saveUserInfo(dic:[String:Any]){
        UserManager.saveUerInfo(model: LoginInfoModel.init(fromDictionary: dic))
    }
    func removeUserInfo(){
        UserManager.clearUserInfo()
    }
    func userId() -> String {
        let model:LoginInfoModel = UserManager.readUserInfo()
        return model.id ?? ""
    }
    func userInfo() -> LoginInfoModel{
        let model:LoginInfoModel = UserManager.readUserInfo()
        return model
    }
}
