//
//  TrainerSettingViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/14.
//

import UIKit
class TrainerSettingViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    @IBOutlet weak var saveBtn:UIButton!
    var isTrainer:Bool!
    lazy var subscriptionList:Array<UserCenterTrainer> = {
        var subscriptionList:Array<UserCenterTrainer> = Array<UserCenterTrainer>()
        return subscriptionList
    }()
    lazy var subscriptionIdList:Array<String> = {
        var subscriptionIdList:Array<String> = Array<String>()
        return subscriptionIdList
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        if self.isTrainer == false {
            self.fetchTrainerList()
        }
    }
    @IBAction func backBtnPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    func configTableView(){
        self.saveBtn.layer.cornerRadius = 18.5
        self.saveBtn.clipsToBounds = true
        
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.register(UINib(nibName: "UserSettingTrainerListCell", bundle: nil), forCellReuseIdentifier: "UserSettingTrainerListCell")
        self.mainTableView.register(UINib(nibName: "UserSettingNotificationCell", bundle: nil), forCellReuseIdentifier: "UserSettingNotificationCell")
        self.mainTableView.register(UINib(nibName: "UserSettingTextBtnCell", bundle: nil), forCellReuseIdentifier: "UserSettingTextBtnCell")
        self.mainTableView.register(UINib(nibName: "UserSettingSubscribeCell", bundle: nil), forCellReuseIdentifier: "UserSettingSubscribeCell")
        self.mainTableView.register(UINib(nibName: "UserSettingTitleHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "UserSettingTitleHeaderView")
        self.mainTableView.estimatedRowHeight = 88;
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
    }
    func fetchTrainerList(){
        UserProfileBackend.shared.fetchSubscriptionTrainerList{ subscriptionList,subIdList in
            self.subscriptionList.removeAll()
            self.subscriptionIdList.removeAll()
            self.subscriptionList.append(contentsOf: subscriptionList)
            self.subscriptionIdList.append(contentsOf: subIdList)
            DispatchQueue.main.async {
                self.mainTableView.switchRefreshHeader(to: .normal(.none, 0.0))
                self.mainTableView.reloadData()
            }
        } fail: { error in
            
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
extension TrainerSettingViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            if self.isTrainer == true {
                return 1
            }else{
                return self.subscriptionList.count
            }
        case 1:
            return 1
        case 2:
            return 2
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header:UserSettingTitleHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "UserSettingTitleHeaderView") as! UserSettingTitleHeaderView
        switch section {
        case 0:
            if self.isTrainer == true {
                header.textLab.text = "Pricing"
            }else{
                header.textLab.text = "Active Subscriptions"
            }
        case 1:
            header.textLab.text = "Notifications"
        case 2:
            header.textLab.text = "Account"
        default:
            header.textLab.text = ""
        }
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 71
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if self.isTrainer == true {
                let cell:UserSettingSubscribeCell = tableView.dequeueReusableCell(withIdentifier: "UserSettingSubscribeCell", for: indexPath) as! UserSettingSubscribeCell
                return cell
            }else{
                let cell:UserSettingTrainerListCell = tableView.dequeueReusableCell(withIdentifier: "UserSettingTrainerListCell", for: indexPath) as! UserSettingTrainerListCell
                cell.setModel(model: self.subscriptionList[indexPath.row],index: indexPath)
                cell.delegate = self
                return cell
            }
        case 1:
            let cell:UserSettingNotificationCell = tableView.dequeueReusableCell(withIdentifier: "UserSettingNotificationCell", for: indexPath) as! UserSettingNotificationCell
            return cell
        case 2:
            let cell:UserSettingTextBtnCell = tableView.dequeueReusableCell(withIdentifier: "UserSettingTextBtnCell", for: indexPath) as! UserSettingTextBtnCell
            if indexPath.row == 0 {
                cell.textBtn.setTitle("Change Password", for: .normal)
                cell.textBtn.setTitleColor(UIColor.black, for: .normal)
                cell.textBtn.addTarget(self, action: #selector(changePwd), for: .touchUpInside)
            }else{
                cell.textBtn.setTitle("Log Out", for: .normal)
                cell.textBtn.setTitleColor(orangeColor, for: .normal)
                cell.textBtn.addTarget(self, action: #selector(signOut), for: .touchUpInside)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            break
        case 2:
            if indexPath.row == 0 {
                let vc = FogotPwdViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                self.signOut()
            }
            break
        default:
            break
        }
    }
    @objc func changePwd(){
        let vc = FogotPwdViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func signOut(){
        LoginBackend.shared.signOut {
            Backend.shared.resetDeviceToken()
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
}
extension TrainerSettingViewController:UserSettingTrainerListCellDelegate{
    func delSubscriptionTrainer(index: IndexPath) {
        let trainer = self.subscriptionList[index.row];
        let alertController = UIAlertController(title: "", message: "Are you sure you want to unsubscribe \(trainer.firstName ?? "") \(trainer.lastName ?? "")?",
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:  "CANCEL", style: .cancel) { (alertAction) in
            
        }
        let sureAction = UIAlertAction(title:  "OK", style: .default) { (alertAction) in
            self.delSub(index: index.row)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(sureAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    func delSub(index:NSInteger){
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        let subId = self.subscriptionIdList[index];
        UserProfileBackend.shared.delSubscriptionTrainer(subscriptionId: subId) { suc in
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:"Delete Success!", controller: self)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:refreshHomeList), object: nil)
                self.fetchTrainerList()
            }
        } fail: { error in
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg:"\(error)", controller: self)
            }
        }
    }
}

