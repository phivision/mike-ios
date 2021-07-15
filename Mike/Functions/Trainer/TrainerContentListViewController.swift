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
    @IBOutlet weak var userName:UILabel!
    lazy var contentList:Array<UserCenterContent> = {
        var contentList:Array<UserCenterContent> = Array<UserCenterContent>()
        return contentList
    }()
    var isRequest:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        self.configTopView()
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
    
    func configTopView(){
        self.userName.text = "Hi, \(LoginTools.sharedTools.userInfo().firstName ?? "")"
//        let date = Date()
//        let timeFormatter = DateFormatter()
//        //日期显示格式，可按自己需求显示
//        timeFormatter.dateFormat = "EEEE MMM dd"
//        let strNowTime = timeFormatter.string(from: date) as String
//        self.timeLab.text = "\(strNowTime)"
    }
    
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
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
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TrainerContentListCell = tableView.dequeueReusableCell(withIdentifier: "TrainerContentListCell", for: indexPath) as! TrainerContentListCell
        cell.setContentModel(model: self.contentList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
