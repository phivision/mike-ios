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
    
    @IBOutlet weak var avatarImg:UIButton!
    
    @IBOutlet weak var firstNameBg:UIImageView!
    @IBOutlet weak var lastNameBg:UIImageView!
    @IBOutlet weak var descBg:UIImageView!
    @IBOutlet weak var descTitle:UILabel!
    
    @IBOutlet weak var firstNameText:UITextField!
    @IBOutlet weak var lastNameText:UITextField!
    @IBOutlet weak var descText:UITextView!
    var hud:MBProgressHUD?
    
    var firstName:String?
    var lastName:String?
    var descValue:String?
    var curAvatar:UIImage?
    var userImage:String?
    var isTrainer:Bool!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configView()
    }
    func configView(){
        if self.isTrainer == true {
            self.descBg.isHidden = false
            self.descText.isHidden = false
            self.descTitle.isHidden = false
        }else{
            self.descBg.isHidden = true
            self.descText.isHidden = true
            self.descTitle.isHidden = true
        }
        
        self.avatarImg.imageView!.layer.cornerRadius = 36
        self.avatarImg.imageView!.clipsToBounds = true
        
        self.firstNameText.delegate = self
        self.lastNameText.delegate = self
        self.descText.delegate = self
        
        self.hanldeBgCornerAndShadow(bgView: self.firstNameBg)
        self.hanldeBgCornerAndShadow(bgView: self.lastNameBg)
        self.hanldeBgCornerAndShadow(bgView: self.descBg)
        
        self.saveBtn.layer.cornerRadius = 18.5
        
        let userModel = LoginTools.sharedTools.userInfo()
        ImageCacheUtils.sharedTools.imageUrl(key: userModel.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatarImg.setImage( UIImage(named: "icon_user_default"), for: .normal)
            }else{
                self.avatarImg.sd_setImage(with: URL(string: imgUrl  ?? "")!,for:.normal, placeholderImage: UIImage(named: "icon_user_default"), options: .fromCacheOnly, completed: nil)
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
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 5
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = lightGreyColor.cgColor
    }

    @IBAction func textValueChanged(textfield:UITextField){
        if textfield == self.firstNameText{
            self.firstName = textfield.text ?? ""
        }else if textfield == self.lastNameText{
            self.lastName = textfield.text ?? ""
        }
    }
    @IBAction func selectAvatar(){
        let alertController = UIAlertController(title: "Choose Image", message: "",
                                                preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title:  "Camera", style: .default) { (alertAction) in
            let imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            DispatchQueue.main.async {
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        let photoAction = UIAlertAction(title:  "Photo Library", style: .default) { (alertAction) in
            let imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            DispatchQueue.main.async {
                self.present(imagePicker, animated: true, completion: nil)
            }
//            let vc:TZImagePickerController = TZImagePickerController(delegate: self, maxImagesCount: 1, columnNumber: 4, pushPhotoPickerVc: true)
//            vc.allowPickingImage = true
//            vc.allowTakePicture = false
//            vc.allowPickingVideo = false
//            vc.pickerDelegate = self
//            DispatchQueue.main.async {
//                self.present(vc, animated: true, completion: nil)
//            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(photoAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
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
        self.avatarImg.setImage(self.curAvatar, for: .normal)
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
                        ToastHUD.showMsg(msg:"Upload Succeeded", controller: self)
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
        UserProfileBackend.shared.editUserProfile(firstname: self.firstName, lastname: self.lastName, descValue: self.descValue, userImage: self.userImage) { isSuc in
            self.refreshUserProfile()
        } fail: { error in
            DispatchQueue.main.async {
                self.hud?.hide(animated: true)
                ToastHUD.showMsg(msg:"\(error)", controller: self)
            }
        }
    }
    func refreshUserProfile(){
        LoginBackend.shared.fetchUserProfile(userId: LoginTools.sharedTools.userId()) {
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
        } needCreateProfile: {
            
        }

    }
}
extension UserProfileEditViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var image : UIImage!
        if picker.sourceType == .camera {
            image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage ?? UIImage()
        }else{
            image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage ?? UIImage()
        }
        self.curAvatar = image
        self.avatarImg.setImage(self.curAvatar, for: .normal)
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: {

        })
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

