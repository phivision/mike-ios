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
    @IBOutlet weak var userNameText:UITextField!
    @IBOutlet weak var pwdText:UITextField!
    @IBOutlet weak var firstNameText:UITextField!
    @IBOutlet weak var lastNameText:UITextField!
    @IBOutlet weak var userRoleTrainerBtn:UIButton!
    @IBOutlet weak var userRoleStudentBtn:UIButton!
    @IBOutlet weak var inputBg:UIView!
    var userName:String = ""
    var pwd:String = ""
    var firstName:String = ""
    var lastName:String = ""
    var isTrainer:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
    }
    
    func configView(){
        if #available(iOS 12.0, *) {
            self.pwdText.textContentType = .newPassword
        } else {
            // Fallback on earlier versions
        };
        if #available(iOS 12.0, *) {
            self.pwdText.passwordRules =  UITextInputPasswordRules(descriptor: "required: lower; required: upper; allowe: digit; required: [-]; minlength: 5;")
        } else {
            // Fallback on earlier versions
        }//[UITextInputPasswordRules passwordRulesWithDescriptor:@""];
        
        self.userNameText.delegate = self
        self.userNameText.text = self.userName ?? ""
        self.pwdText.delegate = self
        self.firstNameText.delegate = self
        self.lastNameText.delegate = self
        
        self.hanldeBgCornerAndShadow(bgView: self.inputBg)
        
        self.registerBtn.layer.cornerRadius = 18.5
        
        self.userRoleTrainerBtn.isSelected = true
        self.userRoleStudentBtn.isSelected = false
    }
    
    @IBAction func userRoleChanged(sender:UIButton!){
        if sender == self.userRoleTrainerBtn {
            self.userRoleTrainerBtn.isSelected = true
            self.userRoleStudentBtn.isSelected = false
            self.isTrainer = true
        }else{
            self.userRoleTrainerBtn.isSelected = false
            self.userRoleStudentBtn.isSelected = true
            self.isTrainer = false
        }
    }
    
    func hanldeBgCornerAndShadow(bgView:UIView){
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 5
        bgView.layer.borderColor = lightGreyColor.cgColor
        bgView.layer.borderWidth = 1
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
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        LoginBackend.shared.signUp(username: self.userName, password: self.pwd, firstName: self.firstName,lastName: self.lastName,userRole: self.isTrainer == true ? "trainer" : "student") {
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
                ToastHUD.showMsg(msg:"Register Succeeded", controller: self)
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
