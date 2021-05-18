//
//  UserProfileEditViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/18.
//

import UIKit
import Photos
import Amplify

class UserProfileEditViewController: BaseViewController {
    @IBOutlet weak var saveBtn:UIButton!
    
    @IBOutlet weak var avatarImg:UIImageView!
    
    @IBOutlet weak var firstNameBg:UIImageView!
    @IBOutlet weak var lastNameBg:UIImageView!
    
    @IBOutlet weak var firstNameText:UITextField!
    @IBOutlet weak var lastNameText:UITextField!
    
    var firstName:String = ""
    var lastName:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configView()
    }
    func configView(){
        self.avatarImg.layer.cornerRadius = 20
        self.avatarImg.clipsToBounds = true
        
        self.firstNameText.delegate = self
        self.lastNameText.delegate = self
        
        self.hanldeBgCornerAndShadow(bgView: self.firstNameBg)
        self.hanldeBgCornerAndShadow(bgView: self.lastNameBg)
        
        self.saveBtn.layer.cornerRadius = 20
        self.saveBtn.layer.shadowColor = HexRGBAlpha(0xff000000,0.16).cgColor
        self.saveBtn.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.saveBtn.layer.shadowOpacity = 2
        
        let userModel = LoginTools.sharedTools.userInfo()
        ImageCacheUtils.sharedTools.imageUrl(key: userModel.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatarImg.image = UIImage(named: "logo")
            }else{
                self.avatarImg.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
        self.firstNameText.text = "\(userModel.firstName ?? "")"
        self.lastNameText.text = "\(userModel.lastName ?? "")"
        self.firstName = userModel.firstName
        self.lastName = userModel.lastName
    }
    
    func hanldeBgCornerAndShadow(bgView:UIImageView){
        bgView.clipsToBounds = false
        bgView.layer.cornerRadius = 20
        bgView.layer.shadowColor = HexRGBAlpha(0xff000000,0.16).cgColor
        bgView.layer.shadowOffset = CGSize(width: 2, height: 2)
        bgView.layer.shadowOpacity = 2
    }

    @IBAction func textValueChanged(textfield:UITextField){
        if textfield == self.firstNameText{
            self.firstName = textfield.text ?? ""
        }else if textfield == self.lastNameText{
            self.lastName = textfield.text ?? ""
        }
    }
    @IBAction func selectAvatar(){
        let vc:TZImagePickerController = TZImagePickerController(delegate: self, maxImagesCount: 1, columnNumber: 4, pushPhotoPickerVc: true)
        vc.allowPickingImage = true
        vc.allowTakePicture = true
        vc.allowPickingVideo = false
        vc.pickerDelegate = self
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func back(){
        self.navigationController?.popViewController(animated: true)
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
extension UserProfileEditViewController:TZImagePickerControllerDelegate{
    func imagePickerController(_ picker: TZImagePickerController, didFinishPicking photos: [UIImage], sourceAssets: [PHAsset], isSelectOriginalPhoto: Bool, infos: [Dictionary<String, Any>]?) {
        if photos.count == 0 {
            return
        }
        let data = photos.first!.pngData()!
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        Amplify.Storage.uploadData(
            key: "ExampleKey",
            data: data,
            progressListener: { progress in
                print("Progress: \(progress)")
            }, resultListener: { event in
                switch event {
                case .success(let data):
                    print("Completed: \(data)")
                    DispatchQueue.main.async {
                        hud.hide(animated: true)
                        ToastHUD.showMsg(msg:"Upload Avatar Success", controller: self)
                        self.avatarImg.image = photos.first!
                    }
                case .failure(let storageError):
                    print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                    DispatchQueue.main.async {
                        hud.hide(animated: true)
                        ToastHUD.showMsg(msg:"\(storageError.errorDescription)", controller: self)
                    }
                }
            }
        )
    }
}
extension UserProfileEditViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}

