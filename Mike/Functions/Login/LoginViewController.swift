//
//  LoginViewController.swift
//  MikeIOS
//
//  Created by 殷聃 on 2021/4/25.
//

import UIKit
import Amplify
import AWSMobileClientXCF
import AWSCognitoAuthPlugin
import AWSPluginsCore
enum AuthProvider:String {
    case signInWithApple
}
class LoginViewController: BaseViewController {
    @IBOutlet weak var loginBtn:UIButton!
    @IBOutlet weak var appleLoginBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        // Do any additional setup after loading the view.
    }
    func configView(){
        self.view.backgroundColor = orangeColor
        self.appleLoginBtn.layer.cornerRadius = 5
    }

    @IBAction func loginBtnPressed(){
        let secondVC = LoginSecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @objc func appleLoginPressed(){
        Amplify.Auth.signOut()
        LoginBackend.shared.signInWithApple{
            self.updateDeviceToken()
            DispatchQueue.main.async {
                let homeVC:HomeTabViewController = HomeTabViewController()
                self.changeRootController(controller: homeVC)
            }
        } fail: { error in
            Amplify.Auth.fetchUserAttributes { (result) in
                                print(result)
                            }
//            self.logOut()
//            DispatchQueue.main.async {
//                ToastHUD.showMsg(msg:error, controller: self)
//            }
        } confirmSignUp: {
            DispatchQueue.main.async {
                self.resenConfirmCode()
            }
            
        }
    }
    func resenConfirmCode(){
//        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
//        LoginBackend.shared.resendCodeForSignUp(username: self.userNameText.text ?? "") {
//            DispatchQueue.main.async {
//                hud.hide(animated: true)
//                ToastHUD.showMsg(msg:"Verification code has been sent to your email, please check！", controller: self)
//                let secondVC = RegisterConfirmViewController()
//                secondVC.userName = self.userNameText.text
//                self.navigationController?.pushViewController(secondVC, animated: true)
//            }
//        } fail: { error in
//            DispatchQueue.main.async {
//                hud.hide(animated: true)
//                ToastHUD.showMsg(msg:error, controller: self)
//            }
//        }
    }
    func updateDeviceToken(){
        if StringUtils.isBlank(value: LoginTools.sharedTools.deviceToken) == false {
            MessageBackend.shared.updateUserDeviceToken(deviceToken: LoginTools.sharedTools.deviceToken) {
                
            } fail: {
                
            }
        }
    }
    func logOut(){
        LoginBackend.shared.signOut {
            
        } fail: {

        }
    }
    @IBAction func registerBtnPressed(){
        let secondVC = RegisterViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
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
