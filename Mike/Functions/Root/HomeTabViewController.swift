//
//  HomeTabViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/5.
//

import UIKit

class HomeTabViewController:UITabBarController, UITabBarControllerDelegate{
//    var appSyncClient: AWSAppSyncClient?
//    var subscriptionWatcher: Cancellable?
    lazy var centerBtn:UIButton = {
        var button = UIButton(frame: CGRect(x: 5, y:5, width: tabBar.height-20, height: tabBar.height-20))
        button.clipsToBounds = true
        button.imageView!.contentMode = .scaleAspectFill
        button.setImage(UIImage(named:"icon_user_default"), for: .normal)
        button.layer.cornerRadius = (tabBar.height-20)/2
        button.isUserInteractionEnabled = false
        return button
    }()
    lazy var centerBorderImg:UIImageView = {
        let circleBorderImage = UIImageView(frame: CGRect(x: (kScreenWidth-tabBar.height+10)/2, y:5, width: tabBar.height-10, height: tabBar.height-10))
        circleBorderImage.backgroundColor = UIColor.clear
        circleBorderImage.layer.borderColor = UIColor.clear.cgColor
        circleBorderImage.layer.borderWidth = 2
        circleBorderImage.layer.cornerRadius = (tabBar.height-10)/2
        circleBorderImage.addSubview(self.centerBtn)
        return circleBorderImage
    }()
    var tabSelectIndex:Int = 0
    override func viewDidLoad() {
        addChildControllers()
        super.viewDidLoad()
        commitInitView()
        self.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(updateCenterIcon), name: NSNotification.Name(rawValue: changeTabbarCenterIcon), object: nil)
    }
    
    @objc func updateCenterIcon(){
        ImageCacheUtils.sharedTools.imageUrl(key: LoginTools.sharedTools.trainerModel?.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                DispatchQueue.main.async {
                    self.centerBtn.setImage(UIImage(named: "icon_user_default"), for: .normal)
                }
            }else{
                self.centerBtn.sd_setImage(with: URL(string: imgUrl  ?? "")!, for:.normal,placeholderImage: UIImage(named: "icon_user_default"), options: .refreshCached, completed: nil)
            }
        }
    }
    
    func addChildControllers() {
        if LoginTools.sharedTools.userInfo().userRole == "trainer" {
            self.viewControllers = [
                addChildVC(childVC: TrainerContentListViewController(), title: "", imageNormal: UIImage(named: "icon_home_N"), imageSelect: UIImage(named: "icon_home_H"),showNavBar: false),
                addChildVC(childVC: SearchViewController(), title: "", imageNormal: UIImage(named: "icon_search_N"), imageSelect: UIImage(named: "icon_search_H"),showNavBar: false),
                addChildVC(childVC: ContentUploadViewController(), title: "", imageNormal: UIImage(named: "icon_add_N"), imageSelect: UIImage(named: "icon_add_H"),showNavBar: false),
                addChildVC(childVC: MessageListForTrainerRoleViewController(), title: "", imageNormal: UIImage(named: "icon_chat_N"), imageSelect: UIImage(named: "icon_chat_H"),showNavBar: false),
                addChildVC(childVC: TrainerProfileViewController(), title: "", imageNormal: UIImage(named: "icon_user_N"), imageSelect: UIImage(named: "icon_user_H"),showNavBar: false)
            ];
        }else{
            let vc:TrainerDetailViewController = TrainerDetailViewController()
            vc.hideBackBtn = true
            self.viewControllers = [
                addChildVC(childVC: HomeListViewController(), title: "", imageNormal: UIImage(named: "icon_home_N"), imageSelect: UIImage(named: "icon_home_H"),showNavBar: false),
                addChildVC(childVC: SearchViewController(), title: "", imageNormal: UIImage(named: "icon_search_N"), imageSelect: UIImage(named: "icon_search_H"),showNavBar: false),
                addChildVC(childVC: vc, title: "", imageNormal: UIImage(named: ""), imageSelect: UIImage(named: ""),showNavBar: false),
                addChildVC(childVC: MessageListForStudentRoleViewController(), title: "", imageNormal: UIImage(named: "icon_chat_N"), imageSelect: UIImage(named: "icon_chat_H"),showNavBar: false),
                addChildVC(childVC: UserProfileViewController(), title: "", imageNormal: UIImage(named: "icon_user_N"), imageSelect: UIImage(named: "icon_user_H"),showNavBar: false)
            ];
        }
    }
    
    func addChildVC(childVC:BaseViewController,title:String?,imageNormal:UIImage?,imageSelect:UIImage?,showNavBar:Bool) -> UINavigationController{
        let navVC = UINavigationController(rootViewController: childVC)
        navVC.isNavigationBarHidden = !showNavBar
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = imageNormal?.withRenderingMode(.alwaysOriginal)
        navVC.tabBarItem.selectedImage = imageSelect?.withRenderingMode(.alwaysOriginal)
//        navVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10,weight: .regular), NSAttributedString.Key.foregroundColor :HexRGBAlpha(0x8E9DAE,1)], for: .normal)

        //设置tabBarItem的title的字体颜色和字大小及字体样式
//        navVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10,weight: .medium), NSAttributedString.Key.foregroundColor : customGrayColor], for: .selected)
        return navVC
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if LoginTools.sharedTools.userInfo().userRole == "trainer" {
//            if tabBarController.selectedIndex == 2 {
//                tabBarController.selectedIndex = self.tabSelectIndex
//                let vc:ContentUploadViewController = ContentUploadViewController()
//                let nav:UINavigationController = UINavigationController(rootViewController: vc)
//                nav.modalPresentationStyle = .fullScreen
//                nav.isNavigationBarHidden = true
//                DispatchQueue.main.async {
//                    self.present(nav, animated: true, completion: nil)
//                }
//            }else{
//                self.tabSelectIndex = tabBarController.selectedIndex
//            }
        }else{
            if tabBarController.selectedIndex == 2 {
                self.centerBorderImg.layer.borderColor = orangeColor.cgColor
            }else{
                self.centerBorderImg.layer.borderColor = UIColor.clear.cgColor
            }
            if tabBarController.selectedIndex == 2 && self.tabSelectIndex == 2 {
                let vc = ChangeCurTrainerController()
                vc.delegate = self
                vc.view.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 100)
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true, completion: nil)
            }
            self.tabSelectIndex = tabBarController.selectedIndex
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
extension HomeTabViewController:CurTrainerSelectDelegate{
    func changeCurTrainer(model: UserCenterTrainer) {
        LoginTools.sharedTools.trainerModel = model
        self.updateCenterIcon()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:refreshTrainerDetail), object: nil)
    }
}

extension HomeTabViewController{
    func commitInitView(){
        view.backgroundColor = UIColor.white
        tabBar.isTranslucent = true
        tabBar.barTintColor = .white
        tabBar.backgroundColor = UIColor.white
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = initWithImage(color: HexRGBAlpha(0xffffff,1))
        
//        let bg = UIImageView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: tabBar.height+bottomSafeAreaHeight))
//        bg.layer.cornerRadius = 20
//        bg.backgroundColor = UIColor.white
//        bg.clipsToBounds = false
//        bg.layer.shadowColor = HexRGBAlpha(0xff2D3142,0.1).cgColor
//        bg.layer.shadowOffset = CGSize(width: 0, height: -2)
//        bg.layer.shadowOpacity = 2
//
//        tabBar.insertSubview(bg, at: 0)
        if LoginTools.sharedTools.userInfo().userRole != "trainer" {
            tabBar.addSubview(self.centerBorderImg)
        }
    }
    @objc func logoBtnPressed(){
        self.tabSelectIndex = 2
    }
    func initWithImage(color:UIColor)->UIImage{
            let rect = CGRect(x: 0,y: 0,width: 1,height: 1)
            UIGraphicsBeginImageContext(rect.size)
            let context = UIGraphicsGetCurrentContext()
            context!.setFillColor(color.cgColor)
            context!.fill(rect)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image!
    }
}
