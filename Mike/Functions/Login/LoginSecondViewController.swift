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
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var subHeader: UILabel!
    @IBOutlet weak var userNameText:UITextField!
    @IBOutlet weak var pwdText:UITextField!
    @IBOutlet weak var inputBg:UIView!
    @IBOutlet weak var divider: UIImageView!
    
    
    @IBOutlet weak var inputBgHeight: NSLayoutConstraint!
    
    var hasEnteredEmail: Bool! = false
    var username: String! = ""
    
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
        
        if !hasEnteredEmail {
            self.divider.isHidden = true
            self.pwdText.isHidden = true
            self.pwdBg.isHidden = true
            self.inputBgHeight.constant = 37
            self.header.text = "Welcome"
            self.subHeader.text = "Please enter your email"
        } else {
            self.pwdText.isHidden = false
            self.pwdBg.isHidden = false
            self.divider.isHidden = false
            self.inputBgHeight.constant = 74
            self.header.text = "Welcome back"
            self.subHeader.text = "Please enter your password"
        }
        self.loginBtn.layer.cornerRadius = 18.5
        self.loginBtn.backgroundColor = UIColor(255, 145, 96)
        self.loginBtn.isEnabled = false
        if !self.username.isEmpty {
            self.userNameText.text = self.username
        }
    }
    
    @IBAction func textChanged(_ sender: Any) {
        if self.hasEnteredEmail{
            if !self.pwdText.text!.isEmpty && !self.userNameText.text!.isEmpty {
                self.loginBtn.backgroundColor = UIColor(255, 78, 0)
                self.loginBtn.isEnabled = true
            } else {
                self.loginBtn.backgroundColor = UIColor(255, 145, 96)
                self.loginBtn.isEnabled = false
            }
        } else {
            if !self.userNameText.text!.isEmpty {
                self.loginBtn.backgroundColor = UIColor(255,78,0)
                self.loginBtn.isEnabled = true
            } else {
                self.loginBtn.backgroundColor = UIColor(255, 145, 96)
                self.loginBtn.isEnabled = false
            }
        }
    }
    @IBAction func backBtnPressed(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginBtnPressed(){
        if hasEnteredEmail == false {
            if StringUtils.isBlank(value: self.userNameText.text) {
                ToastHUD.showMsg(msg:"Please Input Username", controller: self)
                return
            }
            LoginBackend.shared.fetchUserList(email: self.userNameText.text) { exist in
                if exist {
                    DispatchQueue.main.async {
                        let secondVC = LoginSecondViewController()
                        secondVC.username = self.userNameText.text!
                        secondVC.hasEnteredEmail = true
                        
                        self.navigationController?.pushViewController(secondVC, animated: true)
                    }
                } else {
                    DispatchQueue.main.async {
                    let secondVC = RegisterViewController()
                    secondVC.userName=self.userNameText.text!
                    self.navigationController?.pushViewController(secondVC, animated: true)
                    }
                }
            }
        } else {
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
                        ToastHUD.showMsg(msg:error.description, controller: self)
                    }
                } confirmSignUp: {
                    DispatchQueue.main.async {
                        hud.hide(animated: true)
                        self.resenConfirmCode()
                    }
                    
                } needCreateProfile: {
                    
                }

//        LoginBackend.shared.login(userName: self.userNameText.text, pwd: self.pwdText.text) {
//            self.updateDeviceToken()
//            DispatchQueue.main.async {
//                hud.hide(animated: true)
//                let homeVC:HomeTabViewController = HomeTabViewController()
//                self.changeRootController(controller: homeVC)
//            }
//        } fail: { error in
//            self.logOut()
//            DispatchQueue.main.async {
//                hud.hide(animated: true)
//                ToastHUD.showMsg(msg:error, controller: self)
//            }
//        }
        }
    }
    func resenConfirmCode(){
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        LoginBackend.shared.resendCodeForSignUp(username: self.userNameText.text ?? "") {
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:"Verification code has been sent to your email, please check！", controller: self)
                let secondVC = RegisterConfirmViewController()
                secondVC.userName = self.userNameText.text
                self.navigationController?.pushViewController(secondVC, animated: true)
            }
        } fail: { error in
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
            LoginTools.sharedTools.trainerModel = nil
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
