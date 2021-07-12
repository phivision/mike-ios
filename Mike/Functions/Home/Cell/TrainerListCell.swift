//
//  TrainerListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/12.
//

import UIKit
@objc protocol TrainerListCellDelegate {
    @objc optional func addTraner()
    @objc optional func clickTrainer(model:UserSubscriptionTrainerListModel)
}
class TrainerListCell: UITableViewCell {
    @IBOutlet weak var mainCollection:UICollectionView!
    weak var delegate:TrainerListCellDelegate?
    lazy var subscriptionList:Array<UserSubscriptionTrainerListModel> = {
        var subscriptionList:Array<UserSubscriptionTrainerListModel> = Array<UserSubscriptionTrainerListModel>()
        return subscriptionList
    }()
    func configCollectionView(){
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.mainCollection.collectionViewLayout = flowLayout
        self.mainCollection.delegate = self
        self.mainCollection.dataSource = self
        self.mainCollection.backgroundColor = UIColor.white
        self.mainCollection.register(UINib(nibName: "TrainerColListCell", bundle: nil), forCellWithReuseIdentifier: "TrainerColListCell")
        self.mainCollection.register(UINib(nibName: "TrainerAddColCell", bundle: nil), forCellWithReuseIdentifier: "TrainerAddColCell")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.configCollectionView()
    }
    
    func setTrainerList(trainerList:Array<UserSubscriptionTrainerListModel>){
        self.subscriptionList.removeAll()
        self.subscriptionList.append(contentsOf: trainerList)
        DispatchQueue.main.async {
            self.mainCollection.reloadData()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TrainerListCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //MARK: - collectionViewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.subscriptionList.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < self.subscriptionList.count {
            let cell:TrainerColListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainerColListCell", for: indexPath) as! TrainerColListCell
            cell.setModel(model: self.subscriptionList[indexPath.row])
            return cell
        }else{
            let cell:TrainerAddColCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainerAddColCell", for: indexPath) as! TrainerAddColCell
            return cell
        }
    }
    //MARK: - layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize.init(width: 89, height: 98)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return .zero
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
        if indexPath.row < self.subscriptionList.count {
            self.delegate?.clickTrainer?(model: self.subscriptionList[indexPath.row])
        }else{
            self.delegate?.addTraner?()
        }
    }
}
