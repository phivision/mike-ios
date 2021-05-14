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
    typealias BlackName = ()
    var trainerId:String!
    var userContentModel:UserCenterContent!
    var trainerInfoModel:UserCenterModel?
    lazy var segList:Array<UserContentSegmentListModel> = {
        var segList:Array<UserContentSegmentListModel> = Array<UserContentSegmentListModel>()
        return segList
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configView()
        self.configTableView()
        self.configData()
        self.fetchTrainerInfo()
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
        
        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.shadowColor = HexRGBAlpha(0xff7088D2,0.2).cgColor
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 8)
        self.contentView.layer.shadowOpacity = 10
        self.contentView.layer.shadowRadius = 20
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
    func fetchTrainerInfo(){
        Backend.shared.fetchTrainerSimpleInfo(userId: self.trainerId) { trainerModel in
            self.configTrainerUI(trainerModel: trainerModel)
        } fail: { error in
            
        }
    }
    func configTrainerUI(trainerModel:UserCenterModel){
        ImageCacheUtils.sharedTools.imageUrl(key: trainerModel.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.trainerAvatar.image = UIImage(named: "logo")
            }else{
                self.trainerAvatar.sd_setImage(with: URL(string: imgUrl ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
//        if StringUtils.isBlank(value: trainerModel.userImage) {
//            DispatchQueue.main.async {
//                self.trainerAvatar.image = UIImage(named: "logo")
//            }
//        }else{
//            Amplify.Storage.getURL(key: trainerModel.userImage) { event in
//                switch event {
//                case let .success(url):
//                    print("Completed: \(url)")
//                    DispatchQueue.main.async {
//                        self.trainerAvatar.sd_setImage(with: url, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
//                    }
//                case let .failure(storageError):
//                    print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
//                    DispatchQueue.main.async {
//                        self.trainerAvatar.image = UIImage(named: "logo")
//                    }
//                }
//            }
//        }
        DispatchQueue.main.async {
            self.trainerNameLab.text = "\(trainerModel.firstName ?? "") \(trainerModel.lastName ?? "")"
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
        header.titleLab.text = "\(self.segList.count) Movements"
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
            cell.setFavModel(favModel: self.userContentModel)
            return cell
        }
        let cell:UserContentSegmentListCell = tableView.dequeueReusableCell(withIdentifier: "UserContentSegmentListCell", for: indexPath) as! UserContentSegmentListCell
        cell.setModel(model: self.segList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            DispatchQueue.main.async {
                let vc:VideoViewController = VideoViewController()
                vc.videoModel = self.userContentModel
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}
