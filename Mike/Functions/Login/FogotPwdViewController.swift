//
//  RegisterConfirmViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/17.
//

import UIKit

class FogotPwdViewController: BaseViewController {
    @IBOutlet weak var continueBtn:UIButton!
    @IBOutlet weak var userNameBg:UIImageView!
    @IBOutlet weak var userNameText:UITextField!
    var userName:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
    }
    
    func configView(){
        self.userNameText.delegate = self
        
        self.hanldeBgCornerAndShadow(bgView: self.userNameBg)
        
        self.continueBtn.layer.cornerRadius = 20
        self.continueBtn.layer.shadowColor = HexRGBAlpha(0xff000000,0.16).cgColor
        self.continueBtn.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.continueBtn.layer.shadowOpacity = 2
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
        if StringUtils.isBlank(value: self.userName) {
            ToastHUD.showMsg(msg:"Please Input Your UserName", controller: self)
            return
        }
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        Backend.shared.resetPassword(username: self.userName) {
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:"Verification code has been sent to your email, please check！", controller: self)
                let vc:FogotConfirmViewController = FogotConfirmViewController()
                vc.userName = self.userName
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } suc: {
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:"Reset Password Success", controller: self)
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
extension FogotPwdViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
