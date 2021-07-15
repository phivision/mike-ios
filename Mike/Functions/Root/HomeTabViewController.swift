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
        button.contentMode = .scaleAspectFill
        button.setImage(UIImage(named:"logo"), for: .normal)
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
        // Do any additional setup after loading the view.
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appSyncClient = appDelegate.appSyncClient
//        //In your app code
//        do {
//          subscriptionWatcher = try appSyncClient?.subscribe(subscription: .subscriptionMsg(byUserId: "1222c9f6-a14d-456a-8798-24c06ec9d80a"), resultHandler: { (result, transaction, error) in
//            if let result = result {
//              print(result.data!.onCreateTodo!.name + " " + result.data!.onCreateTodo!.description!)
//            } else if let error = error {
//              print(error.localizedDescription)
//            }
//          })
//        } catch {
//          print("Error starting subscription.")
//        }
//        Backend.shared.createContentCreateSubscription(creatorId: "2c486065-5e75-44c0-a189-3a88be7056ab")
//        Backend.shared.createContentUpdateSubscription(creatorId: "9badcade-6771-441d-b8e6-b1f2b6e14d52")
    }
    
    func addChildControllers() {
        if LoginTools.sharedTools.userInfo().userRole == "trainer" {
            self.viewControllers = [
                addChildVC(childVC: TrainerContentListViewController(), title: "", imageNormal: UIImage(named: "icon_home_N"), imageSelect: UIImage(named: "icon_home_H"),showNavBar: false),
                addChildVC(childVC: SearchViewController(), title: "", imageNormal: UIImage(named: "icon_search_N"), imageSelect: UIImage(named: "icon_search_H"),showNavBar: false),
                addChildVC(childVC: ContentUploadViewController(), title: "", imageNormal: UIImage(named: "icon_add_N"), imageSelect: UIImage(named: "icon_add_H"),showNavBar: false),
                addChildVC(childVC: MessageStudentViewController(), title: "", imageNormal: UIImage(named: "icon_chat_N"), imageSelect: UIImage(named: "icon_chat_H"),showNavBar: false),
                addChildVC(childVC: TrainerProfileViewController(), title: "", imageNormal: UIImage(named: "icon_user_N"), imageSelect: UIImage(named: "icon_user_H"),showNavBar: false)
            ];
        }else{
            self.viewControllers = [
                addChildVC(childVC: HomeListViewController(), title: "", imageNormal: UIImage(named: "icon_home_N"), imageSelect: UIImage(named: "icon_home_H"),showNavBar: false),
                addChildVC(childVC: SearchViewController(), title: "", imageNormal: UIImage(named: "icon_search_N"), imageSelect: UIImage(named: "icon_search_H"),showNavBar: false),
                addChildVC(childVC: ContentUploadViewController(), title: "", imageNormal: UIImage(named: ""), imageSelect: UIImage(named: ""),showNavBar: false),
                addChildVC(childVC: MessageTrainerListViewController(), title: "", imageNormal: UIImage(named: "icon_chat_N"), imageSelect: UIImage(named: "icon_chat_H"),showNavBar: false),
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
