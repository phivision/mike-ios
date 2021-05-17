//
//  LoginViewController.swift
//  MikeIOS
//
//  Created by 殷聃 on 2021/4/25.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        // Do any additional setup after loading the view.
    }
    func configView(){
        self.loginBtn.layer.cornerRadius = 20;
    }

    @IBAction func loginBtnPressed(){
        Backend.shared.signOut {

        } fail: {

        }
        let secondVC = LoginSecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
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
