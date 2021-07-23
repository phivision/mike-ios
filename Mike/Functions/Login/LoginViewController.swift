//
//  LoginViewController.swift
//  MikeIOS
//
//  Created by 殷聃 on 2021/4/25.
//

import UIKit
import Amplify
import AWSMobileClientXCF
class LoginViewController: UIViewController {
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
    @IBAction func appleLoginPressed(){
        let hostedUIOptions = HostedUIOptions(identityProvider: "SignInWithApple")
        AWSMobileClient.default().showSignIn(presentationAnchor: self.view.window!, hostedUIOptions: hostedUIOptions) { userState, error in
            
        }
//        Amplify.Auth.signInWithWebUI(for: .apple, presentationAnchor: self.view.window!) { result in
//                switch result {
//                case .success:
//                    print("Sign in succeeded")
//                case .failure(let error):
//                    print("Sign in failed \(error)")
//                }
//            }
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
