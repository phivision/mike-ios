//
//  MessageListForStudentRoleViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/22.
//

import UIKit
import PullToRefreshKit

class MessageListForStudentRoleViewController: BaseViewController {
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
    lazy var trainerIdList:Array<String> = {
        var trainerIdList:Array<String> = Array<String>()
        return trainerIdList
    }()
    lazy var groupList:Array<UserCenterTrainer> = {
        var groupList:Array<UserCenterTrainer> = Array<UserCenterTrainer>()
        return groupList
    }()
    lazy var unSubTrainerList:Array<UserCenterTrainer> = {
        var unSubTrainerList:Array<UserCenterTrainer> = Array<UserCenterTrainer>()
        return unSubTrainerList
    }()
    lazy var unSubTrainerIdList:Array<String> = {
        var unSubTrainerList:Array<String> = Array<String>()
        return unSubTrainerList
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
//        if self.isRequest == false {
            self.refreshData()
//        }else{
//            self.fetchMessageList()
//        }
    }
    @objc func cancelSub(){
        SubscriptionTools.sharedTools.outterSubscription?.cancel()
        for key in SubscriptionTools.sharedTools.groupSubscription {
            let subscription = SubscriptionTools.sharedTools.groupSubscription["\(key)"]
            subscription?.cancel()
        }
    }
    @objc func restartSub(){
        self.handleSubscription()
        self.handleGroupSubscription()
    }
    
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.register(UINib(nibName: "MessageTrainerListCell", bundle: nil), forCellReuseIdentifier: "MessageTrainerListCell")
        self.mainTableView.register(UINib(nibName: "MessageEmptyCell", bundle: nil), forCellReuseIdentifier: "MessageEmptyCell")
        self.mainTableView.register(UINib(nibName: "MessageGroupListCell", bundle: nil), forCellReuseIdentifier: "MessageGroupListCell")
        self.mainTableView.register(UINib(nibName: "UserContentSectionTitleView", bundle: nil), forHeaderFooterViewReuseIdentifier: "UserContentSectionTitleView")
        self.mainTableView.estimatedRowHeight = 88;
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
        let header = ElasticRefreshHeader()
        self.mainTableView.configRefreshHeader(with: header,container:self){ [weak self] in
            self?.refreshData()
        }
    }
    
    @objc func refreshData(){
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
            self.fetchTrainerList()
        }
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
        UserProfileBackend.shared.fetchSubscriptionTrainerList { trainerList,subIdList in
            self.trainerList.removeAll()
            self.trainerIdList.removeAll()
            self.groupList.removeAll()
    
            self.trainerList.append(contentsOf: trainerList)
            for item in trainerList{
                self.trainerIdList.append(item.id)
            }
            for trainerModel in self.trainerList{
                if !StringUtils.isBlank(value: trainerModel.userMessageGroup?.id) {
                    self.groupList.append(trainerModel)
                }
            }
            self.handleGroupSubscription()
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
        MessageBackend.shared.fetchMessageListByToUserId(toUserId: LoginTools.sharedTools.userId(), status:"UNREAD") { msgList in
            if msgList.count == 0{
                for trainer in self.trainerList {
                    UserDefaults.standard.setValue(false, forKey: "\(message_msgForStudentUnRead)\(trainer.id ?? "")")
                    UserDefaults.standard.synchronize()
                }
            }else{
                for msgModel in msgList{
                    let result = UserDefaults.standard.bool(forKey: "\(message_msgForStudentUnRead)\(msgModel.fromUserID ?? "")")
                    if result == false {
                        UserDefaults.standard.setValue(true, forKey: "\(message_msgForStudentUnRead)\(msgModel.fromUserID ?? "")")
                        UserDefaults.standard.synchronize()
                    }
                }
            }
            for msgModel in msgList {
                UserDefaults.standard.setValue(true, forKey: "\(message_msgForStudentUnRead)\(msgModel.fromUserID ?? "")")
                UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(message_lastMsgForStudent)\(msgModel.fromUserID ?? "")")
                UserDefaults.standard.synchronize()
                
                self.unSubTrainerIdList.removeAll()
                self.unSubTrainerList.removeAll()
                if msgModel.fromUserID != msgModel.toUserID {
                    if !self.trainerIdList.contains(msgModel.fromUserID) {
                        if !self.unSubTrainerIdList.contains(msgModel.fromUserID) {
                            self.unSubTrainerIdList.append(msgModel.fromUserID)
                            var dic = Dictionary<String,Any>()
                            for itemKey in msgModel.fromUser.toDictionary().keys {
                                dic[itemKey] = msgModel.fromUser.toDictionary()[itemKey]
                            }
                            dic["id"] = msgModel.fromUserID
                            self.unSubTrainerList.append(UserCenterTrainer(fromDictionary: dic))
                            UserDefaults.standard.setValue(true, forKey: "\(message_msgForStudentUnRead)\(msgModel.fromUserID ?? "")")
                            UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(message_lastMsgForStudent)\(msgModel.fromUserID ?? "")")
                            UserDefaults.standard.synchronize()
                        }
                    }
                }
            }
            self.fetchUnResponseList()
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        } fail: { error in
            
        }
    }
    func fetchUnResponseList(){
        MessageBackend.shared.fetchMessageListByFromUserId(fromUserId:LoginTools.sharedTools.userId(), status:"UNRESPONDED") { msgList in
            for msgModel in msgList{
                let result = UserDefaults.standard.bool(forKey: "\(message_msgForStudentUnRead)\(msgModel.fromUserID ?? "")")
                if result == false {
                    UserDefaults.standard.setValue(true, forKey: "\(message_msgForStudentUnRead)\(msgModel.fromUserID ?? "")")
                    UserDefaults.standard.synchronize()
                }
                if msgModel.fromUserID != msgModel.toUserID {
                    if !self.trainerIdList.contains(msgModel.toUserID) {
                        if !self.unSubTrainerIdList.contains(msgModel.toUserID) {
                            self.unSubTrainerIdList.append(msgModel.toUserID)
                            var dic = Dictionary<String,Any>()
                            for itemKey in msgModel.toUser.toDictionary().keys {
                                dic[itemKey] = msgModel.toUser.toDictionary()[itemKey]
                            }
                            dic["id"] = msgModel.toUserID
                            self.unSubTrainerList.append(UserCenterTrainer(fromDictionary: dic))
                            UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(message_lastMsgForStudent)\(msgModel.toUserID ?? "")")
                            UserDefaults.standard.synchronize()
                        }
                    }
                }
            }
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        } fail: { error in
            
        }
    }
    func handleSubscription(){
        MessageBackend.shared.createSubscription(userId: LoginTools.sharedTools.userId()) { msgModel in
            print("~~~~~~~~~~~~~~~~~~~~~~~~~~im a outer subscription")
            UserDefaults.standard.setValue(true, forKey: "\(message_msgForStudentUnRead)\(msgModel.fromUserID ?? "")")
            UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(message_lastMsgForStudent)\(msgModel.fromUserID ?? "")")
            UserDefaults.standard.synchronize()
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
    }
    func handleGroupSubscription(){
        for trainerModel in self.groupList {
            MessageBackend.shared.createOutrerGroupSubscription(groupId: trainerModel.userMessageGroup?.id ?? "", trainerId: trainerModel.id ?? "") { msgModel in
                print("~~~~~~~~~~~~~~~~~~~~~~~~~~im a outer subscription")
                if msgModel.fromUserID != LoginTools.sharedTools.userId(){
                    UserDefaults.standard.setValue(true, forKey: "\(message_groupMsg_unread)\(trainerModel.id ?? "")")
                }
                UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(message_lastGroupMsg)\(trainerModel.id ?? "")")
                UserDefaults.standard.synchronize()
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
            }
        }
        
    }
    @IBAction func iconBtnClicked(){
        let vc:ChargeViewController = ChargeViewController()
        vc.tokenBalance = self.tokenBalance.text ?? ""
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
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
extension MessageListForStudentRoleViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 26
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header:UserContentSectionTitleView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "UserContentSectionTitleView") as! UserContentSectionTitleView
        header.titleLab.font = UIFont.init(name: nAvenirBlack, size: 18)
        switch section {
        case 0:
            header.titleLab.text = "Subscriptions"
            break
        case 1:
            header.titleLab.text = "Subscription Groups"
            break
        case 2:
            header.titleLab.text = "Unsubscriptions"
            break
        default:
            break
        }
        return header
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.trainerList.count
        case 1:
            return self.groupList.count
        case 2:
            return self.unSubTrainerList.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell:MessageTrainerListCell = tableView.dequeueReusableCell(withIdentifier: "MessageTrainerListCell", for: indexPath) as! MessageTrainerListCell
            cell.setModelForStudent(model: self.trainerList[indexPath.row])
            return cell
        case 1:
            let cell:MessageGroupListCell = tableView.dequeueReusableCell(withIdentifier: "MessageGroupListCell", for: indexPath) as! MessageGroupListCell
            cell.setGroupModel(model: self.groupList[indexPath.row])
            return cell
        case 2:
            let cell:MessageTrainerListCell = tableView.dequeueReusableCell(withIdentifier: "MessageTrainerListCell", for: indexPath) as! MessageTrainerListCell
            cell.setModelForStudent(model: self.unSubTrainerList[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if self.trainerList.count == 0 {
                return
            }
            let model = self.trainerList[indexPath.row]
            self.curFromUserId = model.id
            let vc:MessageChatForStudentRoleViewController = MessageChatForStudentRoleViewController()
            vc.toUserId = model.id
            vc.toUserName =  "\(model.firstName ?? "") \(model.lastName ?? "")"
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
            let model = self.groupList[indexPath.row]
            let vc:MessageGroupChatRoomViewController = MessageGroupChatRoomViewController()
            vc.groupId = model.userMessageGroup?.id ?? ""
            vc.trainerId = model.id
            vc.trainerName = model.firstName ?? ""
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            if self.unSubTrainerList.count == 0 {
                return
            }
            let model = self.unSubTrainerList[indexPath.row]
            self.curFromUserId = model.id
            let vc:MessageChatForStudentRoleViewController = MessageChatForStudentRoleViewController()
            vc.toUserId = model.id
            vc.toUserName =  "\(model.firstName ?? "") \(model.lastName ?? "")"
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }
}
