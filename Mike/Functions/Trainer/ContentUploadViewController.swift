//
//  ContentUploadViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/27.
//

import UIKit
import AssetsLibrary
class ContentUploadViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    @IBOutlet weak var continueBtn:UIButton!
    //video title
    var videoTitleValue:String?
    //video description
    var videoDescValue:String?
    //video file
//    var videoImage:UIImage?
//    var videoURL:URL?
    //video capture
    var videoCapture:UIImage?
    //video demo bool
//    var isDemoVideo:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(clearData), name: NSNotification.Name(rawValue: clearUploadPage), object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func clearData(){
        self.videoTitleValue = ""
        self.videoDescValue = ""
//        self.videoImage = nil
//        self.videoURL = nil
        self.videoCapture = nil
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
    
    func configTableView(){
        self.continueBtn.layer.borderWidth = 1
        self.continueBtn.layer.borderColor = orangeColor.cgColor
        self.continueBtn.layer.cornerRadius = 18.5

        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
        self.mainTableView.register(UINib(nibName: "SelectVideoCell", bundle: nil), forCellReuseIdentifier: "SelectVideoCell")
        self.mainTableView.register(UINib(nibName: "VideoTitleInputCell", bundle: nil), forCellReuseIdentifier: "VideoTitleInputCell")
        self.mainTableView.register(UINib(nibName: "DescriptionInputCell", bundle: nil), forCellReuseIdentifier: "DescriptionInputCell")
        self.mainTableView.register(UINib(nibName: "VideoCaptureUploadCell", bundle: nil), forCellReuseIdentifier: "VideoCaptureUploadCell")
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
extension ContentUploadViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell:VideoTitleInputCell = tableView.dequeueReusableCell(withIdentifier: "VideoTitleInputCell", for: indexPath) as! VideoTitleInputCell
            cell.delegate = self
            cell.setTitle("Title", textValue: self.videoTitleValue, indexPath: indexPath)
            return cell
        case 1:
            let cell:DescriptionInputCell = tableView.dequeueReusableCell(withIdentifier: "DescriptionInputCell", for: indexPath) as! DescriptionInputCell
            cell.delegate = self
            cell.setTitle("Description", textValue: self.videoDescValue, indexPath: indexPath)
            return cell
//        case 2:
//            if StringUtils.isBlank(value: self.videoURL?.absoluteString) {
//                let cell:VideoUploadCell = tableView.dequeueReusableCell(withIdentifier: "VideoUploadCell", for: indexPath) as! VideoUploadCell
//                cell.delegate = self
//                return cell
//            }else{
//                let cell:SelectVideoCell = tableView.dequeueReusableCell(withIdentifier: "SelectVideoCell", for: indexPath) as! SelectVideoCell
//                cell.setImage(image: self.videoImage)
//                cell.delegate = self
//                return cell
//            }
        case 2:
            let cell:VideoCaptureUploadCell = tableView.dequeueReusableCell(withIdentifier: "VideoCaptureUploadCell", for: indexPath) as! VideoCaptureUploadCell
            cell.setCaptureImg(image: self.videoCapture)
            cell.delegate = self
            return cell
//        case 4:
//            let cell:CheckBoxCell = tableView.dequeueReusableCell(withIdentifier: "CheckBoxCell", for: indexPath) as! CheckBoxCell
//            cell.delegate = self
//            cell.setCheckStatus(isCheck: self.isDemoVideo)
//            return cell
//        case 4:
//            let cell:SingleBtnCell = tableView.dequeueReusableCell(withIdentifier: "SingleBtnCell", for: indexPath) as! SingleBtnCell
//            cell.delegate = self
//            cell.setBtnTitle(title: "Continue")
//            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
extension ContentUploadViewController:VideoUploadCellDelegate,VideoTitleInputCellDelegate,SingleBtnCellDelegate,VideoCaptureUploadCellDelegate,DescriptionInputCellDelegate{
    //MARK: - videouploadCellDelegate
    func addBtnClicked() {
        self.selectVideo()
    }
    //MARK: - contentInputCellDelegate
    func inputTextChanged(textValue: String?) {
        self.videoTitleValue = textValue ?? ""
    }
    func descTextChanged(textValue: String?) {
        self.videoDescValue = textValue ?? ""
    }
//    //MARK: - checkBoxCellDelegate
//    func checkChanged(isChecked: Bool) {
//        self.isDemoVideo = isChecked
//    }
    //MARK: - reselectVideo
    func reselectBtnClicked() {
        self.selectVideo()
    }
    //MARK: - selectCover
    func addCaptureBtnClicked() {
        self.selectVideoCapture()
    }
    func delCaptureBtnClicked() {
        self.videoCapture = nil
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
    //MARK: - reselectCover
    func reselectCoverBtnClicked() {
        self.selectVideoCapture()
    }
    //MARK: - singleBtnDelegate
    @IBAction func continueBtnClicked() {
        if StringUtils.isBlank(value: self.videoTitleValue) {
            ToastHUD.showMsg(msg: "Please Input Title!", controller: self)
            return
        }
        if StringUtils.isBlank(value: self.videoDescValue) {
            ToastHUD.showMsg(msg: "Please Input Description!", controller: self)
            return
        }
        if self.videoCapture == nil {
            ToastHUD.showMsg(msg: "Please Select Video Capture!", controller: self)
            return
        }
        let vc:ContentUploadSectionConfigViewController = ContentUploadSectionConfigViewController()
//        vc.videoURL = self.videoURL
        vc.videoTitleValue = self.videoTitleValue
        vc.videoDescValue = self.videoDescValue
        vc.videoCapture = self.videoCapture
//        vc.isDemoVideo = self.isDemoVideo
//        if self.videoCapture == nil {
//            vc.videoImage = self.videoImage
//        }else{
//            vc.videoImage = self.videoCapture
//        }
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension ContentUploadViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    //select video
    @objc func selectVideo() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            print("读取相册错误")
        }
    }
    //selectCover
    @objc func selectVideoCapture() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            print("读取相册错误")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker.mediaTypes == ["public.movie"]{
//            let videoURL = info[.mediaURL] as! URL
//            self.videoURL = videoURL
//            let avAsset = AVAsset(url: videoURL)
//            print("视频地址：\(videoURL.relativePath)")
//
//            //generate image
//            let generator = AVAssetImageGenerator(asset: avAsset)
//            generator.appliesPreferredTrackTransform = true
//            let time = CMTimeMakeWithSeconds(0.0, preferredTimescale: 600)
//            var actualTime = CMTimeMake(value: 0, timescale: 0)
//            let imageRef:CGImage = try! generator.copyCGImage(at: time, actualTime: &actualTime)
//            let frameImg = UIImage(cgImage: imageRef)
//            self.videoImage = frameImg
//            self.mainTableView.reloadData()
        }else{
            let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            self.videoCapture = pickedImage
            self.mainTableView.reloadData()
        }
        
        
        //picker dismiss
        self.dismiss(animated: true, completion: {})
    }
}
