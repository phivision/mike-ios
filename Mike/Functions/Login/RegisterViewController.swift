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
    var isTrainer:Bool = false
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
        self.userNameText.text = self.userName
        self.pwdText.delegate = self
        self.firstNameText.delegate = self
        self.lastNameText.delegate = self
        
        self.userNameText.textContentType = .emailAddress
        self.userNameText.keyboardType = .emailAddress
        self.pwdText.textContentType = .newPassword
        self.firstNameText.textContentType = .givenName
        self.lastNameText.textContentType = .familyName
        
        self.hanldeBgCornerAndShadow(bgView: self.inputBg)
        
        self.registerBtn.layer.cornerRadius = 18.5
        
        self.userRoleTrainerBtn.isSelected = false
        self.userRoleStudentBtn.isSelected = true
        
        self.registerBtn.backgroundColor = UIColor(255, 145, 96)
        self.registerBtn.isEnabled = false
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
            ToastHUD.showMsg(msg:"Please enter your email", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.pwd) {
            ToastHUD.showMsg(msg:"Please enter a password", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.firstName) {
            ToastHUD.showMsg(msg:"Please enter your first name", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.lastName) {
            ToastHUD.showMsg(msg:"Please enter your last name", controller: self)
            return
        }
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        LoginBackend.shared.signUp(username: self.userName, password: self.pwd, firstName: self.firstName,lastName: self.lastName,userRole: self.isTrainer == true ? "trainer" : "student") {
            DispatchQueue.main.async {
                hud.hide(animated: true)
                let secondVC = RegisterConfirmViewController()
                secondVC.userName = self.userName
                secondVC.password = self.pwd
                self.navigationController?.pushViewController(secondVC, animated: true)
            }
        } suc: {
            DispatchQueue.main.async {
                hud.hide(animated: true)
                self.navigationController?.popViewController(animated: true)
            }
        } fail: { error in
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:"Registration unsuccessful", controller: self)
            }
        }
    }
    
    @IBAction func textValueChanged(textfield:UITextField){
        if !self.userNameText.text!.isEmpty && !self.pwdText.text!.isEmpty && !self.firstNameText.text!.isEmpty && !self.lastNameText.text!.isEmpty {
            self.registerBtn.backgroundColor = UIColor(255, 78, 0)
            self.registerBtn.isEnabled = true
        } else {
            self.registerBtn.backgroundColor = UIColor(255, 145, 96)
            self.registerBtn.isEnabled = false
        }
        
        
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
