//
//  HomeViewController.swift
//  MikeIOS
//
//  Created by 殷聃 on 2021/4/25.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet weak var mainCollection:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "mike"
        
        // Do any additional setup after loading the view.
        configNav();
        configCollectionView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
        let rotation : UIInterfaceOrientationMask = [.portrait]
        kAppdelegate?.blockRotation = rotation
    }
    func configNav(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.barTintColor = HexRGBAlpha(0xff5ccacb,1.0)
        self.setNavRightBtn(imageName: "logout")
    }
    func configCollectionView(){
        self.mainCollection.delegate = self
        self.mainCollection.dataSource = self
        self.mainCollection.backgroundColor = HexRGBAlpha(0xfff8f8f8,1.0)
        self.mainCollection.showsVerticalScrollIndicator = false
        self.mainCollection.register(UINib(nibName: "HomeBannerColListCell", bundle: nil), forCellWithReuseIdentifier: "HomeBannerColListCell")
        self.mainCollection.register(UINib(nibName: "HomeTopColCell",bundle:nil), forCellWithReuseIdentifier: "HomeTopColCell")
        self.mainCollection.register(UINib(nibName: "HomeInfoColCell", bundle: nil), forCellWithReuseIdentifier: "HomeInfoColCell")
        self.mainCollection.register(UINib(nibName: "HomeSeeAllCoursesView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeSeeAllCoursesView")
    }
    
    //MARK: - 退出登录
    override func rightButtonPressed() {
        Backend.shared.signOut {
            LoginTools.sharedTools.removeUserInfo()
            DispatchQueue.main.async {
                let loginVC:LoginViewController = LoginViewController()
                let navVC:UINavigationController  = UINavigationController(rootViewController: loginVC)
                navVC.isNavigationBarHidden = true
                self.changeRootController(controller: navVC)
            }
        } fail: {
            
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

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //MARK: - collectionViewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 4
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            switch indexPath.section{
            case 2:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeSeeAllCoursesView", for: indexPath)
                return header;
            default:
                return UICollectionReusableView()
            }
        }else{
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section{
        case 2:
            return CGSize.init(width: kScreenWidth, height: 50)
        default:
            return CGSize.zero
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell:HomeTopColCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeTopColCell", for: indexPath) as! HomeTopColCell
            return cell
        case 1:
            let cell:HomeInfoColCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeInfoColCell", for: indexPath) as! HomeInfoColCell
            return cell
        case 2:
            let cell:HomeBannerColListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerColListCell", for: indexPath) as! HomeBannerColListCell
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    //MARK: - layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        switch indexPath.section {
        case 0:
            return CGSize.init(width: kScreenWidth, height: 140)
        case 1:
            return CGSize.init(width: kScreenWidth, height: (kScreenWidth-20)*9/16+20)
        case 2:
            return CGSize.init(width: (kScreenWidth-30)/2, height: (kScreenWidth-30)/2)
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        switch section {
        case 0:
            return 10
        case 1:
            return 0
        case 2:
            return 10
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        switch section {
        case 0:
            return 10
        case 1:
            return 0
        case 2:
            return 10
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        Backend.shared.fetchUserContent(cotentId: "08268d9d-eff8-47ea-9058-bb5cea829e42") { content in
//
//        } fail: { error in
//
//        }
        let rotation : UIInterfaceOrientationMask = [.landscapeLeft]
                kAppdelegate?.blockRotation = rotation
        let videoVC = VideoViewController()
        videoVC.videoName = "IMG4215b2a4a4004f4f44dabfa88b5030c8da9c.MOV";
        videoVC.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(videoVC, animated: true)
        
    }
}
