//
//  LoginSecondViewController.swift
//  MikeIOS
//
//  Created by 殷聃 on 2021/4/25.
//

import UIKit
import Amplify
class LoginSecondViewController: BaseViewController {
    @IBOutlet weak var loginBtn:UIButton!
    @IBOutlet weak var userNameBg:UIImageView!
    @IBOutlet weak var pwdBg:UIImageView!
    @IBOutlet weak var userNameText:UITextField!
    @IBOutlet weak var pwdText:UITextField!
    @IBOutlet weak var inputBg:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
    }
    
    func configView(){
        self.inputBg.layer.borderWidth = 1
        self.inputBg.layer.borderColor = HexRGBAlpha(0xF4F4F4,1).cgColor
        self.inputBg.layer.cornerRadius = 5
        
        self.userNameText.delegate = self
        self.pwdText.delegate = self
        
        self.loginBtn.layer.cornerRadius = 18.5
    }
    
    @IBAction func backBtnPressed(){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func loginBtnPressed(){
        if StringUtils.isBlank(value: self.userNameText.text) {
            ToastHUD.showMsg(msg:"Please Input Username", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.pwdText.text) {
            ToastHUD.showMsg(msg:"Please Input Password", controller: self)
            return
        }
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
//        Backend.shared.resultProfile(userName: self.userNameText.text)

        LoginBackend.shared.login(userName: self.userNameText.text, pwd: self.pwdText.text) {
            self.updateDeviceToken()
            DispatchQueue.main.async {
                hud.hide(animated: true)
                let homeVC:HomeTabViewController = HomeTabViewController()
                self.changeRootController(controller: homeVC)
            }
        } fail: { error in
            self.logOut()
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:error, controller: self)
            }
        }

    }
    func updateDeviceToken(){
        if StringUtils.isBlank(value: LoginTools.sharedTools.deviceToken) == false {
            MessageBackend.shared.updateUserDeviceToken(deviceToken: LoginTools.sharedTools.deviceToken) {
                
            } fail: {
                
            }
        }
    }
    @IBAction func fogotPwdBtnPressed(){
        let vc = FogotPwdViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func logOut(){
        LoginBackend.shared.signOut {
            
        } fail: {

        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LoginSecondViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
