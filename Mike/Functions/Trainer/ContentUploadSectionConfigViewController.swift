//
//  ContentUploadSectionConfigViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/28.
//

import UIKit

class ContentUploadSectionConfigViewController: BaseViewController {
    @IBOutlet weak var postBtn:UIButton!
    //video title
    var videoTitleValue:String!
    //video description
    var videoDescValue:String!
    //video file
    var videoImage:UIImage?
    var videoURL:URL?
    //video capture
    var videoCapture:UIImage!
    //video demo bool
//    var isDemoVideo:Bool!
    //
    var contentName:String = ""
    var thumbnail:String = ""
    //picker index
    var pickerSelectIndex:NSInteger = -1
    var firstIndex:NSInteger = 0
    var secondIndex:NSInteger = 0
    var thirdIndex:NSInteger = 0
    //video Orientation
    var videoOrientation:NSString = "Portrait"
    
    @IBOutlet weak var mainTableView:UITableView!
    lazy var segmentList:Array<UserContentSegmentListModel> = {
        var segmentList:Array<UserContentSegmentListModel> = Array<UserContentSegmentListModel>()
        return segmentList
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        // Do any additional setup after loading the view.
    }

    func configTableView(){
        self.postBtn.layer.cornerRadius = 18.5
        
        
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
        self.mainTableView.register(UINib(nibName: "VideoUploadCell", bundle: nil), forCellReuseIdentifier: "VideoUploadCell")
        self.mainTableView.register(UINib(nibName: "SegmentInputCell", bundle: nil), forCellReuseIdentifier: "SegmentInputCell")
        self.mainTableView.register(UINib(nibName: "SegmentSectionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "SegmentSectionHeaderView")
    }
    
    @IBAction func backBtn(){
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
extension ContentUploadSectionConfigViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SegmentSectionHeaderView") as! SegmentSectionHeaderView
            headerView.delegate = self
            return headerView
        }else{
            return UIView()
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 79
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return self.segmentList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:VideoUploadCell = tableView.dequeueReusableCell(withIdentifier: "VideoUploadCell", for: indexPath) as! VideoUploadCell
            cell.delegate = self
            cell.setVideoImg(image: self.videoImage)
            return cell
        }else{
            let model = self.segmentList[indexPath.row]
            let cell:SegmentInputCell = tableView.dequeueReusableCell(withIdentifier: "SegmentInputCell", for: indexPath) as! SegmentInputCell
            cell.delegate = self
            cell.setModel(model: model,index: indexPath)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 1 {
//            self.pickerSelectIndex = indexPath.section
//            let vc:DatePickerViewController = DatePickerViewController()
//            vc.delegate = self
//            vc.firstIndex = self.firstIndex
//            vc.secondIndex = self.secondIndex
//            vc.thirdIndex = self.thirdIndex
//            vc.modalPresentationStyle = .overCurrentContext
//            DispatchQueue.main.async {
//                self.present(vc, animated: true, completion: nil)
//            }
//        }
    }
}
extension ContentUploadSectionConfigViewController:VideoUploadCellDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func addVideoBtnClicked() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            DispatchQueue.main.async {
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        else {
            print("读取相册错误")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker.mediaTypes == ["public.movie"]{
            if let videoURL = info[.mediaURL] as? URL{
                self.handleVideoUrl(videoURL: videoURL)
            }
        }
        //picker dismiss
        self.dismiss(animated: true, completion: {})
    }
    func handleVideoUrl(videoURL:URL!){
        self.videoURL = videoURL
        let avAsset = AVAsset(url: videoURL)

        //generate image
        let generator = AVAssetImageGenerator(asset: avAsset)
        generator.appliesPreferredTrackTransform = true
        let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
        var actualTime = CMTimeMake(value: 0, timescale: 0)
        if let imageRef = try? generator.copyCGImage(at: time, actualTime: &actualTime) {
            let frameImg = UIImage(cgImage: imageRef)
            self.videoImage = frameImg
            self.videoOrientation = self.degressFromImage(image: self.videoImage ?? UIImage())
            print("videoOrientation：\(videoOrientation)")
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
    }
    func delVideoBtnClicked() {
        self.videoImage = nil
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
    func degressFromImage(image:UIImage) -> NSString{
        if image.size.width > image.size.height {
            return "Landscape"
        }else{
            return "Portrait"
        }
    }
//    func degressFromVideoFileWithURL(asset:AVAsset) -> NSString {
//        var degress:NSString = "Portrait"
//        let tracks:[AVAssetTrack] = asset.tracks(withMediaType: .video)
//        if(tracks.count > 0) {
//            let videoTrack = tracks[0]
//            let t:CGAffineTransform = videoTrack.preferredTransform
//            if(t.a == 0 && t.b == 1.0 && t.c == -1.0 && t.d == 0){
//                // Portrait
//                degress = "Portrait"
//            }else if(t.a == 0 && t.b == -1.0 && t.c == 1.0 && t.d == 0){
//                // PortraitUpsideDown
//                degress = "Portrait"
//            }else if(t.a == 1.0 && t.b == 0 && t.c == 0 && t.d == 1.0){
//                // LandscapeRight
//                degress = "Landscape"
//            }else if(t.a == -1.0 && t.b == 0 && t.c == 0 && t.d == -1.0){
//                // LandscapeLeft
//                degress = "Landscape";
//            }
//        }
//        return degress;
//    }
}
extension ContentUploadSectionConfigViewController:SegmentInputCellDelegate{
    func segmentChanged(textValue: String?, index: IndexPath?) {
        let model = self.segmentList[index?.row ?? 0]
        model.name = textValue
    }
    func segmentTimeClicked(index: IndexPath?) {
        if let rowIndex = index?.row {
            self.pickerSelectIndex = rowIndex
            let vc:DatePickerViewController = DatePickerViewController()
            vc.delegate = self
            vc.firstIndex = self.firstIndex
            vc.secondIndex = self.secondIndex
            vc.thirdIndex = self.thirdIndex
            vc.modalPresentationStyle = .overCurrentContext
            DispatchQueue.main.async {
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    func segmentDelAction(index: IndexPath?) {
        if let rowIndex = index?.row {
            self.segmentList.remove(at: rowIndex)
            self.mainTableView.reloadData()
        }
    }
}
extension ContentUploadSectionConfigViewController:DatePickerViewControllerDelegate{
    func doneBtnClicked(timeValue: String) {
        let model = self.segmentList[self.pickerSelectIndex]
        model.timestamp = timeValue
        let segList:Array<Substring> = timeValue.split(separator: ":")
        self.firstIndex = Int(String(segList.first ?? "")) ?? 0
        self.secondIndex = Int(String(segList[1] )) ?? 0
        self.thirdIndex = Int(String(segList.last ?? "")) ?? 0
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
}
extension ContentUploadSectionConfigViewController:SegmentSectionHeaderViewDelegate,SingleBtnCellDelegate{
//    func inputTextChanged(textValue: String?, indexPath: IndexPath) {
//        let model = self.segmentList[indexPath.section]
//        switch indexPath.row {
//        case 0:
//            model.name = textValue
//            break
//        default:
//            break
//        }
//        let tmpModel = self.segmentList[indexPath.section]
//        print("~~~~~~~~~~~~~~~~~~~\(tmpModel.toDictionary())")
//    }
    func addBtnClicked() {
        let model = UserContentSegmentListModel(fromDictionary: [:])
        self.segmentList.append(model)
        self.mainTableView.reloadData()
    }
    @IBAction func postBtnClicked() {
        var canContinue = true
        for segmentModel:UserContentSegmentListModel in self.segmentList {
            if StringUtils.isBlank(value: segmentModel.name) {
                canContinue = false
                ToastHUD.showMsg(msg: "Please complete the required fields", controller: self)
                break
            }
            if StringUtils.isBlank(value: segmentModel.timestamp) {
                canContinue = false
                ToastHUD.showMsg(msg: "Please complete the required fields", controller: self)
                break
            }
        }
        if canContinue == true {
            self.uploadVideo()
        }
    }
}
extension ContentUploadSectionConfigViewController{
    func uploadVideo(){
        guard let videoUrl = self.videoURL else{
            self.uploadVideoCapture()
            return
        }
        let fileData = try! Data(contentsOf: URL(fileURLWithPath: videoUrl.relativePath))
//        self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        let videoKey = "\(self.videoOrientation)_\(StringUtils.handleVideoKey(filename: videoUrl.lastPathComponent))"
        self.contentName = videoKey
        
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .annularDeterminate
        hud.label.text = "UpLoading Video..."
        TrainerBackend.shared.uploadVideo(videoData: fileData, videoKey: videoKey) { progress in
            print("progress~~~~~~~~~~~~~~~~~~~~~~\(Float(progress.completedUnitCount)/Float(progress.totalUnitCount))")
            DispatchQueue.main.async {
                MBProgressHUD.forView(self.view)?.progress = Float(progress.completedUnitCount)/Float(progress.totalUnitCount)
            }
        } suc: {
            DispatchQueue.main.async {
                MBProgressHUD.forView(self.view)?.hide(animated: true)
//                self.hud?.hide(animated: true)
//                ToastHUD.showMsg(msg: "Upload Succeeded!", controller: self)
                self.uploadVideoCapture()
            }
        } fail: { error in
            DispatchQueue.main.async {
//                self.hud?.hide(animated: true)
                MBProgressHUD.forView(self.view)?.hide(animated: true)
                ToastHUD.showMsg(msg: "Error. Please try again later.", controller: self)
            }
        }
    }
    func uploadVideoCapture(){
        let data = self.videoCapture!.jpegData(compressionQuality: 0.2)!
//        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.thumbnail = StringUtils.thumbnailImgKey()
        
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .annularDeterminate
        hud.label.text = "UpLoading Video Capture..."
        
        TrainerBackend.shared.uploadImage(imgData: data, imgName: self.thumbnail) {progress in
            print("~~~~~~~~~~~~~~~~~~~~~~\(progress.fractionCompleted)")
            DispatchQueue.main.async {
                MBProgressHUD.forView(self.view)?.progress = Float(progress.completedUnitCount)/Float(progress.totalUnitCount)
            }
        } suc:{
            DispatchQueue.main.async {
                MBProgressHUD.forView(self.view)?.hide(animated: true)
//                self.hud?.hide(animated: true)
//                ToastHUD.showMsg(msg: "Upload Succeeded!", controller: self)
                self.createUserContent()
            }
        } fail: { error in
            DispatchQueue.main.async {
                MBProgressHUD.forView(self.view)?.hide(animated: true)
//                self.hud?.hide(animated: true)
                ToastHUD.showMsg(msg: "Error. Please try again later.", controller: self)
            }
        }
    }
    func createUserContent(){
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        var arrayDic:Array<[String:Any]> = Array<[String:Any]>()
        for item:UserContentSegmentListModel in self.segmentList {
            let dic = item.toDictionary()
            arrayDic.append(dic)
        }
        let jsonData = try! JSONSerialization.data(withJSONObject: arrayDic, options: .prettyPrinted)
        let str = String(data: jsonData, encoding: .utf8) ?? ""
        
        TrainerBackend.shared.createUserContent(title: self.videoTitleValue, desc: self.videoDescValue,contentName: self.contentName, thumbnail: self.thumbnail, segments: str) { isSuc in
            DispatchQueue.main.async {
                hud.hide(animated: true)
//                ToastHUD.showMsg(msg: "Upload Succeeded!", controller: self)
                let alertController = UIAlertController(title: "", message: "Upload Succeeded,Waiting for processing...",
                                                        preferredStyle: .alert)
                let sureAction = UIAlertAction(title:  "OK", style: .default) { (alertAction) in
                    self.navigationController?.popViewController(animated: true)
                }
                alertController.addAction(sureAction)
                DispatchQueue.main.async {
                    self.present(alertController, animated: true, completion: nil)
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: clearUploadPage), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:refreshTrainerContentList), object: nil)
            }
        } fail: { error in
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg: "Error. Please try again later.", controller: self)
            }
        }
    }
}
