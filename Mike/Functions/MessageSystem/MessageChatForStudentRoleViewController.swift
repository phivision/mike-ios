//
//  MessageChatForStudentRoleViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/22.
//

import UIKit
import IQKeyboardManagerSwift

class MessageChatForStudentRoleViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    var toUserId:String?
    var toUserName:String?
    lazy var msgList:Array<MessageListModel> = {
        var msgList:Array<MessageListModel> = Array<MessageListModel>()
        return msgList
    }()
    //MARK: - comment relation
    @IBOutlet weak var commentBg:UIView!
    @IBOutlet weak var inputAreaBottomMargin:NSLayoutConstraint!
    @IBOutlet weak var commentTextHeight:NSLayoutConstraint!
    @IBOutlet weak var commentText:UITextView!
    @IBOutlet weak var sendBtn:UIButton!
    @IBOutlet weak var sendBtnWidth:NSLayoutConstraint!
    //MARK: - token balance
    var tokenBalance:Int = 0
    //MARK: - token price
    var trainerTokenPrice:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavLeftBtn(imageName: "icon-back")
        self.title = toUserName ?? ""
        self.configSubscription()
        self.configTableView()
        self.configMsgList()
        self.configTextView()
        NotificationCenter.default.addObserver(self, selector: #selector(cancelSub), name: NSNotification.Name(rawValue:cancelSubscription), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(restartSub), name: NSNotification.Name(rawValue:restartSubscription), object: nil)
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
        self.resetUnReadStatus()
        self.fetchUnReadStatusMessageList()
        self.fetchTokenPrice()
        self.fetchTokenBalance()
    }
    func resetUnReadStatus(){
        UserDefaults.standard.setValue(false, forKey: "\(message_msgForStudentUnRead)\(self.toUserId ?? "")")
        UserDefaults.standard.synchronize()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = true
        IQKeyboardManager.shared.enable = true
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardDidShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillHideNotification,object: nil)
//        SubscriptionTools.sharedTools.innderSubscription?.cancel()
    }
    func configSubscription(){
        MessageBackend.shared.createInnerSubscription(userId: LoginTools.sharedTools.userId()) { msgModel in
            print("~~~~~~~~~~~~~~~~~~~~~~~~~~im a inner subscription")
            DispatchQueue.main.async {
                self.msgList.append(msgModel)
                self.mainTableView.reloadData()
                self.handleMsgList()
                self.saveLastMsg(msg: msgModel.postMessages)
                self.scrollTableViewToBottom(animated: true)
            }
        }
    }
    @objc func cancelSub(){
        SubscriptionTools.sharedTools.innderSubscription?.cancel()
    }
    @objc func restartSub(){
        self.configSubscription()
    }
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
    //MARK: - token price
    func fetchTokenPrice(){
        MessageBackend.shared.fetchTokenPrice(trainerId: self.toUserId) { tokenPrice in
            self.trainerTokenPrice = tokenPrice
            DispatchQueue.main.async {
                self.sendBtn.setTitle("Send for \(self.trainerTokenPrice)", for: .normal)
                self.sendBtnWidth.constant = CGFloat("Send for \(self.trainerTokenPrice)".count * 9)
            }
        } fail: { error in
            
        }
    }
    //MARK: - msg config
    func configMsgList(){
        let dataFrom = UserDefaults.standard.data(forKey: "\(message_msgListForStudent)\(self.toUserId ?? "")")
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
    //save
    func handleMsgList(){
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self.msgList, requiringSecureCoding: true)
            UserDefaults.standard.set(data, forKey: "\(message_msgListForStudent)\(self.toUserId ?? "")")
            UserDefaults.standard.synchronize()
        } catch let error {
            print("\(error)")
        }
    }
    func saveLastMsg(msg:String){
        UserDefaults.standard.setValue(msg, forKey: "\(message_lastMsgForStudent)\(self.toUserId ?? "")")
    }
    //MARK: - unresponed message handle
    func fetchUnReadStatusMessageList(){
        MessageBackend.shared.fetchMessageListByStatus(toUserId: LoginTools.sharedTools.userId(), fromUserId: self.toUserId, status: "UNREAD") { msgList in
            for msgModel in msgList{
                self.updateStatusToResponed(messageModel: msgModel)
            }
            self.handleMsgList()
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
                self.scrollTableViewToBottom(animated: false)
            }
        } fail: { error in
            
        }
    }
    func updateStatusToResponed(messageModel:MessageListModel){
        var isContainIn = false
        for msgModel in self.msgList {
            if msgModel.id == messageModel.id {
                isContainIn = true
                break
            }
        }
        if isContainIn == false {
            self.msgList.append(messageModel)
        }
        MessageBackend.shared.updateMessageStatus(messageModel:messageModel, status: "RESPONDED") {
            
        } fail: {
            
        }
    }
    //MARK: - keyboard
    @objc func keyboardAction(sender:Notification){
        let useInfo = sender.userInfo as? Dictionary<String,Any>
        let value:NSValue = useInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        if sender.name == UIResponder.keyboardWillShowNotification {
            self.inputAreaBottomMargin.constant = -value.cgRectValue.size.height+bottomSafeAreaHeight;
        }else{
            self.inputAreaBottomMargin.constant = self.commentTextHeight.constant-bottomSafeAreaHeight;
        }
    }
    @objc func keyboardDidShow(){
        self.scrollTableViewToBottom(animated: true)
    }
    // MARK: - scroll to bottom offset
    func scrollTableViewToBottom(animated:Bool){
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
           // code to execute
            if self.mainTableView.contentSize.height >= self.mainTableView.height{
                self.mainTableView.scrollToRow(at: IndexPath(row: self.msgList.count-1, section: 0), at: .bottom, animated: animated)
//                self.mainTableView.setContentOffset(CGPoint(x: 0, y: self.mainTableView.contentSize.height - self.mainTableView.height), animated: animated)
            }
        })
    }
    // MARK: - send msg to trainer
    @IBAction func sendMsgBtnPressed(){
        if self.tokenBalance < self.trainerTokenPrice {
            ToastHUD.showMsg(msg: "Insufficient tokens. Please recharge your account first.", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.commentText.text) {
            ToastHUD.showMsg(msg: "Please enter a message", controller: self)
            return
        }
        MessageBackend.shared.sendMsgToTrainer(trainerId: self.toUserId ?? "", msgContent: self.commentText.text) { msgModel in
            DispatchQueue.main.async {
                self.msgList.append(msgModel)
                self.mainTableView.reloadData()
                self.handleMsgList()
                self.saveLastMsg(msg: msgModel.postMessages)
                self.commentText.text = ""
                self.commentTextHeight.constant = 40
                self.tokenBalance = self.tokenBalance - self.trainerTokenPrice
                self.scrollTableViewToBottom(animated: true)
                self.fetchTokenBalance()
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
extension MessageChatForStudentRoleViewController:UITableViewDelegate,UITableViewDataSource{
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
extension MessageChatForStudentRoleViewController:UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        let width = textView.width
        let newSize = textView.sizeThatFits(CGSize(width: width, height: CGFloat(MAXFLOAT)))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: fmax(width, newSize.width), height: newSize.height)
        self.commentTextHeight.constant = newFrame.size.height
    }
}
