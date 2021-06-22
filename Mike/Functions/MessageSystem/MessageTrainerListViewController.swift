//
//  MessageTrainerListViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/22.
//

import UIKit
import PullToRefreshKit

class MessageTrainerListViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    lazy var refreshControl:UIRefreshControl = {
        var refreshControl:UIRefreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }()
    lazy var trainerList:Array<UserCenterTrainer> = {
        var trainerList:Array<UserCenterTrainer> = Array<UserCenterTrainer>()
        return trainerList
    }()
    var isRequest:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        if self.isRequest == false {
//            fetchSpeakerList()
            self.mainTableView.switchRefreshHeader(to: .refreshing)
            self.isRequest = true
        }
    }
    
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.register(UINib(nibName: "MessageTrainerListCell", bundle: nil), forCellReuseIdentifier: "MessageTrainerListCell")
        self.mainTableView.estimatedRowHeight = 88;
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
        let header = ElasticRefreshHeader()
        self.mainTableView.configRefreshHeader(with: header,container:self){ [weak self] in
            self?.fetchSpeakerList()
        }
    }
    
    @objc func refreshData(){
        self.trainerList.removeAll()
        self.fetchSpeakerList()
    }
    
    func fetchSpeakerList(){
        Backend.shared.fetchSubscriptionTrainerList { trainerList in
            self.trainerList.removeAll()
            self.trainerList.append(contentsOf: trainerList)
            DispatchQueue.main.async {
                self.mainTableView.switchRefreshHeader(to: .normal(.none, 0.0))
                self.mainTableView.reloadData()
            }
        } fail: { error in
            
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
extension MessageTrainerListViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trainerList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MessageTrainerListCell = tableView.dequeueReusableCell(withIdentifier: "MessageTrainerListCell", for: indexPath) as! MessageTrainerListCell
        cell.setTrainerModel(model: self.trainerList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc:MessageSystemViewController = MessageSystemViewController()
        let model = self.trainerList[indexPath.row]
        vc.toUserId = model.id
        vc.toUserName =  "\(model.firstName ?? "") \(model.lastName ?? "")"
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
