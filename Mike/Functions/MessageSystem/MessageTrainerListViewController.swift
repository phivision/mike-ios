//
//  MessageTrainerListViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/22.
//

import UIKit
import PullToRefreshKit

class MessageTrainerListViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    @IBOutlet weak var tokenBalance:UILabel!
    lazy var refreshControl:UIRefreshControl = {
        var refreshControl:UIRefreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }()
    lazy var trainerList:Array<UserCenterTrainer> = {
        var trainerList:Array<UserCenterTrainer> = Array<UserCenterTrainer>()
        return trainerList
    }()
    var isRequest:Bool = false
    var curFromUserId:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        self.handleSubscription()
        NotificationCenter.default.addObserver(self, selector: #selector(cancelSub), name: NSNotification.Name(rawValue:cancelSubscription), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(restartSub), name: NSNotification.Name(rawValue:restartSubscription), object: nil)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        self.curFromUserId = ""
        self.fetchTokenBalance()
        if self.isRequest == false {
            self.fetchTrainerList()
        }else{
            self.fetchMessageList()
        }
    }
    @objc func cancelSub(){
        SubscriptionTools.sharedTools.outterSubscription?.cancel()
    }
    @objc func restartSub(){
        self.handleSubscription()
    }
    
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.register(UINib(nibName: "MessageTrainerListCell", bundle: nil), forCellReuseIdentifier: "MessageTrainerListCell")
        self.mainTableView.register(UINib(nibName: "MessageEmptyCell", bundle: nil), forCellReuseIdentifier: "MessageEmptyCell")
        self.mainTableView.estimatedRowHeight = 88;
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
        let header = ElasticRefreshHeader()
        self.mainTableView.configRefreshHeader(with: header,container:self){ [weak self] in
            self?.fetchTrainerList()
        }
    }
    
    @objc func refreshData(){
        self.trainerList.removeAll()
        self.fetchTrainerList()
    }
    func fetchTokenBalance(){
        MessageBackend.shared.fetchTokenBalance(userId: LoginTools.sharedTools.userId()) { tokenBalance in
            DispatchQueue.main.async {
                self.tokenBalance.text = "\(tokenBalance)"
            }
        } fail: { error in
            
        }

    }
    func fetchTrainerList(){
        UserProfileBackend.shared.fetchSubscriptionTrainerList { trainerList in
            self.trainerList.removeAll()
            self.trainerList.append(contentsOf: trainerList)
            DispatchQueue.main.async {
                self.mainTableView.switchRefreshHeader(to: .normal(.none, 0.0))
                self.mainTableView.reloadData()
                self.isRequest = true
                self.fetchMessageList()
            }
        } fail: { error in
            
        }
    }
    func fetchMessageList(){
        MessageBackend.shared.fetchMessageListByToUserId(toUserId: LoginTools.sharedTools.userId(), status:"UNRESPONDED") { msgList in
            if msgList.count == 0{
                for trainer in self.trainerList {
                    UserDefaults.standard.setValue(false, forKey: "\(msgForStudentUnRead)\(trainer.id ?? "")")
                    UserDefaults.standard.synchronize()
                }
            }else{
                for msgModel in msgList{
                    let result = UserDefaults.standard.bool(forKey: "\(msgForStudentUnRead)\(msgModel.fromUserID ?? "")")
                    if result == false {
                        UserDefaults.standard.setValue(true, forKey: "\(msgForStudentUnRead)\(msgModel.fromUserID ?? "")")
                        UserDefaults.standard.synchronize()
                    }
                }
            }
            for msgModel in msgList {
                UserDefaults.standard.setValue(true, forKey: "\(msgForTrainerUnRead)\(msgModel.fromUserID ?? "")")
                UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(lastMsgForTrainer)\(msgModel.fromUserID ?? "")")
                UserDefaults.standard.synchronize()
            }
//            if msgList.count != 0 {
//                let lastMsg = msgList.last
//                UserDefaults.standard.setValue(true, forKey: "\(msgForStudentUnRead)\(lastMsg?.fromUserID ?? "")")
//                UserDefaults.standard.setValue(lastMsg?.postMessages, forKey: "\(lastMsgForStudent)\(lastMsg?.fromUserID ?? "")")
//                UserDefaults.standard.synchronize()
//            }
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        } fail: { error in
            
        }
    }
    func handleSubscription(){
        UserDefaults.standard.setValue(Date().timeIntervalSince1970, forKey: lastMsgSendTimeStampForOutter)
        UserDefaults.standard.synchronize()
        MessageBackend.shared.createSubscription(userId: LoginTools.sharedTools.userId()) { msgModel in
            print("~~~~~~~~~~~~~~~~~~~~~~~~~~im a outer subscription")
            UserDefaults.standard.setValue(true, forKey: "\(msgForStudentUnRead)\(msgModel.fromUserID ?? "")")
            UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(lastMsgForStudent)\(msgModel.fromUserID ?? "")")
            UserDefaults.standard.setValue(Date().timeIntervalSince1970, forKey: lastMsgSendTimeStampForOutter)
            UserDefaults.standard.synchronize()
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
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
extension MessageTrainerListViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trainerList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MessageTrainerListCell = tableView.dequeueReusableCell(withIdentifier: "MessageTrainerListCell", for: indexPath) as! MessageTrainerListCell
        cell.setTrainerModel(model: self.trainerList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.trainerList.count == 0 {
            return
        }
        let model = self.trainerList[indexPath.row]
        self.curFromUserId = model.id
        let vc:MessageSystemViewController = MessageSystemViewController()
        vc.toUserId = model.id
        vc.toUserName =  "\(model.firstName ?? "") \(model.lastName ?? "")"
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
