//
//  UserProfileViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/5.
//

import UIKit
import Amplify
import HealthKit

class UserProfileViewController: BaseViewController {
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
    let healthKitStore:HKHealthStore = HKHealthStore()
    lazy var metricsList:Array<UserMatricsListModel> = {
        var metricsList:Array<UserMatricsListModel> = Array<UserMatricsListModel>()
        return metricsList
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
//            if let userFavorite = model.favorites{
//                let flist:Array<UserCenterItem> = userFavorite.items
//                self.favList.removeAll()
//                for fitem:UserCenterItem in flist{
//                    self.favList.append(fitem.content)
//                }
//            }
            DispatchQueue.main.async {
                self.mainCollection.reloadData()
            }
        } fail: { errorMsg in
            
        }
    }
    func configUserId(){
        if StringUtils.isBlank(value: self.curUserId) {
            self.curUserId = LoginTools.sharedTools.userId()
            self.configMetricsList()
        }
    }
    func configMetricsList(){
        for i in 0..<2 {
            let model:UserMatricsListModel = UserMatricsListModel(fromDictionary: [:])
            switch i {
            case 0:
                model.type = HealthType.calories
                model.title = "CALORIES"
                model.unit = "kcal"
//            case 1:
//                model.type = HealthType.weight
//                model.title = "WEIGHT"
//                model.unit = "lb"
//            case 2:
//                model.type = HealthType.water
//                model.title = "WATER"
//                model.unit = "ml"
            case 1:
                model.type = HealthType.steps
                model.title = "STEPS"
            default:
                model.type = HealthType.calories
                model.title = "CALORIES"
                model.unit = "kcal"
            }
            self.metricsList.append(model)
        }
        HealthKitTools.sharedTools.authorizeHealthKit { success, error in
            if success == true{
                self.getHealthInfo()
            }
        }
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
            return self.metricsList.count
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
                    header.sectionTitle.text = self.metricsList.count > 0 ? "Metrics" : ""
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
            if let model = self.userProfileModel {
                cell.setModel(model: model,isOtherUser: self.curUserId != LoginTools.sharedTools.userId())
            }
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
            cell.delegate = self
            return cell
        case 3:
            let cell:UserProfileHealthKitListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileHealthKitListCell", for: indexPath) as! UserProfileHealthKitListCell
            cell.contentView.backgroundColor = UIColor.white
            cell.setModel(model: self.metricsList[indexPath.row])
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
                    let titleHeight = heightForView(text: (model.firstName ?? "") + " " + (model.lastName ?? ""), font: UIFont(name: "Nunito-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28), width: kScreenWidth-56)
                    let descHeight = heightForView(text: model.descriptionField ?? "", font: UIFont(name: "Nunito-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14), width: kScreenWidth-56)
                    return CGSize.init(width: kScreenWidth, height: 309 + descHeight + 40 + titleHeight - 38.5)
                }else{
                    return CGSize.init(width: kScreenWidth, height: 309)
                }
            }else{
                let titleHeight = heightForView(text: (LoginTools.sharedTools.userInfo().firstName ?? "") + " " + (LoginTools.sharedTools.userInfo().lastName ?? ""), font: UIFont(name: "Nunito-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28), width: kScreenWidth-56)
                let descHeight = heightForView(text: LoginTools.sharedTools.userInfo().descriptionField ?? "", font: UIFont(name: "Nunito-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14), width: kScreenWidth-56)
                return CGSize.init(width: kScreenWidth, height: 309 + descHeight + 40 + titleHeight - 38.5)
            }
            
        case 1:
            return CGSize.init(width: 64, height: 64)
        case 2:
            return CGSize.init(width: kScreenWidth, height: self.favList.count == 0 ? 40 : 260)
        case 3:
            return CGSize.init(width: (kScreenWidth-60)/2, height: ((kScreenWidth-60)/2)*210/152)
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
        case 3:
            return 10
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        switch section {
        case 3:
            return 10
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            break;
        case 1:
            let model:UserCenterTrainer = self.subscriptionList[indexPath.row];
            let vc:TrainerDetailViewController = TrainerDetailViewController()
            vc.trainerId = model.id
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break;
        case 2:
            break;
        case 3:
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
extension UserProfileViewController:UserProfileTopCellDelegate{
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
extension UserProfileViewController{
    func getInfo(){
            let healthKitStore = HKHealthStore()
            do {
                let unwrappedBiologicalSex = try  healthKitStore.biologicalSex()
                switch unwrappedBiologicalSex.biologicalSex {
                case .notSet:
                     print("Gender:Not set")
                    break
                case .female:
                    print("Gender:female")
                    break
                case .male:
                    print("Gender:male")
                    break
                default:
                   print("Gender:other")
                    break
                }
                
                let birthDate = try  healthKitStore.dateOfBirthComponents()
                print("birthday：\(birthDate.year!)-\(birthDate.month!)-\(birthDate.day!)")
            } catch let error {
                print("No permission to fetch the data\(error)")
            }
        }
        func getHealthInfo(){
            HealthKitTools.sharedTools.getCalories { (success, energy, error) in
                print("Here is the energy：\(energy) kcal")
                let model = self.metricsList[0]
                model.contentValue = "\(energy)"
                model.updateTime = TimeFormatUtils.curTimeStr(format: "MM.dd.yy")
                DispatchQueue.main.async {
                    self.mainCollection.reloadData()
                }
            }
//            HealthKitTools.sharedTools.getBodyMass { success, weight, error in
//                print("Here's the weight：\(weight) lb")
//                let model = self.metricsList[1]
//                model.contentValue = String(format: "%.2f", weight)
//                model.updateTime = TimeFormatUtils.curTimeStr(format: "MM.dd.yy")
//                DispatchQueue.main.async {
//                    self.mainCollection.reloadData()
//                }
//            }
//            HealthKitTools.sharedTools.getWater { success, water, error in
//                print("Here's the water：\(water) ml")
//                let model = self.metricsList[2]
//                model.contentValue = "\(water)"
//                model.updateTime = TimeFormatUtils.curTimeStr(format: "MM.dd.yy")
//                DispatchQueue.main.async {
//                    self.mainCollection.reloadData()
//                }
//            }
            HealthKitTools.sharedTools.getStepCount { success, stepCount, error in
                print("Here are the steps for today：\(stepCount) steps")
                let model = self.metricsList[1]
                model.contentValue = "\(stepCount)"
                model.updateTime = TimeFormatUtils.curTimeStr(format: "MM.dd.yy")
                DispatchQueue.main.async {
                    self.mainCollection.reloadData()
                }
            }
        }
}
extension UserProfileViewController:UserProfileFavHorizonListCellDelegate{
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
