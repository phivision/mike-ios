//
//  AppleLoginViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/26.
//

import UIKit
import SafariServices

class AppleLoginViewController: SFSafariViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(dismissVC), name: Notification.Name(rawValue: "dismissSafari"), object: nil)
        
        // Do any additional setup after loading the view.
    }
    @objc func dismissVC(){
        self.dismiss(animated: true, completion: nil)
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
