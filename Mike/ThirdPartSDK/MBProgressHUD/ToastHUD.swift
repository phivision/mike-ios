//
//  ToastHUD.swift
//  Mike
//
//  Created by 殷聃 on 2021/4/30.
//

import UIKit

class ToastHUD: NSObject {
    static func showMsg(msg:String!,controller:UIViewController!){
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: controller.view, animated: true)
        hud.mode = .text
        hud.detailsLabel.text = msg
        hud.removeFromSuperViewOnHide = true
        hud.isUserInteractionEnabled = false
        hud.hide(animated: true, afterDelay: 1.0)
    }
}
