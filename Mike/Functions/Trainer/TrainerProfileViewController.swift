//
//  TrainerProfileViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/27.
//

import UIKit
import Amplify

class TrainerProfileViewController: BaseViewController{
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configUserId()
        self.configCollectionView()
        NotificationCenter.default.addObserver(self, selector: #selector(fetchFavList), name: NSNotification.Name(rawValue:refreshFavList), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshUserProfile), name: NSNotification.Name(rawValue:refreshProfile), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        self.fetchUserProfile()
        self.fetchFeedList()
        self.fetchFavList();
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
            self.curUserId = LoginTools.sharedTools.userId()
        }
    }

    func configCollectionView(){
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        self.mainCollection.collectionViewLayout = flowLayout
        self.mainCollection.delegate = self
        self.mainCollection.dataSource = self
        self.mainCollection.backgroundColor = UIColor.white
        self.mainCollection.register(UINib(nibName: "UserProfileTopCell", bundle: nil), forCellWithReuseIdentifier: "UserProfileTopCell")
        self.mainCollection.register(UINib(nibName: "UserProfileModeChangeColCell", bundle: nil), forCellWithReuseIdentifier: "UserProfileModeChangeColCell")
        self.mainCollection.register(UINib(nibName: "FeedOrFavColListCell", bundle: nil), forCellWithReuseIdentifier: "FeedOrFavColListCell")
        self.mainCollection.register(UINib(nibName: "UserProfileSectionTitleView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UserProfileSectionTitleView")
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
extension TrainerProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //MARK: - collectionViewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            if indexPath.section == 2 {
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
        if section == 2 {
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
            return 1
        case 2:
            return self.isFeedMode ? self.contentList.count : self.favList.count
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell:UserProfileTopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileTopCell", for: indexPath) as! UserProfileTopCell
            cell.delegate = self
            if let model = self.userProfileModel {
                cell.setTrainerModel(model: model)
//                cell.setModel(model: model,isOtherUser: self.curUserId != LoginTools.sharedTools.userId())
            }
            return cell
        case 1:
            let cell:UserProfileModeChangeColCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileModeChangeColCell", for: indexPath) as! UserProfileModeChangeColCell
            cell.delegate = self
            cell.setModel(isFeedMode: self.isFeedMode)
            return cell
        case 2:
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
        case 2:
            let vc:UserContentController = UserContentController()
            vc.userContentModel = (self.isFeedMode ? self.contentList[indexPath.row] : self.favList[indexPath.row])
            vc.trainerId = LoginTools.sharedTools.userId()
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
extension TrainerProfileViewController:UserProfileTopCellDelegate{
    func settingBtnClicked() {
        let vc:TrainerSettingViewController = TrainerSettingViewController()
        vc.isTrainer = true
        vc.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
    func editBtnPressed() {
        let vc:UserProfileEditViewController = UserProfileEditViewController()
        vc.isTrainer = true
        vc.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
    func backBtnClicked() {
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
extension TrainerProfileViewController:UserProfileModeChangeColCellDelegate{
    func listModeChanged(isFeedMode: Bool) {
        self.isFeedMode = isFeedMode
        DispatchQueue.main.async {
            self.mainCollection.reloadData()
        }
    }
}
extension TrainerProfileViewController:UserProfileFavHorizonListCellDelegate{
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
