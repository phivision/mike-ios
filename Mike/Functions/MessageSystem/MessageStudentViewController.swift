//
//  MessageStudentViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/24.
//

import UIKit
import PullToRefreshKit

class MessageStudentViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
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
        if self.isRequest == false {
//            fetchSpeakerList()
            self.mainTableView.switchRefreshHeader(to: .refreshing)
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
            self?.fetchUserList()
        }
    }
    
    @objc func refreshData(){
        self.studentList.removeAll()
        self.fetchUserList()
    }
    func fetchUserList(){
        Backend.shared.fetchSubscriptionUserList { userList in
            self.studentList.removeAll()
            self.studentList.append(contentsOf: userList)
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
        Backend.shared.fetchMessageListByToUserId(toUserId: LoginTools.sharedTools.userId(), status:"UNRESPONDED") { msgList in
            self.handleStudents(msgList: msgList)
        } fail: { error in
            
        }
    }
    func handleStudents(msgList:Array<MessageListModel>){
        if msgList.count == 0{
            for trainer in self.studentList {
                UserDefaults.standard.setValue(false, forKey: "\(msgForTrainerUnRead)\(trainer.id ?? "")")
                UserDefaults.standard.synchronize()
            }
        }else{
            for msgModel in msgList{
                let result = UserDefaults.standard.bool(forKey: "\(msgForTrainerUnRead)\(msgModel.fromUserID ?? "")")
                if result == false {
                    UserDefaults.standard.setValue(true, forKey: "\(msgForTrainerUnRead)\(msgModel.fromUserID ?? "")")
                    UserDefaults.standard.synchronize()
                }
            }
        }
//        for msgModel in msgList {
//            var canAdd:Bool = true
//            for student in self.studentList {
//                if msgModel.fromUserID == student.id{
//                    canAdd = false
//                    break
//                }
//            }
//            if canAdd == true {
//                let studentModel = UserCenterTrainer(fromDictionary: [:])
//                studentModel.id = msgModel.fromUserID
//                studentModel.firstName = msgModel.fromUser.firstName
//                studentModel.lastName = msgModel.fromUser.lastName
//                self.studentList.append(studentModel)
//            }
//        }
//        self.saveStudentList()
        if msgList.count != 0 {
            let lastMsg = msgList.last
            UserDefaults.standard.setValue(true, forKey: "\(msgForTrainerUnRead)\(lastMsg?.fromUserID ?? "")")
            UserDefaults.standard.setValue(lastMsg?.postMessages, forKey: "\(lastMsgForTrainer)\(lastMsg?.fromUserID ?? "")")
            UserDefaults.standard.synchronize()
        }
        DispatchQueue.main.async {
            self.mainTableView.switchRefreshHeader(to: .normal(.none, 0.0))
            self.mainTableView.reloadData()
        }
    }
    func handleSubscription(){
        Backend.shared.createSubscription(userId: LoginTools.sharedTools.userId()) { msgModel in
            print("~~~~~~~~~~~~~~~~~~~~~~~~~~im a outer subscription")
            self.fetchMessageList()
            if msgModel.fromUserID != self.curFromUserId{
                UserDefaults.standard.setValue(true, forKey: "\(msgForTrainerUnRead)\(msgModel.fromUserID ?? "")")
                UserDefaults.standard.setValue(msgModel.postMessages, forKey: "\(lastMsgForTrainer)\(msgModel.fromUserID ?? "")")
                UserDefaults.standard.synchronize()
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
            }
        }
    }
//    func configStudentListFromLocal(){
//        let dataFrom = UserDefaults.standard.data(forKey: "\(studentListForTrainer)\(LoginTools.sharedTools.userId())")
//        if dataFrom != nil {
//            do {
//                let savedList = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataFrom!) as? Array<UserCenterTrainer>
//                self.studentList.removeAll()
//                self.studentList.append(contentsOf: savedList ?? [])
//                DispatchQueue.main.async {
//                    self.mainTableView.reloadData()
//                }
//            } catch let error {
//                print("\(error)")
//            }
//        }
//    }
//    func saveStudentList(){
//        do {
//            let data = try NSKeyedArchiver.archivedData(withRootObject: self.studentList, requiringSecureCoding: true)
//            UserDefaults.standard.set(data, forKey: "\(studentListForTrainer)\(LoginTools.sharedTools.userId())")
//            UserDefaults.standard.synchronize()
//        } catch let error {
//            print("\(error)")
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MessageStudentViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.studentList.count == 0 {
            return 1
        }
        return self.studentList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.studentList.count == 0 {
            let cell:MessageEmptyCell = tableView.dequeueReusableCell(withIdentifier: "MessageEmptyCell",for: indexPath) as! MessageEmptyCell
            return cell
        }
        let cell:MessageTrainerListCell = tableView.dequeueReusableCell(withIdentifier: "MessageTrainerListCell", for: indexPath) as! MessageTrainerListCell
        cell.setStudentModel(model: self.studentList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.studentList.count == 0 {
            return
        }
        let model = self.studentList[indexPath.row]
        self.curFromUserId = model.id
        let vc:MessageStudentChatController = MessageStudentChatController()
        vc.toUserId = model.id
        vc.toUserName =  "\(model.firstName ?? "") \(model.lastName ?? "")"
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
