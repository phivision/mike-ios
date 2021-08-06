//
//  TrainerContentListViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/31.
//

import UIKit
import PullToRefreshKit
import Amplify

class TrainerContentListViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    lazy var refreshControl:UIRefreshControl = {
        var refreshControl:UIRefreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }()
    lazy var contentList:Array<UserCenterContent> = {
        var contentList:Array<UserCenterContent> = Array<UserCenterContent>()
        return contentList
    }()
    var isRequest:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        if LoginTools.sharedTools.userInfo().userRole == "trainer" {
            self.handleSubscription()
            NotificationCenter.default.addObserver(self, selector: #selector(cancelSub), name: NSNotification.Name(rawValue:cancelSubscription), object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(restartSub), name: NSNotification.Name(rawValue:restartSubscription), object: nil)
        }
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(refreshData), name: NSNotification.Name(rawValue:refreshTrainerContentList), object: nil)
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
        self.mainTableView.register(UINib(nibName: "TrainerHomeTopCell", bundle: nil), forCellReuseIdentifier: "TrainerHomeTopCell")
        self.mainTableView.register(UINib(nibName: "TrainerContentListCell", bundle: nil), forCellReuseIdentifier: "TrainerContentListCell")
        self.mainTableView.estimatedRowHeight = 88;
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
        let header = ElasticRefreshHeader()
        self.mainTableView.configRefreshHeader(with: header,container:self){ [weak self] in
            self?.fetchSpeakerList()
        }
    }
    
    @objc func refreshData(){
        self.contentList.removeAll()
        self.fetchSpeakerList()
    }
    
    func fetchSpeakerList(){
        TrainerBackend.shared.fetchTrainerContentList(trainerId: LoginTools.sharedTools.userId()) { contentList in
            self.contentList.removeAll()
            self.contentList.append(contentsOf: contentList)
            DispatchQueue.main.async {
                self.mainTableView.switchRefreshHeader(to: .normal(.none, 0.0))
                self.mainTableView.reloadData()
            }
        } fail: { error in
            
        }
    }
    
    @objc func cancelSub(){
        SubscriptionTools.sharedTools.createContentSubscription?.cancel()
    }
    @objc func restartSub(){
        self.handleSubscription()
    }
    func handleSubscription(){
        TrainerBackend.shared.createNewContentSubscription {
            DispatchQueue.main.async {
                self.fetchSpeakerList()
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
extension TrainerContentListViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return self.contentList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:TrainerHomeTopCell = tableView.dequeueReusableCell(withIdentifier: "TrainerHomeTopCell", for: indexPath) as! TrainerHomeTopCell
            cell.titleLab.text = "Hi, \(LoginTools.sharedTools.userInfo().firstName ?? "")"
            return cell
        }
        let cell:TrainerContentListCell = tableView.dequeueReusableCell(withIdentifier: "TrainerContentListCell", for: indexPath) as! TrainerContentListCell
        cell.setContentModel(model: self.contentList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        }
        let vc:UserContentController = UserContentController()
        vc.userContentModel = self.contentList[indexPath.row]
        vc.trainerId = LoginTools.sharedTools.userId()
        let nav:UINavigationController = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(nav, animated: true, completion: nil)
        }
    }
}
