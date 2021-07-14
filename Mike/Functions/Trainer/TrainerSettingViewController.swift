//
//  TrainerSettingViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/14.
//

import UIKit

class TrainerSettingViewController: BaseViewController {
    @IBOutlet weak var subscriptionPriceBg:UIImageView!
    @IBOutlet weak var perMessagePriceBg:UIImageView!
    @IBOutlet weak var subscriptionPrice:UILabel!
    @IBOutlet weak var perMessagePrice:UILabel!
    @IBOutlet weak var saveBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configView()
        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    func configView(){
        self.subscriptionPriceBg.layer.cornerRadius = 5
        self.subscriptionPriceBg.layer.borderWidth = 1
        self.subscriptionPriceBg.layer.borderColor = lightGreyColor.cgColor
        self.perMessagePriceBg.layer.cornerRadius = 5
        self.perMessagePriceBg.layer.borderWidth = 1
        self.perMessagePriceBg.layer.borderColor = lightGreyColor.cgColor
        self.saveBtn.layer.cornerRadius = 18.5
        self.saveBtn.clipsToBounds = true
    }
    @IBAction func signOut(){
        Backend.shared.signOut {
            LoginTools.sharedTools.removeUserInfo()
            SubscriptionTools.sharedTools.outterSubscription?.cancel()
            DispatchQueue.main.async {
                let loginVC:LoginViewController = LoginViewController()
                let navVC:UINavigationController  = UINavigationController(rootViewController: loginVC)
                navVC.isNavigationBarHidden = true
                self.changeRootController(controller: navVC)
            }
        } fail: {
            
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
