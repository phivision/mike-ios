//
//  HomeListViewController.swift
//  Boyaios
//
//  Created by huasen on 2020/3/1.
//  Copyright © 2020 yind. All rights reserved.
//

import UIKit
import PullToRefreshKit
import Amplify
class HomeListViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    lazy var refreshControl:UIRefreshControl = {
        var refreshControl:UIRefreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }()
//    @IBOutlet weak var timeLab:UILabel!
    lazy var subscriptionList:Array<UserSubscriptionTrainerListModel> = {
        var subscriptionList:Array<UserSubscriptionTrainerListModel> = Array<UserSubscriptionTrainerListModel>()
        return subscriptionList
    }()
    var isRequest:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(fetchTrainerList), name: NSNotification.Name(rawValue:refreshHomeList), object: nil)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        if self.isRequest == false {
//            fetchSpeakerList()
            self.mainTableView.switchRefreshHeader(to: .refreshing)
            self.isRequest = true
        }else{
            self.fetchTrainerList()
        }
    }
    
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.register(UINib(nibName: "TrainerHomeTopCell", bundle: nil), forCellReuseIdentifier: "TrainerHomeTopCell")
        self.mainTableView.register(UINib(nibName: "HomeListCell", bundle: nil), forCellReuseIdentifier: "HomeListCell")
        self.mainTableView.register(UINib(nibName: "TrainerListCell", bundle: nil), forCellReuseIdentifier: "TrainerListCell")
        self.mainTableView.estimatedRowHeight = 88;
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
        let header = ElasticRefreshHeader()
        self.mainTableView.configRefreshHeader(with: header,container:self){ [weak self] in
            self?.fetchTrainerList()
        }
    }
    
    @objc func refreshData(){
        self.subscriptionList.removeAll()
        self.fetchTrainerList()
    }
    
    @objc func fetchTrainerList(){
        HomeBackend.shared.fetchSubscriptionList(userId: LoginTools.sharedTools.userId()) { subscriptionList in
            self.subscriptionList.removeAll()
            self.subscriptionList.append(contentsOf: subscriptionList)
            if LoginTools.sharedTools.trainerModel == nil{
                let trainerModel = self.subscriptionList.first?.trainer
                LoginTools.sharedTools.trainerModel = UserCenterTrainer(fromDictionary: trainerModel?.toDictionary() ?? [:])
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:changeTabbarCenterIcon), object: nil)
            }
            DispatchQueue.main.async {
                self.mainTableView.switchRefreshHeader(to: .normal(.none, 0.0))
                self.mainTableView.reloadData()
            }
        }
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
extension HomeListViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 + self.subscriptionList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1{
            return 1
        }else{
            let trainerModel:UserSubscriptionTrainerListModel = self.subscriptionList[section-2]
            return trainerModel.trainer.contents.items.count
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:TrainerHomeTopCell = tableView.dequeueReusableCell(withIdentifier: "TrainerHomeTopCell", for: indexPath) as! TrainerHomeTopCell
            cell.selectionStyle = .none
            cell.titleLab.text = "Hi, \(LoginTools.sharedTools.userInfo().firstName ?? "")"
            return cell
        }else if indexPath.section == 1 {
            let cell:TrainerListCell = tableView.dequeueReusableCell(withIdentifier: "TrainerListCell", for: indexPath) as! TrainerListCell
            cell.setTrainerList(trainerList: self.subscriptionList)
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }else{
            let trainerModel:UserSubscriptionTrainerListModel = self.subscriptionList[indexPath.section-2]
            let contentModel:UserSubscriptionTrainerListItem = trainerModel.trainer.contents.items[indexPath.row]
            let cell:HomeListCell = tableView.dequeueReusableCell(withIdentifier: "HomeListCell", for: indexPath) as! HomeListCell
            cell.setItemModel(model: contentModel,sectionModel: trainerModel.trainer)
            cell.delegate = self
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
        }else if indexPath.section == 1 {
            
        }else{
            let trainerModel:UserSubscriptionTrainerListModel = self.subscriptionList[indexPath.section-2]
            let contentModel:UserSubscriptionTrainerListItem = trainerModel.trainer.contents.items[indexPath.row]
            let vc:UserContentController = UserContentController()
            vc.userContentModel = UserCenterContent(fromDictionary: contentModel.toDictionary())
            vc.trainerId = trainerModel.trainer.id
            let nav:UINavigationController = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            DispatchQueue.main.async {
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
}
extension HomeListViewController:HomeListCellDelegate{
    func homeListAvatarClicked(model: UserSubscriptionTrainerListTrainer) {
        let vc:TrainerDetailViewController = TrainerDetailViewController()
        vc.curUserId = model.id
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension HomeListViewController:TrainerListCellDelegate{
    func addTraner() {
        self.tabBarController?.selectedIndex = 1
    }
    func clickTrainer(model: UserSubscriptionTrainerListModel) {
        let vc:TrainerDetailViewController = TrainerDetailViewController()
        vc.curUserId = model.trainer.id
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
