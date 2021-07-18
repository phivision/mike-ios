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
    var groupId:String!
    var trainerId:String!
    var trainerName:String!
    lazy var msgList:Array<MessageListModel> = {
        var msgList:Array<MessageListModel> = Array<MessageListModel>()
        return msgList
    }()
    //MARK: - comment relation
    @IBOutlet weak var inputAreaBottomMargin:NSLayoutConstraint!
    @IBOutlet weak var commentTextHeight:NSLayoutConstraint!
    @IBOutlet weak var commentText:UITextView!
    @IBOutlet weak var commentBg:UIView!
    @IBOutlet weak var sendBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Group: \(self.trainerName ?? "")"
        self.configTableView()
        self.configSubscription()
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
        fetchMessageList()
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
        self.commentBg.layer.cornerRadius = 10
        self.commentText.delegate = self;
        self.commentText.layer.cornerRadius = 10;
        self.commentText.clipsToBounds = true;
        self.commentText.placeholder = "Input";
        self.sendBtn.layer.cornerRadius = 6;
        self.sendBtn.clipsToBounds = true;
    }
    //MARK: - unresponed message handle
    func fetchMessageList(){
        MessageBackend.shared.fetchGroupMessageListByTrainerId(trainerId: self.trainerId) { msgList in
            self.msgList.removeAll()
            self.msgList.append(contentsOf: msgList)
            if self.msgList.count > 0{
                self.saveLastMsg(msg: self.msgList.last?.postMessages ?? "")
            }
            self.resetMsgStatus()
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
                self.scrollTableViewToBottom(animated: true,duration: 0.3)
            }
        } fail: { error in
            
        }
    }
    func resetMsgStatus(){
        UserDefaults.standard.setValue(false, forKey: "\(message_groupMsg_unread)\(self.trainerId ?? "")")
        UserDefaults.standard.synchronize()
    }
    //MARK: - save last msg for chat user
    func saveLastMsg(msg:String){
        UserDefaults.standard.setValue(msg, forKey: "\(message_lastGroupMsg)\(self.trainerId ?? "")")
        UserDefaults.standard.synchronize()
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
        MessageBackend.shared.sendMsgToGroup(groupId: self.groupId, msgContent: self.commentText.text) { msgModel in
            DispatchQueue.main.async {
                self.msgList.append(msgModel)
                self.mainTableView.reloadData()
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
    @objc func cancelSub(){
        SubscriptionTools.sharedTools.innderSubscription?.cancel()
    }
    @objc func restartSub(){
        self.configSubscription()
    }
    //MARK: - createSubscription
    func configSubscription(){
        MessageBackend.shared.createGroupSubscription(groupId: self.groupId) { msgModel in
            print("~~~~~~~~~~~~~~~~~~~~~~~~~~im a inner subscription")
            if msgModel.fromUserID != LoginTools.sharedTools.userId() {
                DispatchQueue.main.async {
                    self.msgList.append(msgModel)
                    self.mainTableView.reloadData()
                    self.saveLastMsg(msg: msgModel.postMessages)
                    self.scrollTableViewToBottom(animated: true,duration: 0.3)
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

