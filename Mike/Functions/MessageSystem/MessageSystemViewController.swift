//
//  MessageSystemViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/22.
//

import UIKit
import IQKeyboardManagerSwift

class MessageSystemViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    var toUserId:String?
    var toUserName:String?
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
        self.title = toUserName ?? ""
        self.configTableView()
        Backend.shared.createSubscription(userId: LoginTools.sharedTools.userId()) { msgModel in
            DispatchQueue.main.async {
                self.msgList.append(msgModel)
                self.mainTableView.reloadData()
                self.handleMsgList()
                self.saveLastMsg(msg: msgModel.postMessages)
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
                   // code to execute
                    self.mainTableView.setContentOffset(CGPoint(x: 0, y: self.mainTableView.contentSize.height - self.mainTableView.height), animated: true)
                })
            }
        }
        self.configMsgList()
        self.configTextView()
        self.setNavLeftBtn(imageName: "back_nearBlack")
        // Do any additional setup after loading the view.
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
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardDidShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillHideNotification,object: nil)
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
    
    @IBAction func sendMsgBtnPressed(){
        if StringUtils.isBlank(value: self.commentText.text) {
            ToastHUD.showMsg(msg: "Please Input Message!", controller: self)
            return
        }
        Backend.shared.sendMsgToUser(toUserId: self.toUserId ?? "", msgContent: self.commentText.text) { msgModel in
            DispatchQueue.main.async {
                self.msgList.append(msgModel)
                self.mainTableView.reloadData()
                self.handleMsgList()
                self.saveLastMsg(msg: msgModel.postMessages)
                self.commentText.text = ""
                self.commentTextHeight.constant = 40
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
                   // code to execute
                    self.mainTableView.setContentOffset(CGPoint(x: 0, y: self.mainTableView.contentSize.height - self.mainTableView.height), animated: true)
                })
            }
        } fail: { errorMsg in
            DispatchQueue.main.async {
                ToastHUD.showMsg(msg: errorMsg, controller: self)
            }
        }

    }
    func configMsgList(){
        let dataFrom = UserDefaults.standard.data(forKey: "\(self.toUserId ?? "")")
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
    func configTextView(){
        self.commentText.delegate = self;
        self.commentText.layer.cornerRadius = 10;
        self.commentText.clipsToBounds = true;
        self.commentText.placeholder = "Input";
        self.sendBtn.layer.cornerRadius = 6;
        self.sendBtn.clipsToBounds = true;
    }
    func handleMsgList(){
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self.msgList, requiringSecureCoding: true)
            UserDefaults.standard.set(data, forKey: "\(self.toUserId ?? "")")
            UserDefaults.standard.synchronize()
        } catch let error {
            print("\(error)")
        }
    }
    func saveLastMsg(msg:String){
        UserDefaults.standard.setValue(msg, forKey: "lastMsg_\(self.toUserId ?? "")")
        UserDefaults.standard.synchronize()
    }
    
    @objc func keyboardAction(sender:Notification){
        let useInfo = sender.userInfo as? Dictionary<String,Any>
        let value:NSValue = useInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        if sender.name == UIResponder.keyboardWillShowNotification {
            self.inputAreaBottomMargin.constant = -value.cgRectValue.size.height+34;
        }else{
            self.inputAreaBottomMargin.constant = self.commentTextHeight.constant-34;
        }
    }
    @objc func keyboardDidShow(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
           // code to execute
            self.mainTableView.setContentOffset(CGPoint(x: 0, y: self.mainTableView.contentSize.height - self.mainTableView.height), animated: true)
        })
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
extension MessageSystemViewController:UITableViewDelegate,UITableViewDataSource{
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
extension MessageSystemViewController:UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        let width = textView.width
        let newSize = textView.sizeThatFits(CGSize(width: width, height: CGFloat(MAXFLOAT)))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: fmax(width, newSize.width), height: newSize.height)
        self.commentTextHeight.constant = newFrame.size.height
    }
}
