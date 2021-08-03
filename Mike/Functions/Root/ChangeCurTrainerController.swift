//
//  ChangeCurTrainerController.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/16.
//

import UIKit
@objc protocol CurTrainerSelectDelegate{
    @objc func changeCurTrainer(model:UserCenterTrainer)
}
class ChangeCurTrainerController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    @IBOutlet weak var tableHeight:NSLayoutConstraint!
    @IBOutlet weak var panArea:UIView!
    @IBOutlet weak var panLine:UIImageView!
    weak var delegate:CurTrainerSelectDelegate?
    var tmpSubscriptionList:Array<UserCenterTrainer>?
    lazy var subscriptionList:Array<UserCenterTrainer> = {
        var subscriptionList:Array<UserCenterTrainer> = Array<UserCenterTrainer>()
        return subscriptionList
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        self.view.backgroundColor = UIColor.clear
        self.configView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
//    func fetchTrainerList(){
//        UserProfileBackend.shared.fetchSubscriptionTrainerList{ subscriptionList,subIdList in
//            if subscriptionList.count > 1 {
//                self.subscriptionList.removeAll()
//                self.subscriptionList.append(contentsOf: subscriptionList)
//                DispatchQueue.main.async {
//                    self.mainTableView.switchRefreshHeader(to: .normal(.none, 0.0))
//                    self.mainTableView.reloadData()
//                    if CGFloat(55 * self.subscriptionList.count) > kScreenHeight - 44 - 34{
//                        self.tableHeight.constant = kScreenHeight - 44 - 34
//                    }else{
//                        self.tableHeight.constant = CGFloat(75 * self.subscriptionList.count)
//                    }
//                }
//            }
//        } fail: { error in
//            
//        }
//    }
    func configView(){
        let corners:UIRectCorner  = UIRectCorner(rawValue: UIRectCorner.topLeft.rawValue | UIRectCorner.topRight.rawValue)
        self.panArea.addCorner(conrners: corners, radius: 20)
        self.panArea.clipsToBounds = false
        self.panArea.layer.shadowColor = UIColor.init(0, 0, 0, 1).cgColor
        self.panArea.layer.shadowOpacity = 20
        self.panArea.layer.shadowOffset = CGSize(width: 0, height: -4)
        self.panLine.layer.cornerRadius = 2.5
        self.subscriptionList.append(contentsOf: self.tmpSubscriptionList ?? [])
        if CGFloat(55 * self.subscriptionList.count) > kScreenHeight - 44 - 34{
            self.tableHeight.constant = kScreenHeight - 44 - 34
        }else{
            self.tableHeight.constant = CGFloat(75 * self.subscriptionList.count)
        }
    }
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.estimatedRowHeight = 88;
        self.mainTableView.separatorStyle = .none
        self.mainTableView.register(UINib(nibName: "TrainerTabListCell", bundle: nil), forCellReuseIdentifier: "TrainerTabListCell")
        self.mainTableView.tableFooterView = UIView()
    }
    @IBAction func dismiss(){
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
extension ChangeCurTrainerController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.subscriptionList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TrainerTabListCell = tableView.dequeueReusableCell(withIdentifier: "TrainerTabListCell", for: indexPath) as! TrainerTabListCell
        cell.setModel(model: self.subscriptionList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.changeCurTrainer(model: self.subscriptionList[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
}
