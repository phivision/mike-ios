//
//  MessageChatForTrainerRoleViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/24.
//

import UIKit
import IQKeyboardManagerSwift

class MessageChatForTrainerRoleViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    var toUserId:String?
    var toUserName:String?
    lazy var msgList:Array<MessageListModel> = {
        var msgList:Array<MessageListModel> = Array<MessageListModel>()
        return msgList
    }()
    lazy var unResponeMsgList:Array<MessageListModel> = {
        var unResponeMsgList:Array<MessageListModel> = Array<MessageListModel>()
        return unResponeMsgList
    }()
    //MARK: - comment relation
    @IBOutlet weak var inputAreaBottomMargin:NSLayoutConstraint!
    @IBOutlet weak var commentTextHeight:NSLayoutConstraint!
    @IBOutlet weak var commentText:UITextView!
    @IBOutlet weak var commentBg:UIView!
    @IBOutlet weak var sendBtn:UIButton!
    //MARK: - token balance
    var tokenBalance:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = toUserName ?? ""
        self.configTableView()
        self.configSubscription()
        self.configMsgList()
        self.configTextView()
        self.setNavLeftBtn(imageName: "icon-back")
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(cancelSub), name: NSNotification.Name(rawValue:cancelSubscription), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(restartSub), name: NSNotification.Name(rawValue:restartSubscription), object: nil)
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
        self.fetchUnResponedStatusMessageList()
        self.fetchTokenBalance()
    }
    func resetUnReadStatus() {
        UserDefaults.standard.setValue(false, forKey: "\(message_msgForTrainerUnRead)\(self.toUserId ?? "")")
        UserDefaults.standard.synchronize()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = true
        IQKeyboardManager.shared.enable = true
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardDidShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillHideNotification,object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self,name: NSNotification.Name(rawValue:cancelSubscription),object: nil)
        NotificationCenter.default.removeObserver(self,name: NSNotification.Name(rawValue:restartSubscription),object: nil)
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
        self.commentBg.layer.cornerRadius = 10
        self.commentBg.clipsToBounds = true
        self.commentText.delegate = self;
        self.commentText.layer.cornerRadius = 10;
        self.commentText.clipsToBounds = true;
        self.commentText.placeholder = "Message...";
        self.sendBtn.layer.cornerRadius = 6;
        self.sendBtn.clipsToBounds = true;
    }
    //MARK: - init msglist from unarchive
    func configMsgList(){
        let dataFrom = UserDefaults.standard.data(forKey: "\(message_msgListForTrainer)\(self.toUserId ?? "")")
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
            UserDefaults.standard.set(data, forKey: "\(message_msgListForTrainer)\(self.toUserId ?? "")")
            UserDefaults.standard.synchronize()
        } catch let error {
            print("\(error)")
        }
    }
    //MARK: - save last msg for chat user
    func saveLastMsg(msg:String){
        UserDefaults.standard.setValue(msg, forKey: "\(message_lastMsgForTrainer)\(self.toUserId ?? "")")
    }
    //MARK: - unresponed message handle
    func fetchUnResponedStatusMessageList(){
        MessageBackend.shared.fetchMessageListByStatus(toUserId: LoginTools.sharedTools.userId(), fromUserId: self.toUserId, status: "UNRESPONDED") { msgList in
            self.unResponeMsgList.removeAll()
            for msgModel in msgList{
                if msgModel.fromUserID == self.toUserId {
                    self.unResponeMsgList.append(msgModel)
                }
            }
            self.addUnResponeMsgToCurList()
        } fail: { error in
            
        }
    }
    func addUnResponeMsgToCurList(){
        for unResponeMsgModel in self.unResponeMsgList {
            var isContainIn = false
            for msgModel in self.msgList {
                if msgModel.id == unResponeMsgModel.id {
                    isContainIn = true
                    break
                }
            }
            if isContainIn == false {
                self.msgList.append(unResponeMsgModel)
            }
        }
        self.saveMsgListToLocale()
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
            self.scrollTableViewToBottom(animated: true,duration: 0.5)
        }
    }
    //MARK: - token balance
    func fetchTokenBalance(){
        MessageBackend.shared.fetchTokenBalance(userId: LoginTools.sharedTools.userId()) { tokenBalance in
            self.tokenBalance = tokenBalance
            DispatchQueue.main.async {
                self.setNavRightIcon(tokenBalance: self.tokenBalance)
            }
        } fail: { error in
            
        }
    }
    func changeAllUnResponeMsgStatus(){
        for msgModel in self.unResponeMsgList{
            self.updateStatusToResponed(messageModel: msgModel)
        }
        self.resetUnReadStatus()
    }
    func updateStatusToResponed(messageModel:MessageListModel){
        MessageBackend.shared.updateMessageStatus(messageModel:messageModel, status: "RESPONDED") {
            
        } fail: {
            
        }
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
//                self.mainTableView.setContentOffset(CGPoint(x: 0, y: self.mainTableView.contentSize.height - self.mainTableView.height), animated: animated)
            }
        })
    }
    //MARK: - createSubscription
    func configSubscription(){
        MessageBackend.shared.createInnerSubscription(userId: LoginTools.sharedTools.userId()) { msgModel in
            print("~~~~~~~~~~~~~~~~~~~~~~~~~~im a inner subscription")
            DispatchQueue.main.async {
                self.msgList.append(msgModel)
                self.mainTableView.reloadData()
                self.saveMsgListToLocale()
                self.saveLastMsg(msg: msgModel.postMessages)
                self.scrollTableViewToBottom(animated: true,duration: 0.3)
                self.fetchTokenBalance()
            }
        }
    }
    @objc func cancelSub(){
        SubscriptionTools.sharedTools.innderSubscription?.cancel()
    }
    @objc func restartSub(){
        self.configSubscription()
    }
    //MARK: - send msg to other
    @IBAction func sendMsgBtnPressed(){
        if StringUtils.isBlank(value: self.commentText.text) {
            ToastHUD.showMsg(msg: "Please Input Message!", controller: self)
            return
        }
        MessageBackend.shared.sendMsgToUser(toUserId: self.toUserId ?? "", msgContent: self.commentText.text) { msgModel in
            self.changeAllUnResponeMsgStatus()
            DispatchQueue.main.async {
                self.msgList.append(msgModel)
                self.mainTableView.reloadData()
                self.saveMsgListToLocale()
                self.saveLastMsg(msg: msgModel.postMessages)
                self.commentText.text = ""
                self.commentTextHeight.constant = 40
                self.scrollTableViewToBottom(animated: true,duration: 0.3)
            }
        } fail: { errorMsg in
            DispatchQueue.main.async {
                ToastHUD.showMsg(msg: errorMsg, controller: self)
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
extension MessageChatForTrainerRoleViewController:UITableViewDelegate,UITableViewDataSource{
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
extension MessageChatForTrainerRoleViewController:UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        let width = textView.width
        let newSize = textView.sizeThatFits(CGSize(width: width, height: CGFloat(MAXFLOAT)))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: fmax(width, newSize.width), height: newSize.height)
        self.commentTextHeight.constant = newFrame.size.height
    }
}

