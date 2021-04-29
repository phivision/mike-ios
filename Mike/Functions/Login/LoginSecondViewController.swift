//
//  LoginSecondViewController.swift
//  MikeIOS
//
//  Created by 殷聃 on 2021/4/25.
//

import UIKit

class LoginSecondViewController: UIViewController {
    @IBOutlet weak var loginBtn:UIButton!
    @IBOutlet weak var userNameBg:UIImageView!
    @IBOutlet weak var pwdBg:UIImageView!
    @IBOutlet weak var userNameText:UITextField!
    @IBOutlet weak var pwdText:UITextField!
    @IBOutlet weak var userNameIcon:UIImageView!
    @IBOutlet weak var pwdIcon:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
    }
    
    func configView(){
        self.userNameText.delegate = self
        self.pwdText.delegate = self
        
        self.userNameBg.clipsToBounds = false
        self.userNameBg.layer.cornerRadius = 30
        self.userNameBg.layer.shadowColor = HexRGBAlpha(0xff333333,0.5).cgColor
        self.userNameBg.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.userNameBg.layer.shadowOpacity = 10
        
        self.pwdBg.clipsToBounds = false
        self.pwdBg.layer.cornerRadius = 30
        self.pwdBg.layer.shadowColor = HexRGBAlpha(0xff333333,0.5).cgColor
        self.pwdBg.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.pwdBg.layer.shadowOpacity = 10
        
        self.loginBtn.layer.cornerRadius = 30
        self.loginBtn.layer.shadowColor = HexRGBAlpha(0xff333333,0.5).cgColor
        self.loginBtn.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.loginBtn.layer.shadowOpacity = 10
    }
    
    @IBAction func backBtnPressed(){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func loginBtnPressed(){
        Backend.shared.login(userName: "1103720832@qq.com", pwd: "Test2021!") {
            DispatchQueue.main.async {
                let homeVC:HomeViewController = HomeViewController()
                let navVC:UINavigationController = UINavigationController(rootViewController: homeVC)
                keyWindow?.rootViewController = navVC;
            }
        } fail: { error in
            
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
        if textField == self.userNameText {
            self.userNameBg.layer.borderColor = HexRGBAlpha(0xff5DCBCC,1.0).cgColor
            self.userNameIcon.image = UIImage(named: "userName_S")
            
            self.pwdBg.layer.borderColor = UIColor.clear.cgColor
            self.pwdIcon.image = UIImage(named: "password_N")
        }else{
            self.pwdBg.layer.borderColor = HexRGBAlpha(0xff5DCBCC,1.0).cgColor
            self.pwdIcon.image = UIImage(named: "password_S")
            
            self.userNameBg.layer.borderColor = UIColor.clear.cgColor
            self.userNameIcon.image = UIImage(named: "userName_N")
        }
        return true
    }
}
