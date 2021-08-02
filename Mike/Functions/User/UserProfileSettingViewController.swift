//
//  UserProfileSettingViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/8.
//

import UIKit

class UserProfileSettingViewController: BaseViewController {
    @IBOutlet weak var signOutBtn:UIButton!
    @IBOutlet weak var editBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configView()
    }
    func configView(){
        self.signOutBtn.layer.cornerRadius = 20
        self.signOutBtn.clipsToBounds = true
    }
    @IBAction func dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func signOut(){
        LoginBackend.shared.signOut {
            Backend.shared.resetDeviceToken()
            LoginTools.sharedTools.trainerModel = nil
            LoginTools.sharedTools.removeUserInfo()
            SubscriptionTools.sharedTools.outterSubscription?.cancel()
            for key in SubscriptionTools.sharedTools.groupSubscription {
                let subscription = SubscriptionTools.sharedTools.groupSubscription["\(key)"]
                subscription?.cancel()
            }
            DispatchQueue.main.async {
                let loginVC:LoginViewController = LoginViewController()
                let navVC:UINavigationController  = UINavigationController(rootViewController: loginVC)
                navVC.isNavigationBarHidden = true
                self.changeRootController(controller: navVC)
            }
        } fail: {
            
        }
    }
    @IBAction func editProfile(){
        let vc:UserProfileEditViewController = UserProfileEditViewController()
        vc.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func uploadContent(){
        let vc:ContentUploadViewController = ContentUploadViewController()
        let nav:UINavigationController = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.isNavigationBarHidden = true
        DispatchQueue.main.async {
            self.present(nav, animated: true, completion: nil)
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
