//
//  TrainerDetailViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/11.
//
import UIKit
import Amplify

class TrainerDetailViewController: BaseViewController{
    @IBOutlet weak var mainCollection:UICollectionView!
    var curUserId:String?
    var isRequest:Bool = false
    lazy var contentList:Array<UserCenterContent> = {
        var contentList:Array<UserCenterContent> = Array<UserCenterContent>()
        return contentList
    }()
    lazy var favList:Array<UserCenterContent> = {
        var favList:Array<UserCenterContent> = Array<UserCenterContent>()
        return favList
    }()
    var userProfileModel:UserCenterModel?
    var isFeedMode:Bool = true
    var isSubscribed:Bool = false
    var isExpired:Bool = false
    //hide back btn
    var hideBackBtn:Bool = false
    //hud
    var hud:MBProgressHUD?
    //default view
    @IBOutlet weak var addTrainerModelView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.configCollectionView()
        self.configUserId()
        
        NotificationCenter.default.addObserver(self, selector: #selector(fetchFavList), name: NSNotification.Name(rawValue:refreshFavList), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshUserProfile), name: NSNotification.Name(rawValue:refreshProfile), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTrainerId), name: NSNotification.Name(rawValue:refreshTrainerDetail), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        if !StringUtils.isBlank(value: self.curUserId) {
            self.fetchUserProfile()
            self.fetchFeedList()
            self.fetchFavList()
            self.configSubscribeStatus()
            self.addTrainerModelView.isHidden = true
        }else{
            self.addTrainerModelView.isHidden = false
        }
    }
    @objc func refreshTrainerId(){
        self.isFeedMode = true
        self.isSubscribed = false
        self.contentList.removeAll()
        self.favList.removeAll()
        self.userProfileModel = nil
        DispatchQueue.main.async {
            self.mainCollection.reloadData()
        }
        self.curUserId = LoginTools.sharedTools.trainerModel?.id
        self.fetchUserProfile()
        self.fetchFeedList()
        self.fetchFavList()
        self.configSubscribeStatus()
    }
    @objc func refreshUserProfile(){
        self.mainCollection.reloadData()
    }
    @objc func fetchFavList(){
        UserProfileBackend.shared.fetchUserFavList(userId: self.curUserId) { contentList in
            self.favList.removeAll()
            self.favList.append(contentsOf: contentList)
            DispatchQueue.main.async {
                self.mainCollection.reloadData()
            }
        } fail: { error in
            
        }
    }
    func fetchFeedList(){
        TrainerBackend.shared.fetchTrainerContentList(trainerId: self.curUserId) { contentList in
            self.contentList.removeAll()
            self.contentList.append(contentsOf: contentList)
            DispatchQueue.main.async {
                self.mainCollection.reloadData()
            }
        } fail: { error in
            
        }
    }
    func fetchUserProfile(){
        UserProfileBackend.shared.fetchUserProfileModel(userId: self.curUserId) { model in
            self.userProfileModel = model
            DispatchQueue.main.async {
                self.mainCollection.reloadData()
            }
        } fail: { errorMsg in
            
        }
    }
    func configUserId(){
        if StringUtils.isBlank(value: self.curUserId) {
            if LoginTools.sharedTools.trainerModel != nil {
                self.curUserId = LoginTools.sharedTools.trainerModel?.id
            }else{
                self.fetchTrainerList()
            }
        }
    }
    func configSubscribeStatus(){
        UserProfileBackend.shared.fetchSubscriptionTrainerList{ subscriptionList,subIdList in
            for subItem in subscriptionList{
                if subItem.id == self.curUserId {
                    let dateFormatter:DateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    if let date:Date = dateFormatter.date(from: subItem.expireDate ?? ""){
                        if date.timeIntervalSince1970 > Date().timeIntervalSince1970 {
                            self.isExpired = false
                        }else{
                            self.isExpired = true
                        }
                    }
                    self.isSubscribed = true
                    break
                }
            }
            DispatchQueue.main.async {
                self.mainCollection.reloadData()
            }
        } fail: { error in
            
        }
//        HomeBackend.shared.fetchSubscriptionList(userId: LoginTools.sharedTools.userId()) { subscriptionList in
//            for trainer in subscriptionList{
//                if trainer.trainer.id == self.curUserId {
//                    self.isSubscribed = true
//                    DispatchQueue.main.async {
//                        self.mainCollection.reloadData()
//                    }
//                    break
//                }
//            }
//        }
    }
    func fetchTrainerList(){
        HomeBackend.shared.fetchSubscriptionList(userId: LoginTools.sharedTools.userId()) { subscriptionList in
            if subscriptionList.count != 0{
                let trainerModel = subscriptionList.first?.trainer
                LoginTools.sharedTools.trainerModel = UserCenterTrainer(fromDictionary: trainerModel?.toDictionary() ?? [:])
                self.refreshTrainerId()
            }
        }
    }

    func configCollectionView(){
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        self.mainCollection.collectionViewLayout = flowLayout
        self.mainCollection.delegate = self
        self.mainCollection.dataSource = self
        self.mainCollection.backgroundColor = UIColor.white
        self.mainCollection.register(UINib(nibName: "TrainerDetailTopCell", bundle: nil), forCellWithReuseIdentifier: "TrainerDetailTopCell")
        self.mainCollection.register(UINib(nibName: "TrainerSubscribeActionCell", bundle: nil), forCellWithReuseIdentifier: "TrainerSubscribeActionCell")
        self.mainCollection.register(UINib(nibName: "UserProfileModeChangeColCell", bundle: nil), forCellWithReuseIdentifier: "UserProfileModeChangeColCell")
        self.mainCollection.register(UINib(nibName: "FeedOrFavColListCell", bundle: nil), forCellWithReuseIdentifier: "FeedOrFavColListCell")
        self.mainCollection.register(UINib(nibName: "UserProfileSectionTitleView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UserProfileSectionTitleView")
    }
    
    @IBAction func addTraner() {
        self.tabBarController?.selectedIndex = 1
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: changeTabbarCenterIconStatus), object: nil)
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
extension TrainerDetailViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //MARK: - collectionViewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            if indexPath.section == 3 {
                let header:UserProfileSectionTitleView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UserProfileSectionTitleView", for: indexPath) as! UserProfileSectionTitleView
                header.sectionTitle.text = (self.isFeedMode == true ? "Feed" : "Favorites")
                return header;
            }else{
                return UICollectionReusableView()
            }
        }else{
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 3 {
            return CGSize.init(width: kScreenWidth, height: 80)
        }else{
            return CGSize.init(width: 0, height: 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            if LoginTools.sharedTools.userInfo().userRole == "trainer" {
                return 0
            }else{
                return 1
            }
        case 2:
            return 1
        case 3:
            return self.isFeedMode ? self.contentList.count : self.favList.count
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell:TrainerDetailTopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainerDetailTopCell", for: indexPath) as! TrainerDetailTopCell
            cell.delegate = self
            if let model = self.userProfileModel {
                cell.setModel(model: model,hiddenCloseBtn: self.hideBackBtn)
            }else{
                cell.clearValue()
            }
            return cell
        case 1:
            let cell:TrainerSubscribeActionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainerSubscribeActionCell", for: indexPath) as! TrainerSubscribeActionCell
            cell.delegate = self
            if let model = self.userProfileModel {
                cell.setModel(model:model, isSubscribed: self.isSubscribed && (self.isExpired == false))
            }
            return cell
        case 2:
            let cell:UserProfileModeChangeColCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileModeChangeColCell", for: indexPath) as! UserProfileModeChangeColCell
            cell.delegate = self
            cell.setModel(isFeedMode: self.isFeedMode)
            return cell
        case 3:
            let cell:FeedOrFavColListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedOrFavColListCell", for: indexPath) as! FeedOrFavColListCell
            cell.setModel(model: self.isFeedMode == true ? self.contentList[indexPath.row] : self.favList[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    //MARK: - layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        switch indexPath.section {
        case 0:
            if let model = self.userProfileModel {
                let titleHeight = heightForView(text: (model.firstName ?? "") + " " + (model.lastName ?? ""), font: UIFont(name: nAvenirBlack, size: 32) ?? UIFont.systemFont(ofSize: 32), width: kScreenWidth-40)
                let descHeight = heightForView(text: model.descriptionField ?? "", font: UIFont(name: nAvenirMedium, size: 16) ?? UIFont.systemFont(ofSize: 16), width: kScreenWidth-40)
                return CGSize.init(width: kScreenWidth, height: 182 + descHeight + titleHeight + 15)
            }else{
                return CGSize.init(width: kScreenWidth, height: 182)
            }
        case 1:
            return CGSize.init(width: kScreenWidth, height: 85)
        case 2:
            return CGSize.init(width: kScreenWidth, height: 85)
        case 3:
            let itemWidth = (kScreenWidth - 4)/3
            return CGSize.init(width: itemWidth, height: itemWidth)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        switch section {
        case 2:
            return .zero
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            break;
        case 3:
            let vc:UserContentController = UserContentController()
            vc.userContentModel = (self.isFeedMode ? self.contentList[indexPath.row] : self.favList[indexPath.row])
            vc.trainerId = self.curUserId
            let nav:UINavigationController = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            DispatchQueue.main.async {
                self.present(nav, animated: true, completion: nil)
            }
            break;
        default:
            break;
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
}
extension TrainerDetailViewController:TrainerDetailTopCellDelegate{
    func closeBtnPressed() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    func avatarBtnClicked() {
//        let vc:UserProfileEditViewController = UserProfileEditViewController()
//        vc.hidesBottomBarWhenPushed = true
//        DispatchQueue.main.async {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
}
extension TrainerDetailViewController:UserProfileModeChangeColCellDelegate{
    func listModeChanged(isFeedMode: Bool) {
        self.isFeedMode = isFeedMode
        DispatchQueue.main.async {
            self.mainCollection.reloadData()
        }
    }
}
extension TrainerDetailViewController:UserProfileFavHorizonListCellDelegate{
    func userContentClicked(model: UserCenterContent) {
        let vc:UserContentDetailViewController = UserContentDetailViewController()
        vc.userContentModel = model
        vc.trainerId = model.creatorId
//        nav.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
}
extension TrainerDetailViewController:TrainerSubscribeActionCellDelegate{
    func messageMeBtnClicked() {
//        if self.isSubscribed == true {
            let vc:MessageChatForStudentRoleViewController = MessageChatForStudentRoleViewController()
            vc.toUserId = self.curUserId
            vc.toUserName =  "\(self.userProfileModel?.firstName ?? "") \(self.userProfileModel?.lastName ?? "")"
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
    func subscribeBtnClicked() {
        if self.isSubscribed == false {
            self.hud = MBProgressHUD.showAdded(to: keyWindow?.rootViewController?.view ?? UIView(), animated: true)
            MessageBackend.shared.fetchTokenBalance(userId: LoginTools.sharedTools.userId()) { tokenBalanceForCurUser in
                if self.userProfileModel?.SubscriptionPrice ?? 0 <= tokenBalanceForCurUser {
                    DispatchQueue.main.async {
                        self.subscribe()
                    }
                }else{
                    DispatchQueue.main.async {
                        self.hud?.hide(animated: true)
                        ToastHUD.showMsg(msg: "Insufficient tokens. Please recharge your account first.", controller: self)
                    }
                }
            } fail: { error in
                DispatchQueue.main.async {
                    self.hud?.hide(animated: true)
                }
            }
        }
    }
    func subscribe(){
        let jsonData = try! JSONSerialization.data(withJSONObject: ["userID":LoginTools.sharedTools.userId(),"trainerID":self.curUserId ?? ""], options: .prettyPrinted)
        let request = RESTRequest(apiName: "subscriptions",path: "/sub/",body:jsonData)
        Amplify.API.post(request: request) { result in
            switch result {
            case .success(let data):
                let str = String(decoding: data, as: UTF8.self)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: changeUserProfileToNew), object: UserCenterTrainer(fromDictionary: self.userProfileModel?.toDictionary() ?? [:]))
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:refreshTrainerContentList), object: nil)
                DispatchQueue.main.async {
                    self.configSubscribeStatus()
                    self.hud?.hide(animated: true)
                }
                print("Success \(str)")
            case .failure(let apiError):
                print("Failed", apiError)
                DispatchQueue.main.async {
                    self.hud?.hide(animated: true)
                    ToastHUD.showMsg(msg: "Error. Please try again later", controller: keyWindow?.rootViewController ?? UIViewController())
                }
            }
        }
    }
}
