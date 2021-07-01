//
//  ContentUploadSectionConfigViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/28.
//

import UIKit

class ContentUploadSectionConfigViewController: BaseViewController {
    //video title
    var videoTitleValue:String!
    //video description
    var videoDescValue:String!
    //video file
    var videoImage:UIImage!
    var videoURL:URL!
    //video demo bool
//    var isDemoVideo:Bool!
    //
    var contentName:String = ""
    var thumbnail:String = ""
    //picker index
    var pickerSelectIndex:NSInteger = -1
    
    @IBOutlet weak var mainTableView:UITableView!
    @IBOutlet weak var submitBtn:UIButton!
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
        self.submitBtn.layer.cornerRadius = 20
        self.submitBtn.clipsToBounds = true
        
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.backgroundColor = .white
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
        self.mainTableView.register(UINib(nibName: "ContentInputCell", bundle: nil), forCellReuseIdentifier: "ContentInputCell")
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
        if section == self.segmentList.count {
           return UIView()
        }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SegmentSectionHeaderView") as! SegmentSectionHeaderView
        headerView.setIndex(section: section)
        headerView.delegate = self
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.segmentList.count == 0 {
            return 0
        }
        return self.segmentList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.segmentList[indexPath.section]
        switch indexPath.row {
        case 0:
            let cell:ContentInputCell = tableView.dequeueReusableCell(withIdentifier: "ContentInputCell", for: indexPath) as! ContentInputCell
            cell.delegate = self
            cell.setTitle("Name", textValue: model.name, indexPath: indexPath, shouldEdit: true)
            return cell
        case 1:
            let cell:ContentInputCell = tableView.dequeueReusableCell(withIdentifier: "ContentInputCell", for: indexPath) as! ContentInputCell
//            cell.delegate = self
            cell.setTitle("TimeStamp", textValue: model.timestamp, indexPath: indexPath, shouldEdit: false)
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            self.pickerSelectIndex = indexPath.section
            let vc:DatePickerViewController = DatePickerViewController()
            vc.delegate = self
            vc.modalPresentationStyle = .overCurrentContext
            DispatchQueue.main.async {
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}
extension ContentUploadSectionConfigViewController:DatePickerViewControllerDelegate{
    func doneBtnClicked(timeValue: String) {
        let model = self.segmentList[self.pickerSelectIndex]
        model.timestamp = timeValue
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
}
extension ContentUploadSectionConfigViewController:ContentInputCellDelegate,SegmentSectionHeaderViewDelegate,SingleBtnCellDelegate{
    func inputTextChanged(textValue: String?, indexPath: IndexPath) {
        let model = self.segmentList[indexPath.section]
        switch indexPath.row {
        case 0:
            model.name = textValue
            break
        default:
            break
        }
        let tmpModel = self.segmentList[indexPath.section]
        print("~~~~~~~~~~~~~~~~~~~\(tmpModel.toDictionary())")
    }
    @IBAction func addBtnClicked() {
        let model = UserContentSegmentListModel(fromDictionary: [:])
        self.segmentList.append(model)
        self.mainTableView.reloadData()
    }
    func delBtnClicked(sectionIndex: NSInteger) {
        self.segmentList.remove(at: sectionIndex)
        self.mainTableView.reloadData()
    }
    @IBAction func singleBtnClicked() {
        var canContinue = true
        for segmentModel:UserContentSegmentListModel in self.segmentList {
            if StringUtils.isBlank(value: segmentModel.name) {
                canContinue = false
                ToastHUD.showMsg(msg: "Please Complete The Information!", controller: self)
                break
            }
            if StringUtils.isBlank(value: segmentModel.timestamp) {
                canContinue = false
                ToastHUD.showMsg(msg: "Please Complete The Information!", controller: self)
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
            return
        }
        let fileData = try! Data(contentsOf: URL(fileURLWithPath: videoUrl.relativePath))
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        let videoKey = StringUtils.handleVideoKey(filename: videoUrl.lastPathComponent)
        self.contentName = videoKey
        Backend.shared.uploadVideo(videoData: fileData, videoKey: videoKey) { progress in
            print("~~~~~~~~~~~~~~~~~~~~~~\(progress.fractionCompleted)")
        } suc: {
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg: "Upload Success!", controller: self)
                self.uploadVideoCapture()
            }
        } fail: { error in
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg: "\(error)", controller: self)
            }
        }
    }
    func uploadVideoCapture(){
        let data = self.videoImage!.jpegData(compressionQuality: 0.2)!
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.thumbnail = StringUtils.thumbnailImgKey()
        Backend.shared.uploadImage(imgData: data, imgName: self.thumbnail) {
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg: "Upload Success!", controller: self)
                self.createUserContent()
            }
        } fail: { error in
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg: "\(error)", controller: self)
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
        
        Backend.shared.createUserContent(title: self.videoTitleValue, desc: self.videoDescValue,contentName: self.contentName, thumbnail: self.thumbnail, segments: str) { isSuc in
            DispatchQueue.main.async {
                hud.hide(animated: true)
//                ToastHUD.showMsg(msg: "Upload Success!", controller: self)
                let alertController = UIAlertController(title: "", message: "Upload Success!,Waiting for transcoding",
                                                        preferredStyle: .alert)
                let sureAction = UIAlertAction(title:  "Ok", style: .default) { (alertAction) in
                    self.dismiss(animated: true, completion: nil)
                }
                alertController.addAction(sureAction)
                DispatchQueue.main.async {
                    self.present(alertController, animated: true, completion: nil)
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:refreshTrainerContentList), object: nil)
            }
        } fail: { error in
            DispatchQueue.main.async {
                hud.hide(animated: true)
                ToastHUD.showMsg(msg: "\(error)", controller: self)
            }
        }
    }
}
