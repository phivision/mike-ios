//
//  LoginTools.swift
//  Mike
//
//  Created by 殷聃 on 2021/4/28.
//

import UIKit

class LoginTools: NSObject {
    static let sharedTools = LoginTools()
    var isLogin:Bool = false
    var userProfile:UserProfile?
    private override init() {
        super.init()
    }
}
