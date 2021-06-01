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
    lazy var subscriptionList:Array<UserCenterTrainer> = {
        var subscriptionList:Array<UserCenterTrainer> = Array<UserCenterTrainer>()
        return subscriptionList
    }()
    lazy var favList:Array<UserCenterContent> = {
        var favList:Array<UserCenterContent> = Array<UserCenterContent>()
        return favList
    }()
    var userProfileModel:UserCenterModel?
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
        if self.isRequest == false {
            self.fetchTrainerList()
            self.isRequest = true
        }
        self.fetchFavList();
    }
    @objc func refreshUserProfile(){
        self.mainCollection.reloadData()
    }
    @objc func fetchFavList(){
        Backend.shared.fetchUserFavList(userId: self.curUserId) { contentList in
            self.favList.removeAll()
            self.favList.append(contentsOf: contentList)
            DispatchQueue.main.async {
                self.mainCollection.reloadData()
            }
        } fail: { error in
            
        }
    }
    func fetchTrainerList(){
        Backend.shared.fetchUserProfileModel(userId: self.curUserId) { model in
            self.userProfileModel = model
            let list:Array<UserCenterItem> = model.subscriptions.items
            self.subscriptionList.removeAll()
            for item:UserCenterItem in list{
                self.subscriptionList.append(item.trainer)
            }
            if let userFavorite = model.favorites{
                let flist:Array<UserCenterItem> = userFavorite.items
                self.favList.removeAll()
                for fitem:UserCenterItem in flist{
                    self.favList.append(fitem.content)
                }
            }
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
        self.mainCollection.register(UINib(nibName: "UserProfileFavHorizonListCell", bundle: nil), forCellWithReuseIdentifier: "UserProfileFavHorizonListCell")
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            if indexPath.section != 0 {
                let header:UserProfileSectionTitleView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UserProfileSectionTitleView", for: indexPath) as! UserProfileSectionTitleView
                if indexPath.section == 1{
                    header.sectionTitle.text = "Favorite Workouts"
                }else{
                    header.sectionTitle.text = ""
                }
                return header;
            }else{
                return UICollectionReusableView()
            }
        }else{
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.init(width: 0, height: 0)
        }
        return CGSize.init(width: kScreenWidth, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell:UserProfileTopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileTopCell", for: indexPath) as! UserProfileTopCell
            cell.delegate = self
            if let model = self.userProfileModel {
                cell.setModel(model: model,isOtherUser: self.curUserId != LoginTools.sharedTools.userId())
            }
            return cell
        case 1:
            let cell:UserProfileFavHorizonListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileFavHorizonListCell", for: indexPath) as! UserProfileFavHorizonListCell
            cell.contentView.backgroundColor = UIColor.white
            cell.setFavList(fList: self.favList)
            cell.delegate = self
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    //MARK: - layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        switch indexPath.section {
        case 0:
            if self.curUserId != LoginTools.sharedTools.userId() {
                if let model = self.userProfileModel {
                    let descHeight = heightForView(text: model.descriptionField ?? "", font: UIFont(name: "Nunito-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14), width: kScreenWidth-56)
                    return CGSize.init(width: kScreenWidth, height: 309 + descHeight + 40)
                }else{
                    return CGSize.init(width: kScreenWidth, height: 309)
                }
            }else{
                let descHeight = heightForView(text: LoginTools.sharedTools.userInfo().descriptionField ?? "", font: UIFont(name: "Nunito-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14), width: kScreenWidth-56)
                return CGSize.init(width: kScreenWidth, height: 309 + descHeight + 40)
            }
        case 1:
            return CGSize.init(width: kScreenWidth, height: self.favList.count == 0 ? 40 : 260)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        switch section {
        case 1:
            return .zero
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            break;
        case 1:
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
        let vc:UserProfileSettingViewController = UserProfileSettingViewController()
//        nav.modalPresentationStyle = .fullScreen
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
