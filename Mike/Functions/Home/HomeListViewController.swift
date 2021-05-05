//
//  HomeListViewController.swift
//  Boyaios
//
//  Created by huasen on 2020/3/1.
//  Copyright © 2020 yind. All rights reserved.
//

import UIKit

class HomeListViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    @IBOutlet weak var userName:UILabel!
    @IBOutlet weak var timeLab:UILabel!
    lazy var subscriptionList:Array<UserSubscriptionTrainerListModel> = {
        var subscriptionList:Array<UserSubscriptionTrainerListModel> = Array<UserSubscriptionTrainerListModel>()
        return subscriptionList
    }()
    var isRequest:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        self.configTopView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        if self.isRequest == false {
            fetchSpeakerList()
            self.isRequest = true
        }
    }
    
    func configTopView(){
        self.userName.text = "Hi,\(LoginTools.sharedTools.userInfo().firstName ?? "")"
        let date = Date()
        let timeFormatter = DateFormatter()
        //日期显示格式，可按自己需求显示
        timeFormatter.dateFormat = "dd MM"
        let strNowTime = timeFormatter.string(from: date) as String
        self.timeLab.text = "\(NSDate().dayOfWeek()) \(strNowTime)"
    }
    
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.register(UINib(nibName: "HomeListCell", bundle: nil), forCellReuseIdentifier: "HomeListCell")
        self.mainTableView.estimatedRowHeight = 88;
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
    }
    
    func fetchSpeakerList(){
        Backend.shared.fetchSubscriptionList(userId: LoginTools.sharedTools.userId()) { subscriptionList in
            self.subscriptionList.removeAll()
            self.subscriptionList.append(contentsOf: subscriptionList)
            DispatchQueue.main.async {
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
        return self.subscriptionList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let trainerModel:UserSubscriptionTrainerListModel = self.subscriptionList[section]
        return trainerModel.trainer.contents.items.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HomeListCell = tableView.dequeueReusableCell(withIdentifier: "HomeListCell", for: indexPath) as! HomeListCell
        let trainerModel:UserSubscriptionTrainerListModel = self.subscriptionList[indexPath.section]
        let contentModel:UserSubscriptionTrainerListItem = trainerModel.trainer.contents.items[indexPath.row]
        cell.setItemModel(model: contentModel,sectionModel: trainerModel.trainer)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
