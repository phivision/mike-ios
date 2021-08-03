//
//  MessageListForTrainerRoleViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/24.
//

import UIKit
import PullToRefreshKit

class MessageListForTrainerRoleViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    @IBOutlet weak var tokenBalance:UILabel!
    lazy var refreshControl:UIRefreshControl = {
        var refreshControl:UIRefreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }()
    lazy var studentList:Array<UserCenterTrainer> = {
        var studentList:Array<UserCenterTrainer> = Array<UserCenterTrainer>()
        return studentList
    }()
    lazy var studentIdList:Array<String> = {
        var studentIdList:Array<String> = Array<String>()
        return studentIdList
    }()
    lazy var unSubUserList:Array<UserCenterTrainer> = {
        var unSubUserList:Array<UserCenterTrainer> = Array<UserCenterTrainer>()
        return unSubUserList
    }()
    lazy var unSubUserIdList:Array<String> = {
        var unSubUserIdList:Array<String> = Array<String>()
        return unSubUserIdList
    }()
    var isRequest:Bool = false
    var curFromUserId:String = ""
    var userProfileModel:UserCenterModel?
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
//        if self.isRequest == false {
////            fetchSpeakerList()
//            self.mainTableView.switchRefreshHeader(to: .refreshing)
//        }else{
//            self.fetchMessageList()
//        }
        self.refreshData()
        self.fetchUserProfile()
        self.fetchTokenBalance()
    }
    
    @objc func cancelSub(){
        SubscriptionTools.sharedTools.outterSubscription?.cancel()
        let subscription = SubscriptionTools.sharedTools.groupSubscription["\(LoginTools.sharedTools.userId())"]
        subscription?.cancel()
    }
    @objc func restartSub(){
        self.handleSubscription()
        self.handleGroupSubscription()
    }
    
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.register(UINib(nibName: "MessageGroupListCell", bundle: nil), forCellReuseIdentifier: "MessageGroupListCell")
        self.mainTableView.register(UINib(nibName: "MessageTrainerListCell", bundle: nil), forCellReuseIdentifier: "MessageTrainerListCell")
        self.mainTableView.register(UINib(nibName: "MessageEmptyCell", bundle: nil), forCellReuseIdentifier: "MessageEmptyCell")
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
        self.fetchUserList()
    }
    func fetchUserProfile(){
        UserProfileBackend.shared.fetchUserProfileModel(userId:LoginTools.sharedTools.userId()) { model in
            self.userProfileModel = model
            self.handleGroupSubscription()
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        } fail: { errorMsg in
            
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
    func fetchUserList(){
        UserProfileBackend.shared.fetchSubscriptionUserList { userList in
            self.studentList.removeAll()
            self.studentIdList.removeAll()
            self.studentList.append(contentsOf: userList)
            for item in userList{
                self.studentIdList.append(item.id)
            }
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
//                for trainer in self.studentList {
//                    UserDefaults.standard.setValue(false, forKey: "\(message_msgForTrainerUnRead)\(trainer.id ?? "")")
//                    UserDefaults.standard.synchronize()
//                }
            }else{
                for msgModel in msgList{
                    let result = UserDefaults.standard.bool(forKey: "\(message_msgForTrainerUnRead)\(msgModel.fromUserID ?? "")")
                    if result == false {
                        UserDefaults.standard.setValue(true, forKey: "\(message_msgForTrainerUnRead)\(msgModel.fromUserID ?? "")")
                        UserDefaults.standard.synchronize()
                    }
                }
            }
            for msgModel in msgList {
                UserDefaults.standard.setValue(true, forKey: "\(message_msgForTrainerUnRead)\(msgModel.fromUserID ?? "")")
                UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(message_lastMsgForTrainer)\(msgModel.fromUserID ?? "")")
                UserDefaults.standard.synchronize()
                
                self.unSubUserList.removeAll()
                self.unSubUserIdList.removeAll()
                //filter unsub user
                self.handleUnSubUserMsgModel(msgModel: msgModel)
            }
            DispatchQueue.main.async {
                self.mainTableView.switchRefreshHeader(to: .normal(.none, 0.0))
                self.mainTableView.reloadData()
            }
        } fail: { error in
            
        }
    }
    func handleSubscription(){
        MessageBackend.shared.createSubscription(userId: LoginTools.sharedTools.userId()) { msgModel in
            print("~~~~~~~~~~~~~~~~~~~~~~~~~~im a outer subscription")
            if msgModel.fromUserID != self.curFromUserId{
                UserDefaults.standard.setValue(true, forKey: "\(message_msgForTrainerUnRead)\(msgModel.fromUserID ?? "")")
                UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(message_lastMsgForTrainer)\(msgModel.fromUserID ?? "")")
                UserDefaults.standard.synchronize()
                DispatchQueue.main.async {
                    self.handleUnSubUserMsgModel(msgModel: msgModel)
                    self.mainTableView.reloadData()
                }
            }
        }
    }
    func handleGroupSubscription(){
        MessageBackend.shared.createOutrerGroupSubscription(groupId: self.userProfileModel?.userMessageGroup?.id ?? "", trainerId: self.userProfileModel?.id ?? "") { msgModel in
            print("~~~~~~~~~~~~~~~~~~~~~~~~~~im a outer subscription")
            UserDefaults.standard.setValue(true, forKey: "\(message_groupMsg_unread)\(self.userProfileModel?.id ?? "")")
            UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(message_lastGroupMsg)\(self.userProfileModel?.id ?? "")")
            UserDefaults.standard.synchronize()
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
    }
    func handleUnSubUserMsgModel(msgModel:MessageListModel){
        if msgModel.fromUserID != msgModel.toUserID {
            if !self.studentIdList.contains(msgModel.fromUserID) {
                if !self.unSubUserIdList.contains(msgModel.fromUserID) {
                    self.unSubUserIdList.append(msgModel.fromUserID)
                    var dic = Dictionary<String,Any>()
                    for itemKey in msgModel.fromUser.toDictionary().keys {
                        dic[itemKey] = msgModel.fromUser.toDictionary()[itemKey]
                    }
                    dic["id"] = msgModel.fromUserID
                    self.unSubUserList.append(UserCenterTrainer(fromDictionary: dic))
                    UserDefaults.standard.setValue(true, forKey: "\(message_msgForTrainerUnRead)\(msgModel.fromUserID ?? "")")
                    UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(message_lastMsgForTrainer)\(msgModel.fromUserID ?? "")")
                    UserDefaults.standard.synchronize()
                }
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
extension MessageListForTrainerRoleViewController:UITableViewDelegate,UITableViewDataSource{
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
            header.titleLab.text = "Subscription Group"
            break
        case 1:
            header.titleLab.text = "Subscriptions"
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
            if !StringUtils.isBlank(value: self.userProfileModel?.userMessageGroup?.id) {
                return 1
            }else{
                return 0
            }
        case 1:
            return self.studentList.count
        case 2:
            return self.unSubUserList.count
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
            let cell:MessageGroupListCell = tableView.dequeueReusableCell(withIdentifier: "MessageGroupListCell", for: indexPath) as! MessageGroupListCell
            cell.setGroupModelforTrainer(model: self.userProfileModel!)
            return cell
        case 1:
            let cell:MessageTrainerListCell = tableView.dequeueReusableCell(withIdentifier: "MessageTrainerListCell", for: indexPath) as! MessageTrainerListCell
            cell.setModelForTrainer(model: self.studentList[indexPath.row])
            return cell
        case 2:
            let cell:MessageTrainerListCell = tableView.dequeueReusableCell(withIdentifier: "MessageTrainerListCell", for: indexPath) as! MessageTrainerListCell
            cell.setModelForTrainer(model: self.unSubUserList[indexPath.row])
            return cell
        default:
             return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let vc:MessageGroupChatRoomViewController = MessageGroupChatRoomViewController()
            vc.groupId = self.userProfileModel?.userMessageGroup?.id ?? ""
            vc.trainerId = LoginTools.sharedTools.userId()
            vc.trainerName = LoginTools.sharedTools.userInfo().firstName ?? ""
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            if self.studentList.count == 0 {
                return
            }
            let model = self.studentList[indexPath.row]
            self.curFromUserId = model.id
            let vc:MessageChatForTrainerRoleViewController = MessageChatForTrainerRoleViewController()
            vc.toUserId = model.id
            vc.toUserName =  "\(model.firstName ?? "") \(model.lastName ?? "")"
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            if self.unSubUserList.count == 0 {
                return
            }
            let model = self.unSubUserList[indexPath.row]
            self.curFromUserId = model.id
            let vc:MessageChatForTrainerRoleViewController = MessageChatForTrainerRoleViewController()
            vc.toUserId = model.id
            vc.toUserName =  "\(model.firstName ?? "") \(model.lastName ?? "")"
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("default")
        }
        
    }
}
