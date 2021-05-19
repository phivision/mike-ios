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
    @IBOutlet weak var descBg:UIImageView!
    
    @IBOutlet weak var firstNameText:UITextField!
    @IBOutlet weak var lastNameText:UITextField!
    @IBOutlet weak var descText:UITextView!
    var hud:MBProgressHUD?
    
    var firstName:String?
    var lastName:String?
    var descValue:String?
    var curAvatar:UIImage?
    var userImage:String?
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
        self.descText.delegate = self
        self.descText.placeholder = "Description"
        
        self.hanldeBgCornerAndShadow(bgView: self.firstNameBg)
        self.hanldeBgCornerAndShadow(bgView: self.lastNameBg)
        self.hanldeBgCornerAndShadow(bgView: self.descBg)
        
        self.saveBtn.layer.cornerRadius = 20
        self.saveBtn.layer.shadowColor = HexRGBAlpha(0xff000000,0.16).cgColor
        self.saveBtn.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.saveBtn.layer.shadowOpacity = 2
        
        let userModel = LoginTools.sharedTools.userInfo()
        ImageCacheUtils.sharedTools.imageUrl(key: userModel.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatarImg.image = UIImage(named: "logo")
            }else{
                self.avatarImg.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .fromCacheOnly, completed: nil)
            }
        }
        self.firstNameText.text = "\(userModel.firstName ?? "")"
        self.lastNameText.text = "\(userModel.lastName ?? "")"
        self.descText.text = "\(userModel.descriptionField ?? "")"
        self.firstName = userModel.firstName
        self.lastName = userModel.lastName
        self.descValue = userModel.descriptionField
        self.userImage = userModel.userImage
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
extension UserProfileEditViewController:TZImagePickerControllerDelegate{
    func imagePickerController(_ picker: TZImagePickerController, didFinishPicking photos: [UIImage], sourceAssets: [PHAsset], isSelectOriginalPhoto: Bool, infos: [Dictionary<String, Any>]?) {
        if photos.count == 0 {
            return
        }
        self.curAvatar = photos.first!
        self.avatarImg.image = self.curAvatar
    }
    func uploadAvatar(){
        if let userImageKey = LoginTools.sharedTools.userInfo().userImage {
            if StringUtils.isBlank(value: userImageKey) {
                self.userImage = "UserImage\(LoginTools.sharedTools.userId())"
            }else{
                self.userImage = userImageKey
            }
        }else{
            self.userImage = "UserImage\(LoginTools.sharedTools.userId())"
        }
        let data = self.curAvatar!.jpegData(compressionQuality: 0.2)!
        self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        Amplify.Storage.uploadData(
            key: self.userImage!,
            data: data,
            progressListener: { progress in
                print("Progress: \(progress)")
            }, resultListener: { event in
                switch event {
                case .success(let data):
                    print("Completed: \(data)")
                    DispatchQueue.main.async {
                        ToastHUD.showMsg(msg:"Upload Avatar Success", controller: self)
                        UserDefaults.standard.removeObject(forKey: self.userImage!)
                        self.editUserProfile()
                    }
                case .failure(let storageError):
                    print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                    DispatchQueue.main.async {
                        self.hud?.hide(animated: true)
                        ToastHUD.showMsg(msg:"\(storageError.errorDescription)", controller: self)
                    }
                }
            }
        )
    }
    @IBAction func submit(){
        if let _ = self.curAvatar {
            self.uploadAvatar()
        }else{
            self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            self.editUserProfile()
        }
    }
    func editUserProfile(){
        Backend.shared.editUserProfile(firstname: self.firstName, lastname: self.lastName, descValue: self.descValue, userImage: self.userImage) { isSuc in
            self.refreshUserProfile()
        } fail: { error in
            DispatchQueue.main.async {
                self.hud?.hide(animated: true)
                ToastHUD.showMsg(msg:"\(error)", controller: self)
            }
        }
    }
    func refreshUserProfile(){
        Backend.shared.fetchUserProfile(userId: LoginTools.sharedTools.userId()) {
            DispatchQueue.main.async {
                self.hud?.hide(animated: true)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshUserProfile"), object: nil)
                self.dismiss(animated: true, completion: nil)
            }
        } fail: { error in
            DispatchQueue.main.async {
                self.hud?.hide(animated: true)
                ToastHUD.showMsg(msg:"\(error)", controller: self)
            }
        }

    }
}
extension UserProfileEditViewController:UITextFieldDelegate,UITextViewDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textViewDidChange(_ textView: UITextView) {
        self.descValue = textView.text ?? ""
    }
}

