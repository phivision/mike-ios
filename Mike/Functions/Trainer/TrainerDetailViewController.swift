//
//  TrainerDetailViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/11.
//

import UIKit

class TrainerDetailViewController: BaseViewController{
    @IBOutlet weak var mainCollection:UICollectionView!
    var isRequest:Bool = false
    lazy var contentList:Array<UserCenterContent> = {
        var contentList:Array<UserCenterContent> = Array<UserCenterContent>()
        return contentList
    }()
    lazy var favList:Array<UserCenterContent> = {
        var favList:Array<UserCenterContent> = Array<UserCenterContent>()
        return favList
    }()
    var trainerId:String?
    var trainerModel:TrainerDetailModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configCollectionView()
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
        Backend.shared.fetchTrainerDetail(trainerId:self.trainerId ?? "") { model in
            self.trainerModel = model
            if let contentModel = model.contents{
                let list:[UserCenterContent] = contentModel.items
                self.contentList.removeAll()
                for item:UserCenterContent in list{
                    self.contentList.append(item)
                }
            }
            if let favModel = model.favorites{
                let flist:[UserCenterItem] = favModel.items
                self.favList.removeAll()
                for fitem:UserCenterItem in flist{
                    self.favList.append(fitem.content)
                }
            }
            DispatchQueue.main.async {
                self.mainCollection.reloadData()
            }
        } fail: { errormsg in
            
        }
    }
    func configCollectionView(){
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        self.mainCollection.collectionViewLayout = flowLayout
        self.mainCollection.delegate = self
        self.mainCollection.dataSource = self
        self.mainCollection.backgroundColor = UIColor.clear
        self.mainCollection.clipsToBounds = false
        self.mainCollection.register(UINib(nibName: "UserProfileTopCell", bundle: nil), forCellWithReuseIdentifier: "UserProfileTopCell")
        self.mainCollection.register(UINib(nibName: "UserProfileFavHorizonListCell", bundle: nil), forCellWithReuseIdentifier: "UserProfileFavHorizonListCell")
        self.mainCollection.register(UINib(nibName: "TrainerBaseInfoCell", bundle: nil), forCellWithReuseIdentifier: "TrainerBaseInfoCell")
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
extension TrainerDetailViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //MARK: - collectionViewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 0
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            if indexPath.section != 0 && indexPath.section != 1 {
                let header:UserProfileSectionTitleView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UserProfileSectionTitleView", for: indexPath) as! UserProfileSectionTitleView
                switch indexPath.section {
                case 1:
                    header.sectionTitle.text = ""
                case 2:
                    header.sectionTitle.text = "Pinned Workouts"
                case 3:
                    header.sectionTitle.text = "Feed"
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
        if section == 0 || section == 1{
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
            if let model = self.trainerModel {
                cell.setTrainerModel(model: model)
            }
            return cell
        case 1:
            return UICollectionViewCell()
//            let cell:TrainerBaseInfoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainerBaseInfoCell", for: indexPath) as! TrainerBaseInfoCell
//            cell.contentView.backgroundColor = UIColor.white
//            if let model = self.trainerModel {
//                cell.setModel(model: model)
//            }
//            return cell
        case 2:
            let cell:UserProfileFavHorizonListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileFavHorizonListCell", for: indexPath) as! UserProfileFavHorizonListCell
            cell.contentView.backgroundColor = UIColor.white
            cell.setFavList(fList: self.favList)
            cell.delegate = self
            return cell
        case 3:
            let cell:UserProfileFavHorizonListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileFavHorizonListCell", for: indexPath) as! UserProfileFavHorizonListCell
            cell.contentView.backgroundColor = UIColor.white
            cell.setFavList(fList: self.contentList)
            cell.delegate = self
            return cell
//            let cell:UserProfileHealthKitListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileHealthKitListCell", for: indexPath) as! UserProfileHealthKitListCell
//            cell.contentView.backgroundColor = UIColor.white
//            cell.setModel(model: self.metricsList[indexPath.row])
//            return cell
        default:
            return UICollectionViewCell()
        }
    }
    //MARK: - layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        switch indexPath.section {
        case 0:
            if let model = self.trainerModel {
                let titleHeight = heightForView(text: (model.firstName ?? "") + " " + (model.lastName ?? ""), font: UIFont(name: "Nunito-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28), width: kScreenWidth-56)
                let descHeight = heightForView(text: model.descriptionField ?? "", font: UIFont(name: "Nunito-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14), width: kScreenWidth-56)
                return CGSize.init(width: kScreenWidth, height: 309 + descHeight + 40 + titleHeight - 38.5)
            }else{
                return CGSize.init(width: kScreenWidth, height: 309)
            }
            
        case 1:
//            return CGSize.init(width: kScreenWidth, height: 100)
            return CGSize.zero
        case 2:
            return CGSize.init(width: kScreenWidth, height: 260)
        case 3:
            return CGSize.init(width: kScreenWidth, height: 260)
//            return CGSize.init(width: (kScreenWidth-60)/2, height: ((kScreenWidth-60)/2)*210/152)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        switch section {
        case 1:
            return .zero
        case 2:
            return .zero
        case 3:
            return .zero
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
extension TrainerDetailViewController:UserProfileTopCellDelegate{
    func backBtnClicked() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
extension TrainerDetailViewController:UserProfileFavHorizonListCellDelegate{
    func userContentClicked(model: UserCenterContent) {
        let vc:UserContentDetailViewController = UserContentDetailViewController()
        vc.userContentModel = model
        vc.trainerId = model.owner
//        nav.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
}
