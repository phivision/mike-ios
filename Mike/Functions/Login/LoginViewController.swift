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
//        let jsonData = try! JSONSerialization.data(withJSONObject: ["email":"729554966@qq.com","firstName":"Test","lastName":"TestLastName"], options: .prettyPrinted)
//        let request = RESTRequest(apiName: "appleSignIn",path: "/appleSignIn/configureProfile",body:jsonData)
//        Amplify.API.post(request: request) { result in
//            switch result {
//            case .success(let data):
//                print("Success ")
//            case .failure(let apiError):
//                print("Failed", apiError)
//            }
//        }
        Amplify.Auth.signOut { result in
            DispatchQueue.main.async {
                self.appleLogin()
            }
        }
    }
    func appleLogin(){
        LoginBackend.shared.signInWithApple {
            self.updateDeviceToken()
            DispatchQueue.main.async {
                let homeVC:HomeTabViewController = HomeTabViewController()
                self.changeRootController(controller: homeVC)
            }
        } fail: { error in
            self.logOut()
            DispatchQueue.main.async {
                ToastHUD.showMsg(msg:error, controller: self)
            }
        } confirmSignUp: {
            
        } needCreateProfile: {
            DispatchQueue.main.async {
                ToastHUD.showMsg(msg:"Waiting for completing!", controller: self)
            }
//            Amplify.Auth.fetchUserAttributes() { result in
//                switch result {
//                case .success(let attributes):
//                    var email = ""
//                    var sub = ""
//                    for item in attributes {
//                        if item.key == .email {
//                            email = item.value
//                        }
//                        if item.key == .unknown("sub") {
//                            sub = item.value
//                        }
//                        print("key value - \(item.key)_____\(item.value)")
//                    }
//                    print("User attributes - \(email)_____\(sub)")
//                    DispatchQueue.main.async {
//                        self.createUserProfile(email: email, subId: sub)
//                    }
//                case .failure(let error):
//                    print("Fetching user attributes failed with error \(error)")
//                }
//            }
        }
    }
    func createUserProfile(email:String,subId:String){
        LoginBackend.shared.createUserProfile(firstname: "test", lastname: "apple", email: email, subId: subId) { suc in
            
        } fail: { error in
            print("\(error)");
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
