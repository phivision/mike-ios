//
//  CompleteUserInfoViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/30.
//

import UIKit
import Amplify

class CompleteUserInfoViewController: BaseViewController {
    @IBOutlet weak var loginBtn:UIButton!
    @IBOutlet weak var firstNameBg:UIImageView!
    @IBOutlet weak var lastNameBg:UIImageView!
    @IBOutlet weak var firstNameText:UITextField!
    @IBOutlet weak var lastNameText:UITextField!
    @IBOutlet weak var inputBg:UIView!
    var sub:String?
    var email:String?
    var hub:MBProgressHUD?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
    }
    func configView(){
        self.inputBg.layer.borderWidth = 1
        self.inputBg.layer.borderColor = HexRGBAlpha(0xF4F4F4,1).cgColor
        self.inputBg.layer.cornerRadius = 5
        
        self.firstNameText.delegate = self
        self.lastNameText.delegate = self
        
        self.loginBtn.layer.cornerRadius = 18.5
    }
    
    @IBAction func backBtnPressed(){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextBtnPressed(){
        if StringUtils.isBlank(value: self.firstNameText.text) {
            ToastHUD.showMsg(msg:"Please Input FirstName", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.lastNameText.text) {
            ToastHUD.showMsg(msg:"Please Input LastName", controller: self)
            return
        }
        self.hub = MBProgressHUD.showAdded(to: self.view, animated: true)
//        Backend.shared.resultProfile(userName: self.userNameText.text)

        Amplify.Auth.fetchUserAttributes() { result in
            switch result {
            case .success(let attributes):
                var email = ""
                var sub = ""
                for item in attributes {
                    if item.key == .email {
                        email = item.value
                    }
                    if item.key == .unknown("sub") {
                        sub = item.value
                    }
                }
                DispatchQueue.main.async {
                    self.createUserProfile(email: email,sub: sub)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.hub?.hide(animated: true)
                }
                print("Fetching user attributes failed with error \(error)")
            }
        }
    }
    func createUserProfile(email:String,sub:String){
        let jsonData = try! JSONSerialization.data(withJSONObject: ["email":email,"firstName":self.firstNameText.text ?? "","lastName":self.lastNameText.text ?? ""], options: .prettyPrinted)
        let request = RESTRequest(apiName: "appleSignIn",path: "/appleSignIn/configureProfile",body:jsonData)
        Amplify.API.post(request: request) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.fetchUserProfile(userId: sub)
                }
                print("Success ")
            case .failure(let apiError):
                DispatchQueue.main.async {
                    self.hub?.hide(animated: true)
                }
                print("Failed", apiError)
            }
        }
    }
    func fetchUserProfile(userId:String){
        LoginBackend.shared.fetchUserProfile(userId: userId) {
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
        } needCreateProfile: {
            
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CompleteUserInfoViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
