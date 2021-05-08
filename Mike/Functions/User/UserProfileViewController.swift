//
//  UserProfileViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/5.
//

import UIKit
import Amplify

class UserProfileViewController: BaseViewController {
    @IBOutlet weak var mainCollection:UICollectionView!
    var isRequest:Bool = false
    lazy var subscriptionList:Array<UserCenterTrainer> = {
        var subscriptionList:Array<UserCenterTrainer> = Array<UserCenterTrainer>()
        return subscriptionList
    }()
    lazy var favList:Array<UserCenterContent> = {
        var favList:Array<UserCenterContent> = Array<UserCenterContent>()
        return favList
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        if self.isRequest == false {
            self.fetchTrainerList()
            self.isRequest = true
        }
    }
    func fetchTrainerList(){
        Backend.shared.fetchUserProfileModel(userId: LoginTools.sharedTools.userId()) { model in
            let list:Array<UserCenterItem> = model.subscriptions.items
            self.subscriptionList.removeAll()
            for item:UserCenterItem in list{
                self.subscriptionList.append(item.trainer)
            }
            let flist:Array<UserCenterItem> = model.favorites.items
            self.favList.removeAll()
            for fitem:UserCenterItem in flist{
                self.favList.append(fitem.content)
            }
            DispatchQueue.main.async {
                self.mainCollection.reloadData()
            }
        } fail: { errorMsg in
            
        }

//        Backend.shared.fetchSubscriptionList(userId: LoginTools.sharedTools.userId()) { subscriptionList in
//            self.subscriptionList.removeAll()
//            self.subscriptionList.append(contentsOf: subscriptionList)
//            DispatchQueue.main.async {
//                self.mainCollection.reloadData()
//            }
//        }
    }
    func configCollectionView(){
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        self.mainCollection.collectionViewLayout = flowLayout
        self.mainCollection.delegate = self
        self.mainCollection.dataSource = self
        self.mainCollection.backgroundColor = UIColor.white
        self.mainCollection.register(UINib(nibName: "UserProfileTopCell", bundle: nil), forCellWithReuseIdentifier: "UserProfileTopCell")
        self.mainCollection.register(UINib(nibName: "UserProfileTrainerListCell", bundle: nil), forCellWithReuseIdentifier: "UserProfileTrainerListCell")
        self.mainCollection.register(UINib(nibName: "UserProfileFavHorizonListCell", bundle: nil), forCellWithReuseIdentifier: "UserProfileFavHorizonListCell")
        self.mainCollection.register(UINib(nibName: "UserProfileHealthKitListCell", bundle: nil), forCellWithReuseIdentifier: "UserProfileHealthKitListCell")
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
extension UserProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //MARK: - collectionViewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return self.subscriptionList.count
        case 2:
            return 1
        case 3:
            return 2
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            if indexPath.section != 0 {
                let header:UserProfileSectionTitleView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UserProfileSectionTitleView", for: indexPath) as! UserProfileSectionTitleView
                switch indexPath.section {
                case 1:
                    header.sectionTitle.text = "My Trainers"
                case 2:
                    header.sectionTitle.text = "Favorite Workouts"
                case 3:
                    header.sectionTitle.text = "Metrics"
                default:
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
            return cell
        case 1:
            let cell:UserProfileTrainerListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileTrainerListCell", for: indexPath) as! UserProfileTrainerListCell
            cell.contentView.backgroundColor = UIColor.white
            cell.setModel(model: self.subscriptionList[indexPath.row])
            return cell
        case 2:
            let cell:UserProfileFavHorizonListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileFavHorizonListCell", for: indexPath) as! UserProfileFavHorizonListCell
            cell.contentView.backgroundColor = UIColor.white
            cell.setFavList(fList: self.favList)
            return cell
        case 3:
            let cell:UserProfileHealthKitListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileHealthKitListCell", for: indexPath) as! UserProfileHealthKitListCell
            cell.contentView.backgroundColor = UIColor.white
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    //MARK: - layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        switch indexPath.section {
        case 0:
            let descHeight = heightForView(text: LoginTools.sharedTools.userInfo().descriptionField ?? "", font: UIFont(name: "Nunito-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14), width: kScreenWidth-56)
            return CGSize.init(width: kScreenWidth, height: 265 + descHeight)
        case 1:
            return CGSize.init(width: 54, height: 54)
        case 2:
            return CGSize.init(width: kScreenWidth, height: 260)
        case 3:
            return CGSize.init(width: 152, height: 210)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        switch section {
        case 1:
            return UIEdgeInsets.init(top: 0, left: 25, bottom: 0, right: 25)
        case 2:
            return .zero
        case 3:
            return UIEdgeInsets.init(top: 0, left: 25, bottom: 0, right: 25)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        switch section {
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        switch section {
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
extension UserProfileViewController:UserProfileTopCellDelegate{
    func settingBtnClicked() {
        let vc:UserProfileSettingViewController = UserProfileSettingViewController()
//        nav.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
}
