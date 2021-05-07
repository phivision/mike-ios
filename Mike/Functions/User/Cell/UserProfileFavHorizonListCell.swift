//
//  UserProfileFavHorizonListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/7.
//

import UIKit

class UserProfileFavHorizonListCell: UICollectionViewCell {
    @IBOutlet weak var mainCollection:UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.configCollectionView()
    }
    func configCollectionView(){
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.mainCollection.collectionViewLayout = flowLayout
        self.mainCollection.delegate = self
        self.mainCollection.dataSource = self
        self.mainCollection.isPagingEnabled = true
        self.mainCollection.backgroundColor = UIColor.white
        self.mainCollection.register(UINib(nibName: "UserProfileFavoriteListCell", bundle: nil), forCellWithReuseIdentifier: "UserProfileFavoriteListCell")
    }
}
extension UserProfileFavHorizonListCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //MARK: - collectionViewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UserProfileFavoriteListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileFavoriteListCell", for: indexPath) as! UserProfileFavoriteListCell
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
    //MARK: - layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize.init(width: kScreenWidth, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return .zero
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
}
