//
//  HomeTabViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/5.
//

import UIKit

class HomeTabViewController:UITabBarController{

    override func viewDidLoad() {
        addChildControllers()
        super.viewDidLoad()
        commitInitView()
        // Do any additional setup after loading the view.
    }
    
    func addChildControllers() {
        self.viewControllers = [
            addChildVC(childVC: HomeListViewController(), title: "", imageNormal: UIImage(named: "icon_home_N"), imageSelect: UIImage(named: "icon_home_H")),
            addChildVC(childVC: UserProfileViewController(), title: "", imageNormal: UIImage(named: "icon_user_N"), imageSelect: UIImage(named: "icon_user_H"))
        ];
    }
    
    func addChildVC(childVC:BaseViewController,title:String?,imageNormal:UIImage?,imageSelect:UIImage?) -> UINavigationController{
        let navVC = UINavigationController(rootViewController: childVC)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = imageNormal
        navVC.tabBarItem.selectedImage = imageSelect?.withRenderingMode(.alwaysOriginal)
        navVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10,weight: .regular), NSAttributedString.Key.foregroundColor :HexRGBAlpha(0x8E9DAE,1)], for: .normal)

        //设置tabBarItem的title的字体颜色和字大小及字体样式
        navVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10,weight: .medium), NSAttributedString.Key.foregroundColor : customGrayColor], for: .selected)
        return navVC
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
        tabBar.backgroundImage = initWithImage(color: HexRGBAlpha(0xf8f8f8,1))
        
        let bg = UIImageView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: tabBar.height+34))
        bg.layer.cornerRadius = 20
        bg.backgroundColor = UIColor.white
        bg.clipsToBounds = false
        bg.layer.shadowColor = HexRGBAlpha(0xff2D3142,0.1).cgColor
        bg.layer.shadowOffset = CGSize(width: 0, height: -2)
        bg.layer.shadowOpacity = 2
        
        tabBar.insertSubview(bg, at: 0)
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
