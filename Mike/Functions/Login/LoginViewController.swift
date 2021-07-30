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
    var hub:MBProgressHUD?
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
        Amplify.Auth.signOut { result in
            DispatchQueue.main.async {
                self.appleLogin()
            }
        }
    }
    func appleLogin(){
        self.hub = MBProgressHUD.showAdded(to: self.view, animated: true)
        LoginBackend.shared.signInWithApple {
            self.updateDeviceToken()
            DispatchQueue.main.async {
                self.hub?.hide(animated: true)
                let homeVC:HomeTabViewController = HomeTabViewController()
                self.changeRootController(controller: homeVC)
            }
        } fail: { error in
            self.logOut()
            DispatchQueue.main.async {
                self.hub?.hide(animated: true)
                ToastHUD.showMsg(msg:error, controller: self)
            }
        } confirmSignUp: {
            
        } needCreateProfile: {
            DispatchQueue.main.async {
                self.hub?.hide(animated: true)
                ToastHUD.showMsg(msg:"Waiting for completing!", controller: self)
                let vc = CompleteUserInfoViewController()
                self.navigationController?.pushViewController(vc, animated: true)
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
