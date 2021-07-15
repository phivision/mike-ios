//
//  UserContentController.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/14.
//

import UIKit

class UserContentController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    var isFav:Bool = false
    var trainerId:String!
    var userContentModel:UserCenterContent!
    var trainerInfoModel:UserCenterModel?
    lazy var segList:Array<UserContentSegmentListModel> = {
        var segList:Array<UserContentSegmentListModel> = Array<UserContentSegmentListModel>()
        return segList
    }()
    // pan gesture
    private var naDelegate: UIGestureRecognizerDelegate?
    var favRelationDic:[String:Any] = [:]
    // fav type
    var favType:Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Post"
        self.configData()
        self.configView()
        self.configTableView()
        self.fetchTrainerInfo()
        self.fetchIsFav()
        self.fetchFavRelationIdList()
        self.setNavLeftBtn(imageName: "icon-back")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font : UIFont.init(name: nAvenirBlack, size: 18)!]
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func leftButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    func configData(){
        let segList:NSArray = JSONUtils.getArrayFromJSONString(jsonString: self.userContentModel.segments ?? "")
        print("\(segList)");
        for segItem in segList {
            if let segDic = segItem as? NSDictionary {
                let model = UserContentSegmentListModel(fromDictionary: segDic as? [String : Any] ?? [:])
                self.segList.append(model)
            }
        }
        self.mainTableView.reloadData()
    }
    func configView(){
//        self.descLab.text = "\(self.userContentModel.descriptionField ?? "")"
//        
//        self.trainerAvatar.layer.cornerRadius = 10
//        self.trainerAvatar.clipsToBounds = true
//        
//        if self.segList.count != 0 {
//            self.contentView.layer.cornerRadius = 15
//            self.contentView.layer.shadowColor = HexRGBAlpha(0xff7088D2,0.2).cgColor
//            self.contentView.layer.shadowOffset = CGSize(width: 0, height: 8)
//            self.contentView.layer.shadowOpacity = 10
//            self.contentView.layer.shadowRadius = 20
//        }
    }
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = UIColor.clear
        self.mainTableView.register(UINib(nibName: "UserContentBigImgCell", bundle:nil), forCellReuseIdentifier: "UserContentBigImgCell")
        self.mainTableView.register(UINib(nibName: "UserContentTrainerInfoCell", bundle: nil), forCellReuseIdentifier: "UserContentTrainerInfoCell")
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
    }
    func fetchFavRelationIdList() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        UserContentBackend.shared.fetchFavIdList { relationDic in
            print("\(relationDic)")
            self.favRelationDic = relationDic
            DispatchQueue.main.async {
                if self.favType == 0{
                    ToastHUD.showMsg(msg: "Delete Favorite Success", controller: self)
                }else if self.favType == 1{
                    ToastHUD.showMsg(msg: "Add Favorite Success", controller: self)
                }
                hud.hide(animated: true)
                self.favType = -1
            }
        } fail: {error in
            DispatchQueue.main.async {
                hud.hide(animated: true)
            }
        }
    }
    func fetchIsFav(){
        UserContentBackend.shared.fetchContentIsFav(contentId: self.userContentModel.id) { suc in
            if(suc == true){
                self.isFav = true
            }else{
                self.isFav = false
            }
            self.handleFavBtnState()
        } fail: { error in
            self.isFav = false
            self.handleFavBtnState()
        }
    }
    func handleFavBtnState(){
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
    func fetchTrainerInfo(){
        TrainerBackend.shared.fetchTrainerSimpleInfo(userId: self.trainerId) { trainerModel in
            self.configTrainerUI(trainerModel: trainerModel)
        } fail: { error in
            
        }
    }
    func configTrainerUI(trainerModel:UserCenterModel){
        self.trainerInfoModel = trainerModel
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
//        ImageCacheUtils.sharedTools.imageUrl(key: trainerModel.userImage) { imgUrl, cannotLoadUrl in
//            if cannotLoadUrl == true{
//                DispatchQueue.main.async {
//                    self.trainerAvatar.image = UIImage(named: "logo")
//                }
//            }else{
//                self.trainerAvatar.sd_setImage(with: URL(string: imgUrl ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
//            }
//        }
//        DispatchQueue.main.async {
//            self.trainerNameLab.text = "\(trainerModel.firstName ?? "") \(trainerModel.lastName ?? "")"
//        }
    }
    @IBAction func dismissBtnClicked(){
        self.dismiss(animated: true, completion: nil)
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
extension UserContentController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return kScreenWidth
        case 1:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell:UserContentBigImgCell = tableView.dequeueReusableCell(withIdentifier: "UserContentBigImgCell", for: indexPath) as! UserContentBigImgCell
            cell.setModel(model: self.userContentModel)
            return cell
        case 1:
            let cell:UserContentTrainerInfoCell = tableView.dequeueReusableCell(withIdentifier: "UserContentTrainerInfoCell", for: indexPath) as! UserContentTrainerInfoCell
            cell.delegate = self
            if let trainerModel = self.trainerInfoModel {
                cell.setModel(model: trainerModel,contentModel: self.userContentModel,isFav: self.isFav)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if StringUtils.isBlank(value: self.userContentModel.contentName) {
                return
            }
            if self.userContentModel.transcodeReady == true || self.userContentModel.transcodeReady == nil{
                let vc:SplitVideoViewController = SplitVideoViewController()
                vc.videoModel = self.userContentModel
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                DispatchQueue.main.async {
                    self.present(nav, animated: true, completion: nil)
                }
            }else{
                let alertController = UIAlertController(title: "", message: "Waiting for processing",
                                                        preferredStyle: .alert)
                let sureAction = UIAlertAction(title:  "Ok", style: .default) { (alertAction) in
                
                }
                alertController.addAction(sureAction)
                DispatchQueue.main.async {
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        default:
           print("")
        }
    }
}
extension UserContentController:UserContentTrainerInfoCellDelegate{
    func favBtnPressed() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        if self.isFav == true {
            let favRelationId:String = self.favRelationDic[self.userContentModel.id ?? ""] as? String ?? ""
            UserContentBackend.shared.delContentToFav(favRelationId: favRelationId) { isSuc in
                DispatchQueue.main.async {
                    hud.hide(animated: true)
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:refreshFavList), object: nil)
                self.fetchIsFav()
                DispatchQueue.main.async {
                    self.favType = 0
                    self.fetchFavRelationIdList()
                }
            } fail: { error in
                DispatchQueue.main.async {
                    hud.hide(animated: true)
                    ToastHUD.showMsg(msg:"\(error)", controller: self)
                }
            }
        }else{
            UserContentBackend.shared.addContentToFav(contentId: self.userContentModel.id) { isSuc in
                DispatchQueue.main.async {
                    hud.hide(animated: true)
                }
                self.fetchIsFav()
                DispatchQueue.main.async {
                    self.favType = 1
                    self.fetchFavRelationIdList()
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:refreshFavList), object: nil)
            } fail: { error in
                DispatchQueue.main.async {
                    hud.hide(animated: true)
                    ToastHUD.showMsg(msg:"\(error)", controller: self)
                }
            }
        }
    }
    func editBtnPressed() {
        
    }
    func delBtnPressed() {
        
    }
}
