//
//  FogotConfirmViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/17.
//

import UIKit

class FogotConfirmViewController: BaseViewController {
    var userName:String!
    @IBOutlet weak var confirmBtn:UIButton!
    @IBOutlet weak var codeBg:UIImageView!
    @IBOutlet weak var codeText:UITextField!
    @IBOutlet weak var newPwdBg:UIImageView!
    @IBOutlet weak var newPwdText:UITextField!
    var codeValue:String = ""
    var newPwdValue:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
    }
    
    func configView(){
        self.codeText.delegate = self
        self.newPwdText.delegate = self
        
        self.hanldeBgCornerAndShadow(bgView: self.codeBg)
        self.hanldeBgCornerAndShadow(bgView: self.newPwdBg)
        
        self.confirmBtn.layer.cornerRadius = 20
        self.confirmBtn.layer.shadowColor = HexRGBAlpha(0xff000000,0.16).cgColor
        self.confirmBtn.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.confirmBtn.layer.shadowOpacity = 2
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
    @IBAction func confirmBtnPressed(){
        if StringUtils.isBlank(value: self.codeValue) {
            ToastHUD.showMsg(msg:"Please Input Verification Code", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.newPwdValue) {
            ToastHUD.showMsg(msg:"Please Input New Password", controller: self)
            return
        }
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        Backend.shared.confirmResetPassword(username: self.userName, newPassword: self.newPwdValue, confirmationCode: self.codeValue) {
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:"Reset Password Success", controller: self)
                self.navigationController?.popToViewController(self.navigationController!.viewControllers[1], animated: true)
            }
        } fail: { error in
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:error, controller: self)
            }
        }
    }
    
    @IBAction func textValueChanged(textfield:UITextField){
        if textfield == self.codeText {
            self.codeValue = textfield.text ?? ""
        }else if textfield == self.newPwdText{
            self.newPwdValue = textfield.text ?? ""
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
extension FogotConfirmViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
