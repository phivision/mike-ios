//
//  BaseViewController.swift
//  Boyaios
//
//  Created by huasen on 2020/2/27.
//  Copyright © 2020 yind. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if(self.navigationController?.viewControllers.count ?? 0 > 1){
//            setNavLeftBtn(imageName: "backBtn")
            self.navigationItem.backButtonTitle = ""
            self.navigationController?.navigationItem.hidesBackButton = false
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        }else{
            self.navigationController?.navigationItem.hidesBackButton = true
        }
    }
    override func viewDidLayoutSubviews() {
        if #available(iOS 11.0, *) {
          
        }
    }
    
    func setNavLeftBtn(imageName:String){
        let button:UIButton = UIButton(type: .custom)
        button.backgroundColor = UIColor.clear
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect.init(x: 0, y: 0, width: 84, height: 44)
        button.imageEdgeInsets = UIEdgeInsets.init(top: 10, left: 0, bottom: 10, right: 55)
        button.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)
        let negativeSpacer:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -19;
        self.navigationItem.leftBarButtonItems = [negativeSpacer,UIBarButtonItem(customView: button)]
    }
    func setNavRightBtn(imageName:String){
        let button:UIButton = UIButton(type: .custom)
        button.backgroundColor = UIColor.clear
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect.init(x: 0, y: 0, width: 84, height: 44)
        button.imageEdgeInsets = UIEdgeInsets.init(top: 10, left: 55, bottom: 10, right: 0)
        button.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
        let negativeSpacer:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = 19;
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: button),negativeSpacer]
    }
    
    func changeRootController(controller:UIViewController){
        let transtition = CATransition()
        transtition.duration = 0.5
        transtition.timingFunction = CAMediaTimingFunction(name: .easeOut)
        keyWindow?.layer.add(transtition, forKey: "animation")
        keyWindow?.rootViewController = controller;
    }
    
    @objc func leftButtonPressed(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightButtonPressed(){

    }
    
    override var prefersStatusBarHidden: Bool{
          return false
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
