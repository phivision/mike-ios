//
//  UserContentDetailViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/9.
//

import UIKit
import Amplify

class UserContentDetailViewController: BaseViewController {
    @IBOutlet weak var trainerAvatar:UIImageView!
    @IBOutlet weak var trainerNameLab:UILabel!
    @IBOutlet weak var descLab:UILabel!
    @IBOutlet weak var contentView:UIView!
    @IBOutlet weak var mainTableView:UITableView!
    @IBOutlet weak var favBtn:UIButton!
    var isFav:Bool = false
    typealias BlackName = ()
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
        self.configData()
        self.configView()
        self.configTableView()
        self.fetchTrainerInfo()
        self.fetchIsFav()
        self.fetchFavRelationIdList()
        // Do any additional setup after loading the view.
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
        self.descLab.text = "\(self.userContentModel.descriptionField ?? "")"
        
        self.trainerAvatar.layer.cornerRadius = 10
        self.trainerAvatar.clipsToBounds = true
        
        if self.segList.count != 0 {
            self.contentView.layer.cornerRadius = 15
            self.contentView.layer.shadowColor = HexRGBAlpha(0xff7088D2,0.2).cgColor
            self.contentView.layer.shadowOffset = CGSize(width: 0, height: 8)
            self.contentView.layer.shadowOpacity = 10
            self.contentView.layer.shadowRadius = 20
        }
    }
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = UIColor.clear
        self.mainTableView.register(UINib(nibName: "UserContentDetailTopTabCell", bundle: nil), forCellReuseIdentifier: "UserContentDetailTopTabCell")
        self.mainTableView.register(UINib(nibName: "UserContentSegmentListCell", bundle:nil), forCellReuseIdentifier: "UserContentSegmentListCell")
        self.mainTableView.register(UINib(nibName: "UserContentSectionTitleView", bundle: nil), forHeaderFooterViewReuseIdentifier: "UserContentSectionTitleView")
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
                    ToastHUD.showMsg(msg: "Delete Favorite Succeeded", controller: self)
                }else if self.favType == 1{
                    ToastHUD.showMsg(msg: "Add Favorite Succeeded", controller: self)
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
            self.favBtn.isSelected = self.isFav
        }
    }
    func fetchTrainerInfo(){
        TrainerBackend.shared.fetchTrainerSimpleInfo(userId: self.trainerId) { trainerModel in
            self.configTrainerUI(trainerModel: trainerModel)
        } fail: { error in
            
        }
    }
    func configTrainerUI(trainerModel:UserCenterModel){
        ImageCacheUtils.sharedTools.imageUrl(key: trainerModel.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                DispatchQueue.main.async {
                    self.trainerAvatar.image = UIImage(named: "logo")
                }
            }else{
                self.trainerAvatar.sd_setImage(with: URL(string: imgUrl ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
        DispatchQueue.main.async {
            self.trainerNameLab.text = "\(trainerModel.firstName ?? "") \(trainerModel.lastName ?? "")"
        }
    }
    @IBAction func favBtnPressed(){
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
extension UserContentDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 26
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView()
        }
        let header:UserContentSectionTitleView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "UserContentSectionTitleView") as! UserContentSectionTitleView
        if self.segList.count == 0 {
            header.titleLab.text = ""
        }else{
            header.titleLab.text = "\(self.segList.count) Movements"
        }
        return header
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return self.segList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:UserContentDetailTopTabCell = tableView.dequeueReusableCell(withIdentifier: "UserContentDetailTopTabCell", for: indexPath) as! UserContentDetailTopTabCell
            cell.setFavModel(favModel: self.userContentModel,segListCount: self.segList.count)
            return cell
        }
        let cell:UserContentSegmentListCell = tableView.dequeueReusableCell(withIdentifier: "UserContentSegmentListCell", for: indexPath) as! UserContentSegmentListCell
        cell.setModel(model: self.segList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if StringUtils.isBlank(value: self.userContentModel.contentName) {
                return
            }
            if self.userContentModel.transcodeReady == true || self.userContentModel.transcodeReady == nil{
                DispatchQueue.main.async {
//                    let vc:VideoViewController = VideoViewController()
//                    vc.videoModel = self.userContentModel
//                    vc.modalPresentationStyle = .fullScreen
//                    self.present(vc, animated: true, completion: nil)
                    let vc:SplitVideoViewController = SplitVideoViewController()
                    vc.videoModel = self.userContentModel
                    let nav = UINavigationController(rootViewController: vc)
                    nav.modalPresentationStyle = .fullScreen
                    self.present(nav, animated: true, completion: nil)
                }
            }else{
                let alertController = UIAlertController(title: "", message: "Waiting for processing",
                                                        preferredStyle: .alert)
                let sureAction = UIAlertAction(title:  "OK", style: .default) { (alertAction) in
                
                }
                alertController.addAction(sureAction)
                DispatchQueue.main.async {
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
