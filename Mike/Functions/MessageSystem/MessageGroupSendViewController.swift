//
//  MessageGroupSendViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/9.
//
import UIKit
import IQKeyboardManagerSwift
import Amplify

class MessageGroupSendViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    var toUserList:Array<UserCenterTrainer>!
    lazy var msgList:Array<MessageListModel> = {
        var msgList:Array<MessageListModel> = Array<MessageListModel>()
        return msgList
    }()
    //MARK: - comment relation
    @IBOutlet weak var inputAreaBottomMargin:NSLayoutConstraint!
    @IBOutlet weak var commentTextHeight:NSLayoutConstraint!
    @IBOutlet weak var commentText:UITextView!
    @IBOutlet weak var sendBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Send To All"
        self.configTableView()
        self.configMsgList()
        self.configTextView()
        self.setNavLeftBtn(imageName: "back_nearBlack")
        // Do any additional setup after loading the view.
    }
    override func leftButtonPressed() {
        self.navigationController?.popViewController(animated: true)
        SubscriptionTools.sharedTools.innderSubscription?.cancel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
        IQKeyboardManager.shared.enable = false
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAction(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAction(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = true
        IQKeyboardManager.shared.enable = true
        NotificationCenter.default.removeObserver(self,name: NSNotification.Name(rawValue:cancelSubscription),object: nil)
        NotificationCenter.default.removeObserver(self,name: NSNotification.Name(rawValue:restartSubscription),object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardDidShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillHideNotification,object: nil)
    }
    //MARK: - config tableview
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.register(UINib(nibName: "MsgRightCell", bundle: nil), forCellReuseIdentifier: "MsgRightCell")
        self.mainTableView.register(UINib(nibName: "MsgLeftListCell", bundle: nil), forCellReuseIdentifier: "MsgLeftListCell")
        self.mainTableView.estimatedRowHeight = 88;
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
    }
    
    func configTextView(){
        self.commentText.delegate = self;
        self.commentText.layer.cornerRadius = 10;
        self.commentText.clipsToBounds = true;
        self.commentText.placeholder = "Input";
        self.sendBtn.layer.cornerRadius = 6;
        self.sendBtn.clipsToBounds = true;
    }
    //MARK: - init msglist from unarchive
    func configMsgList(){
        let dataFrom = UserDefaults.standard.data(forKey: "\(groupMsgListForTrainer)\(LoginTools.sharedTools.userId())")
        if dataFrom != nil {
            do {
                let savedList = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataFrom!) as? Array<MessageListModel>
                self.msgList.append(contentsOf: savedList ?? [])
                self.mainTableView.reloadData()
            } catch let error {
                print("\(error)")
            }
        }
    }
    //MARK: - msg archive to local
    func saveMsgListToLocale(){
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self.msgList, requiringSecureCoding: true)
            UserDefaults.standard.set(data, forKey: "\(groupMsgListForTrainer)\(LoginTools.sharedTools.userId())")
            UserDefaults.standard.synchronize()
        } catch let error {
            print("\(error)")
        }
    }
    //MARK: - save last msg for chat user
    func saveLastMsg(msg:String){
        UserDefaults.standard.setValue(msg, forKey: "\(lastGroupMsgForTrainer)\(LoginTools.sharedTools.userId())")
    }
    //MARK: - keyboardObserver
    @objc func keyboardAction(sender:Notification){
        let useInfo = sender.userInfo as? Dictionary<String,Any>
        let value:NSValue = useInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        if sender.name == UIResponder.keyboardWillShowNotification {
            self.inputAreaBottomMargin.constant = -value.cgRectValue.size.height+bottomSafeAreaHeight;
        }else{
            self.inputAreaBottomMargin.constant = 0;
        }
    }
    @objc func keyboardDidShow(){
        self.scrollTableViewToBottom(animated: true,duration: 0.3)
    }
    //MARK: - tableView scroll to bottom
    func scrollTableViewToBottom(animated:Bool,duration:Double){
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(Int(duration)*1000), execute: {
           // code to execute
            if self.mainTableView.contentSize.height >= self.mainTableView.height{
                self.mainTableView.scrollToRow(at: IndexPath(row: self.msgList.count-1, section: 0), at: .bottom, animated: true)
            }
        })
    }
    //MARK: - send msg to other
    @IBAction func sendMsgBtnPressed(){
        if StringUtils.isBlank(value: self.commentText.text) {
            ToastHUD.showMsg(msg: "Please Input Message!", controller: self)
            return
        }
        let str:NSMutableString = NSMutableString()
        for i in 0 ..< self.toUserList.count {
            let student = self.toUserList[i]
            str.append(student.id)
            if i < self.toUserList.count - 1 {
                str.append(",")
            }
        }
        let queryParameters = ["userIds":String(format: "%@", str),"message":self.commentText.text ?? "","fromUserId":LoginTools.sharedTools.userId()]
        let request = RESTRequest(apiName: "messageGroupSend" ,path: "/sendUsers", queryParameters: queryParameters)
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Amplify.API.post(request: request){ result in
            switch result {
            case .success(let data):
                let str = String(decoding: data, as: UTF8.self)
                print("Success \(str)")
                DispatchQueue.main.async {
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.handleMsg(postMessage: self.commentText.text ?? "")
                }
                
            case .failure(let apiError):
                print("Failed", apiError)
                DispatchQueue.main.async {
                    MBProgressHUD.hide(for: self.view, animated: true)
                }
            }
        }
    }
    func handleMsg(postMessage:String){
        DispatchQueue.main.async {
            let curDic:[String : Any] = [
                "PostMessages":postMessage,
                "FromUserID":LoginTools.sharedTools.userId(),
                "Status":"UNRESPONDED",
                "ToUserID":"",
                "Type": "TEXT",
                "createdAt": TimeFormatUtils.curTimeStrWithDateFormat(),
                "ToUser": [
                    "LastName":"",
                    "UserImage":"",
                    "FirstName":"",
                ],
                "FromUser": [
                    "LastName": LoginTools.sharedTools.userInfo().lastName ?? "",
                    "UserImage": LoginTools.sharedTools.userInfo().userImage ?? "",
                    "FirstName": LoginTools.sharedTools.userInfo().firstName ?? "",
                ],
            ]
            let curMsgModel:MessageListModel = MessageListModel(fromDictionary:curDic)
            self.msgList.append(curMsgModel)
            self.commentText.text = ""
            self.commentTextHeight.constant = 40
            self.scrollTableViewToBottom(animated: true,duration: 0.3)
            self.mainTableView.reloadData()
        }
        
        for student in self.toUserList {
            DispatchQueue.main.async {
                let dic:[String : Any] = [
                    "PostMessages":postMessage,
                    "FromUserID":LoginTools.sharedTools.userId(),
                    "Status":"UNRESPONDED",
                    "ToUserID":student.id ?? "",
                    "Type": "TEXT",
                    "createdAt": TimeFormatUtils.curTimeStrWithDateFormat(),
                    "ToUser": [
                        "LastName": student.lastName ?? "",
                        "UserImage": student.userImage ?? "",
                        "FirstName": student.firstName ?? "",
                    ],
                    "FromUser": [
                        "LastName": LoginTools.sharedTools.userInfo().lastName ?? "",
                        "UserImage": LoginTools.sharedTools.userInfo().userImage ?? "",
                        "FirstName": LoginTools.sharedTools.userInfo().firstName ?? "",
                    ],
                ]
                let msgModel:MessageListModel = MessageListModel(fromDictionary:dic)
                let dataFrom = UserDefaults.standard.data(forKey: "\(msgListForTrainer)\(student.id ?? "")")
                if dataFrom != nil {
                    do {
                        let savedList = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataFrom!) as? Array<MessageListModel>
                        var msgList:Array<MessageListModel> = Array<MessageListModel>()
                        msgList.append(contentsOf: savedList ?? [])
                        msgList.append(msgModel)
                        let data = try NSKeyedArchiver.archivedData(withRootObject:msgList, requiringSecureCoding: true)
                        UserDefaults.standard.set(data, forKey: "\(msgListForTrainer)\(student.id ?? "")")
                        let lastMsg = msgList.last
                        UserDefaults.standard.setValue(lastMsg?.postMessages, forKey: "\(lastMsgForTrainer)\(lastMsg?.toUserID ?? "")")
                        UserDefaults.standard.synchronize()
                    } catch let error {
                        print("\(error)")
                    }
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
extension MessageGroupSendViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.msgList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let msgModel = self.msgList[indexPath.row]
        if msgModel.fromUserID == LoginTools.sharedTools.userId() {
            let cell:MsgRightCell = tableView.dequeueReusableCell(withIdentifier: "MsgRightCell", for: indexPath) as! MsgRightCell
            cell.setMsgModel(model: self.msgList[indexPath.row])
            return cell
        }else{
            let cell:MsgLeftListCell = tableView.dequeueReusableCell(withIdentifier: "MsgLeftListCell", for: indexPath) as! MsgLeftListCell
            cell.setMsgModel(model: self.msgList[indexPath.row])
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}
extension MessageGroupSendViewController:UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        let width = textView.width
        let newSize = textView.sizeThatFits(CGSize(width: width, height: CGFloat(MAXFLOAT)))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: fmax(width, newSize.width), height: newSize.height)
        self.commentTextHeight.constant = newFrame.size.height
    }
}

