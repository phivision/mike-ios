//
//  RegisterViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/17.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var registerBtn:UIButton!
    @IBOutlet weak var userNameBg:UIImageView!
    @IBOutlet weak var pwdBg:UIImageView!
    @IBOutlet weak var firstNameBg:UIImageView!
    @IBOutlet weak var lastNameBg:UIImageView!
    @IBOutlet weak var phoneBg:UIImageView!
    @IBOutlet weak var userNameText:UITextField!
    @IBOutlet weak var pwdText:UITextField!
    @IBOutlet weak var firstNameText:UITextField!
    @IBOutlet weak var lastNameText:UITextField!
    @IBOutlet weak var phoneText:UITextField!
    var userName:String = ""
    var pwd:String = ""
    var firstName:String = ""
    var lastName:String = ""
    var phone:String  = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
    }
    
    func configView(){
        self.userNameText.delegate = self
        self.pwdText.delegate = self
        self.firstNameText.delegate = self
        self.lastNameText.delegate = self
        self.phoneText.delegate = self
        
        self.hanldeBgCornerAndShadow(bgView: self.userNameBg)
        self.hanldeBgCornerAndShadow(bgView: self.pwdBg)
        self.hanldeBgCornerAndShadow(bgView: self.firstNameBg)
        self.hanldeBgCornerAndShadow(bgView: self.lastNameBg)
        self.hanldeBgCornerAndShadow(bgView: self.phoneBg)
        
        self.registerBtn.layer.cornerRadius = 20
        self.registerBtn.layer.shadowColor = HexRGBAlpha(0xff000000,0.16).cgColor
        self.registerBtn.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.registerBtn.layer.shadowOpacity = 2
    }
    
    func hanldeBgCornerAndShadow(bgView:UIImageView){
        bgView.clipsToBounds = false
        bgView.layer.cornerRadius = 20
        bgView.layer.shadowColor = HexRGBAlpha(0xff000000,0.16).cgColor
        bgView.layer.shadowOffset = CGSize(width: 2, height: 2)
        bgView.layer.shadowOpacity = 2
    }
    
    @IBAction func backBtnPressed(){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func registerBtnPressed(){
        if StringUtils.isBlank(value: self.userName) {
            ToastHUD.showMsg(msg:"Please Input Username", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.pwd) {
            ToastHUD.showMsg(msg:"Please Input Password", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.firstName) {
            ToastHUD.showMsg(msg:"Please Input First Name", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.lastName) {
            ToastHUD.showMsg(msg:"Please Input Last Name", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.phone) {
            ToastHUD.showMsg(msg:"Please Input Phone", controller: self)
            return
        }
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        Backend.shared.signUp(username: self.userName, password: self.pwd, firstName: self.firstName,lastName: self.lastName, phone: self.phone) {
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:"Verification code has been sent to your email, please check！", controller: self)
                let secondVC = RegisterConfirmViewController()
                secondVC.userName = self.userName
                self.navigationController?.pushViewController(secondVC, animated: true)
            }
        } suc: {
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:"Register Success", controller: self)
                self.navigationController?.popViewController(animated: true)
            }
        } fail: { error in
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:error, controller: self)
            }
        }
    }
    
    @IBAction func textValueChanged(textfield:UITextField){
        if textfield == self.userNameText {
            self.userName = textfield.text ?? ""
        }else if textfield == self.pwdText{
            self.pwd = textfield.text ?? ""
        }else if textfield == self.firstNameText{
            self.firstName = textfield.text ?? ""
        }else if textfield == self.lastNameText{
            self.lastName = textfield.text ?? ""
        }else if textfield == self.phoneText{
            self.phone = textfield.text ?? ""
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
extension RegisterViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
