//
//  RegisterConfirmViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/17.
//

import UIKit

class RegisterConfirmViewController: BaseViewController {
    var userName:String!
    @IBOutlet weak var confirmBtn:UIButton!
    @IBOutlet weak var codeBg:UIImageView!
    @IBOutlet weak var codeText:UITextField!
    var codeValue:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
    }
    
    func configView(){
        self.codeText.delegate = self
        
        self.hanldeBgCornerAndShadow(bgView: self.codeBg)
        
        self.confirmBtn.layer.cornerRadius = 18.5
        
        self.confirmBtn.backgroundColor = UIColor(255, 145, 96)
        self.confirmBtn.isEnabled = false
    }
    
    func hanldeBgCornerAndShadow(bgView:UIImageView){
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 5
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = lightGreyColor.cgColor
    }
    
    @IBAction func backBtnPressed(){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func confirmBtnPressed(){
        if StringUtils.isBlank(value: self.codeValue) {
            ToastHUD.showMsg(msg:"Please Input Verification Code", controller: self)
            return
        }
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        LoginBackend.shared.confirmSignUp(for: self.userName, with: self.codeValue) {
            DispatchQueue.main.async {
                hud.hide(animated: true)
                self.navigationController?.popToRootViewController(animated: true)
            }
        } fail: { error in
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:error, controller: self)
            }
        }
    }
    
    @IBAction func textValueChanged(textfield:UITextField){
        if self.codeText.text!.count == 6 {
            self.confirmBtn.backgroundColor = UIColor(255, 78, 0)
            self.confirmBtn.isEnabled = true
        } else {
            self.confirmBtn.backgroundColor = UIColor(255, 145, 96)
            self.confirmBtn.isEnabled = false
        }
        if textfield == self.codeText {
            self.codeValue = textfield.text ?? ""
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
extension RegisterConfirmViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
