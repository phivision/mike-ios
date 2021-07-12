//
//  SearchViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/12.
//

import UIKit

class SearchViewController: BaseViewController {
    @IBOutlet weak var searchBg:UIImageView!
    @IBOutlet weak var mainTableView:UITableView!
    lazy var trainerList:Array<UserCenterTrainer> = {
        var trainerList:Array<UserCenterTrainer> = Array<UserCenterTrainer>()
        return trainerList
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configView()
        self.configTableView()
        // Do any additional setup after loading the view.
    }
    func configView(){
        self.searchBg.layer.cornerRadius = 6
        self.searchBg.clipsToBounds = true
    }
    
    func configTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.register(UINib(nibName: "SearchResultListCell", bundle: nil), forCellReuseIdentifier: "SearchResultListCell")
        self.mainTableView.estimatedRowHeight = 88;
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
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
extension SearchViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SearchResultListCell = tableView.dequeueReusableCell(withIdentifier: "SearchResultListCell", for: indexPath) as! SearchResultListCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
