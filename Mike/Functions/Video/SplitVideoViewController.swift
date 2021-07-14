//
//  SplitVideoViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/28.
//

import UIKit
import SnapKit
import AVKit

class SplitVideoViewController: BaseViewController {
    //model for before controller
    var videoModel:UserCenterContent!
    lazy var playerView:UIImageView = {
        var playerView:UIImageView = UIImageView(frame: CGRect.zero)
        playerView.backgroundColor = HexRGBAlpha(0x141414,1)
        return playerView
    }()
    lazy var cameraView: UIImageView = {
        var cameraView:UIImageView = UIImageView(frame: CGRect.zero)
        cameraView.backgroundColor = HexRGBAlpha(0x141414,1)
        cameraView.contentMode = .scaleAspectFit
        return cameraView
    }()
    //camera show/hidden btn
//    lazy var cameraBtn: UIButton = {
//        var cameraBtn: UIButton = UIButton()
//        cameraBtn.backgroundColor = HexRGBAlpha(0xffffff,0.8)
//        cameraBtn.setImage(UIImage(named: "icon-camera"), for: .normal)
//        cameraBtn.addTarget(self, action: #selector(cameraBtnPressed), for: .touchUpInside)
//        cameraBtn.layer.cornerRadius = 5
//        cameraBtn.clipsToBounds = true
//        return cameraBtn
//    }()
    //back btn
    lazy var backBtn:UIButton = {
        var backBtn: UIButton = UIButton()
        backBtn.setImage(UIImage(named: "back_white"), for: .normal)
        backBtn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        backBtn.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        return backBtn
    }()
    //controlbar
    lazy var controlBar:UIView = {
       var controlBar:UIView = UIView()
        controlBar.backgroundColor = UIColor.white
        controlBar.layer.cornerRadius = 5
        controlBar.clipsToBounds = true
        return controlBar
    }()
    lazy var sliderTap:UITapGestureRecognizer = {
        var tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        tap.numberOfTouchesRequired = 1
        return tap
    }()
    lazy var progressSlider:UISlider = {
        var progressSlider:UISlider = UISlider()
        progressSlider.setThumbImage(UIImage(named:"icon_slider"), for: .normal)
        progressSlider.tintColor = orangeColor
        progressSlider.addTarget(self, action: #selector(handleTouchDown(slider:)), for: .touchDown)
        progressSlider.addTarget(self, action: #selector(handleSlide(slider:)), for: .valueChanged)
        progressSlider.addTarget(self, action: #selector(handleTouchUp(slider:)), for: .touchUpInside)
        progressSlider.addTarget(self, action: #selector(handleTouchUp(slider:)), for: .touchUpOutside)
        
        progressSlider.addGestureRecognizer(self.sliderTap)
        return progressSlider
    }()
    var isSliding:Bool = false
    lazy var playBtn:UIButton = {
        var playBtn:UIButton = UIButton()
        playBtn.backgroundColor = UIColor.clear
        playBtn.setImage(UIImage(named: "video_play"), for: .normal)
        playBtn.layer.cornerRadius = 10
        playBtn.clipsToBounds = true
        playBtn.addTarget(self, action: #selector(playBtnPressed), for: .touchUpInside)
        return playBtn
    }()
    lazy var nextBtn:UIButton = {
        var nextBtn:UIButton = UIButton()
        nextBtn.backgroundColor = UIColor.clear
        nextBtn.setImage(UIImage(named: "btn_forward"), for: .normal)
        nextBtn.layer.cornerRadius = 10
        nextBtn.clipsToBounds = true
        nextBtn.addTarget(self, action: #selector(nextBtnPressed), for: .touchUpInside)
        nextBtn.imageEdgeInsets = UIEdgeInsets.init(top: 10, left: 0, bottom: 10, right: 20)
        return nextBtn
    }()
    lazy var preBtn:UIButton = {
        var preBtn:UIButton = UIButton()
        preBtn.backgroundColor = UIColor.clear
        preBtn.setImage(UIImage(named: "btn_backward"), for: .normal)
        preBtn.layer.cornerRadius = 10
        preBtn.clipsToBounds = true
        preBtn.addTarget(self, action: #selector(preBtnPressed), for: .touchUpInside)
        preBtn.imageEdgeInsets = UIEdgeInsets.init(top: 10, left: 20, bottom: 10, right: 0)
        return preBtn
    }()
    lazy var segTitle:UILabel = {
        var segTitle:UILabel = UILabel()
        segTitle.font = UIFont.init(name: nAvenirBlack, size: 18)
        segTitle.textColor = UIColor.black
        return segTitle
    }()
    lazy var curTime:UILabel = {
        var curTime:UILabel = UILabel()
        curTime.font = UIFont.init(name: nAvenirMedium, size: 16)
        curTime.textColor = UIColor.black
        curTime.text = "00:00"
        return curTime
    }()
    lazy var segTime:UILabel = {
        var segTime:UILabel = UILabel()
        segTime.font = UIFont.init(name: nAvenirMedium, size: 16)
        segTime.textColor = UIColor.black
        segTime.text = " / 00:00"
        return segTime
    }()
    var curSegIndex = -1
    //total time
    var totalVideoTime:TimeInterval = 0
    var videoState:VideoPlayType = .stop
    //cameraLayer relation property
    private let captureSession = AVCaptureSession()
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer! = nil
    private let videoDataOutput = AVCaptureVideoDataOutput()
    private let videoDataOutputQueue = DispatchQueue(label: "VideoDataOutput", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    private var videoFrameSize: CGSize = .zero
    //playerView
    lazy var playerManager:ZFAVPlayerManager = {
        var playerManager:ZFAVPlayerManager = ZFAVPlayerManager()
        playerManager.shouldAutoPlay = true
        return playerManager
    }()
    lazy var player:ZFPlayerController = {
        var player:ZFPlayerController = ZFPlayerController(playerManager: self.playerManager, containerView: self.playerView)
        player.controlView = controlView
        player.pauseWhenAppResignActive = true
        player.allowOrentitaionRotation = false
        return player
    }()
    lazy var controlView:ZFPlayerControlView = {
        var controlView:ZFPlayerControlView = ZFPlayerControlView()
        controlView.fastViewAnimated = true
        controlView.autoHiddenTimeInterval = 5
        controlView.autoFadeTimeInterval = 0.5
        controlView.prepareShowLoading = true
        controlView.prepareShowControlView = true
//        controlView.fullScreenMode = .portrait
        controlView.portraitControlView.fullScreenBtn.isHidden = true
        controlView.portraitControlView.bottomToolView.isHidden = true
        return controlView
    }()
    //show camera
    var showCamera:Bool = false
    //concurrent queue
    let concurrent = DispatchQueue(label: "serial",attributes: .concurrent)
    // videoOrientation
    var videoOrientation:UIDeviceOrientation = .portrait
    //is loaded
    var isLoaded:Bool = false
    //seglist
    lazy var segList:Array<UserContentSegmentListModel> = {
        var segList:Array<UserContentSegmentListModel> = Array<UserContentSegmentListModel>()
        return segList
    }()
    lazy var segTimeList:Array<Int> = {
        var segTimeList:Array<Int> = Array<Int>()
        return segTimeList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Video"
        self.setNavLeftBtn(imageName: "icon-back")
        NotificationCenter.default.addObserver(self, selector: #selector(receiverNotification), name: UIDevice.orientationDidChangeNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
        if self.isLoaded == false {
            self.configData()
//            self.configCamera()
            self.configVideoView()
            self.isLoaded = true
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = true
        self.playerManager.stop()
//        self.stopCapture()
        let rotation : UIInterfaceOrientationMask = [.portrait]
        kAppdelegate?.blockRotation = rotation
    }
    override func leftButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    func configVideoView(){
        self.view.addSubview(self.playerView)
        self.playerView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self.view)
        }
        
        self.view.addSubview(self.cameraView)
        self.cameraView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self.view)
            make.height.equalTo(0)
        }
        
//        self.view.addSubview(self.cameraBtn)
//        self.cameraBtn.snp.makeConstraints { make in
//            make.bottom.equalTo(self.playerView).offset(-10)
//            make.right.equalTo(self.playerView).offset(-10)
//            make.height.width.equalTo(48)
//        }
        
        self.view.addSubview(self.controlBar)
        self.controlBar.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view.snp.bottom).offset(-34)
            make.height.equalTo(82)
            make.width.equalTo(kScreenWidth-20)
        }
        
        self.controlBar.addSubview(self.nextBtn)
        self.nextBtn.snp.makeConstraints { make in
            make.right.equalTo(self.controlBar).offset(-10)
            make.centerY.equalTo(self.controlBar)
            make.height.width.equalTo(44)
        }
        
        self.controlBar.addSubview(self.playBtn)
        self.playBtn.snp.makeConstraints { make in
            make.right.equalTo(self.nextBtn.snp.left)
            make.centerY.equalTo(self.controlBar)
            make.height.width.equalTo(48)
        }
        
        self.controlBar.addSubview(self.preBtn)
        self.preBtn.snp.makeConstraints { make in
            make.right.equalTo(self.playBtn.snp.left)
            make.centerY.equalTo(self.controlBar)
            make.height.width.equalTo(44)
        }
        
        self.controlBar.addSubview(self.segTitle)
        self.segTitle.snp.makeConstraints { make in
            make.left.equalTo(self.controlBar.snp.left).offset(22)
            make.top.equalTo(self.controlBar.snp.top).offset(15)
            make.right.equalTo(self.preBtn.snp.left).offset(-20)
        }
        
        self.controlBar.addSubview(self.curTime)
        self.curTime.snp.makeConstraints { make in
            make.left.equalTo(self.controlBar.snp.left).offset(22)
            make.bottom.equalTo(self.controlBar.snp.bottom).offset(-15)
        }
        
        self.controlBar.addSubview(self.segTime)
        self.segTime.snp.makeConstraints { make in
            make.left.equalTo(self.curTime.snp.right)
            make.bottom.equalTo(self.curTime.snp.bottom)
        }
        
        self.view.addSubview(self.progressSlider)
        self.progressSlider.snp.makeConstraints { make in
            make.left.right.equalTo(self.controlBar)
            make.top.equalTo(self.controlBar.snp.top).offset(-5)
            make.height.equalTo(10)
        }
        
        self.view.addSubview(self.backBtn)
        self.backBtn.snp.makeConstraints { make in
            make.top.equalTo(self.playerView).offset(44)
            make.left.equalTo(self.playerView).offset(10)
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
        
        self.player.playerDidToEnd = { asset in
            self.playerManager.pause()
            self.playBtn.isSelected = false
            self.videoState = .end
            self.handlePlayBtn(byState: self.videoState)
        }
        
        
        self.player.playerPlayTimeChanged = { asset,curTime,duration in
            self.totalVideoTime = duration
            DispatchQueue.main.async {
                self.curTime.text = self.translateTimestampToFormat(currentTime: curTime)
                self.progressSlider.value = Float(curTime/duration)
            }
            self.handleSegmentTime(currentTime: curTime)
        }
        let strArr:Array<String> = (self.videoModel.contentName ?? "").components(separatedBy: ".")
        if strArr.count > 0 {
//            let videoUrl:String = strArr.first ?? ""
            self.playerManager.assetURL = NSURL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")! as URL
//            self.playerManager.assetURL = NSURL(string: String(format: "%@%@.m3u8", LoginTools.sharedTools.videoHost,videoUrl))! as URL
            self.videoState = .play
            self.handlePlayBtn(byState: self.videoState)
            self.playerManager.play()
        }
          
    }
    func configData(){
        self.segTitle.text = ""
//        self.segmentTime.text = ""
        let segList:NSArray = JSONUtils.getArrayFromJSONString(jsonString: self.videoModel.segments ?? "")
        print("\(segList)");
        for segItem in segList {
            if let segDic = segItem as? NSDictionary {
                let model = UserContentSegmentListModel(fromDictionary: segDic as? [String : Any] ?? [:])
                self.segList.append(model)
                var finalTime:Int = 0
                let timeArr = model.timestamp.components(separatedBy: ":")
                if timeArr.count > 2 {
                    finalTime += (Int(timeArr[0]) ?? 0)*3600
                    finalTime += (Int(timeArr[1]) ?? 0)*60
                    finalTime += Int(timeArr[2]) ?? 0
                }else if timeArr.count > 1 {
                    finalTime += (Int(timeArr[0]) ?? 0)*60
                    finalTime += Int(timeArr[1]) ?? 0
                }else{
                    finalTime += Int(timeArr[0]) ?? 0
                }
                self.segTimeList.append(finalTime)
            }
        }
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\(self.segTimeList)");
        self.handleSegmentTime(currentTime: 0)
    }
    @objc func backBtnPressed(){
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
extension SplitVideoViewController{
    @objc func handleTouchDown(slider:UISlider){
        self.sliderTap.isEnabled = false
        self.isSliding = true
        if self.playerManager.isPlaying {
            self.playerManager.pause()
        }
    }
    @objc func handleTouchUp(slider:UISlider){
        self.sliderTap.isEnabled = true
        self.isSliding = false
        self.playerManager.play()
    }
    @objc func handleSlide(slider:UISlider){
        let sliderTime:TimeInterval = self.totalVideoTime * Double(slider.value)
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%f",sliderTime)
        DispatchQueue.main.async {
            self.curTime.text = self.translateTimestampToFormat(currentTime: sliderTime)
            self.player.seek(toTime: sliderTime, completionHandler: nil)
        }
    }
    @objc func handleTap(recognizer:UITapGestureRecognizer){
        let touchPoint:CGPoint = recognizer.location(in: self.progressSlider)
        let value = touchPoint.x / self.progressSlider.width
        self.progressSlider.setValue(Float(value), animated: true)
        
        if self.playerManager.isPlaying {
            self.playerManager.pause()
        }
        let sliderTime:TimeInterval = self.totalVideoTime * Double(self.progressSlider.value)
        self.player.seek(toTime: sliderTime) { isSuc in
            self.playerManager.play()
        }
    }
}

extension SplitVideoViewController{
    @objc func playBtnPressed(){
        switch self.videoState {
        case .stop:
            self.videoState = .play
            self.handlePlayBtn(byState: self.videoState)
            self.playerManager.play()
            break
        case .pause:
            self.videoState = .play
            self.handlePlayBtn(byState: self.videoState)
            self.playerManager.play()
            break
        case .end:
            self.videoState = .play
            self.handlePlayBtn(byState: self.videoState)
            self.playerManager.replay()
            break
        case .play:
            self.videoState = .pause
            self.handlePlayBtn(byState: self.videoState)
            self.playerManager.pause()
            break
        }
    }
    @objc func nextBtnPressed(){
        if self.curSegIndex == self.segTimeList.count - 1 {
            self.videoState = .pause
            self.handlePlayBtn(byState: self.videoState)
            self.playerManager.seek(toTime: self.totalVideoTime, completionHandler: nil)
        }else{
            self.videoState = .play
            self.handlePlayBtn(byState: self.videoState)
            self.playerManager.seek(toTime: TimeInterval(self.segTimeList[self.curSegIndex+1]), completionHandler: nil)
        }
    }
    @objc func preBtnPressed(){
        if self.curSegIndex <= 0 {
            self.videoState = .play
            self.handlePlayBtn(byState: self.videoState)
            self.playerManager.seek(toTime: 0, completionHandler: nil)
        }else{
            self.videoState = .play
            self.handlePlayBtn(byState: self.videoState)
            self.playerManager.seek(toTime: TimeInterval(self.segTimeList[self.curSegIndex-1]), completionHandler: nil)
        }
    }
}
//playbtn handler
extension SplitVideoViewController{
   func handlePlayBtn(byState:VideoPlayType){
        switch byState {
        case .stop:
            self.playBtn.setImage(UIImage(named: "video_play"), for: .normal)
            break
        case .pause:
            self.playBtn.setImage(UIImage(named: "video_play"), for: .normal)
            break
        case .end:
            self.playBtn.setImage(UIImage(named: "btn_replay"), for: .normal)
            break
        case .play:
            self.playBtn.setImage(UIImage(named: "btn_pause"), for: .normal)
            break
        }
    }
    func translateTimestampToFormat(currentTime:TimeInterval) -> String {
        let hour:Int = Int(currentTime/3600)
        let mins:Int = Int(currentTime)/60 - hour*60
        let second = Int(currentTime) - hour*3600 - mins*60
        return String(format: "%02d:%02d:%02d", hour,mins,second)
    }
    func handleSegmentTime(currentTime:TimeInterval){
        if self.segList.count > 0 {
            let firstSeg = self.segTimeList.first
            if firstSeg != 0 && Int(currentTime) <= (firstSeg ?? 0) {
                self.segTitle.text = self.videoModel.title ?? ""
                self.segTime.text = " / " + (self.segList.first?.timestamp ?? "")
            }else{
                var selectIndex = -1
                for i in 0 ..< self.segTimeList.count {
                    let segTime:Int = self.segTimeList[i]
                    if currentTime <= Double(segTime){
                        if i>0 {
                            selectIndex = i - 1
                        }else{
                            selectIndex = 0
                        }
                        break
                    }
                }
                if selectIndex == -1 {
                    selectIndex = self.segTimeList.count - 1
                }
                //record curSegIndex for change Seg
                self.curSegIndex = selectIndex
                let model:UserContentSegmentListModel = self.segList[selectIndex]
                self.segTitle.text = "\(model.name ?? "")"
                if Int(currentTime) > (self.segTimeList.last ?? 0) {
                    self.segTime.text = " / " + self.translateTimestampToFormat(currentTime: self.totalVideoTime)
                }else{
                    self.segTime.text = " / \(model.timestamp ?? "")"
                }
            }
        }else{
            self.segTitle.text = self.videoModel.title ?? ""
            self.segTime.text = " / " + self.translateTimestampToFormat(currentTime: self.totalVideoTime)
        }
    }
}
//rotation
extension SplitVideoViewController{
    @objc func receiverNotification(){
            let orient = UIDevice.current.orientation
        self.videoOrientation = orient
            switch orient {
            case .portrait :
                print("屏幕正常竖向")
                self.backBtn.isHidden = false
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                self.orientationPortraitConfig()
                break
            case .portraitUpsideDown:
                self.backBtn.isHidden = true
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                self.orientationPortraitConfig()
                print("屏幕倒立")
                break
            case .landscapeLeft:
                self.backBtn.isHidden = true
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                self.orientationLandScapeConfig()
                print("屏幕左旋转")
                break
            case .landscapeRight:
                print("屏幕右旋转")
                self.backBtn.isHidden = true
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                self.orientationLandScapeConfig()
                break
            default:
                break
            }
        }
    func orientationPortraitConfig(){
        if self.showCamera  != true {
            UIView.animate(withDuration: 0.3) {
                self.playerView.snp.remakeConstraints { make in
                    make.top.left.right.bottom.equalTo(self.view)
                }
                self.cameraView.snp.remakeConstraints { make in
                    make.left.right.bottom.equalTo(self.view)
                    make.height.equalTo(0)
                }
            }
        }else{
//            self.resetCaptureOrientation()
            UIView.animate(withDuration: 0.3) {
                self.playerView.snp.remakeConstraints { make in
                    make.top.left.right.equalTo(self.view)
                    make.height.equalTo(kScreenHeight/2)
                }
                self.cameraView.snp.remakeConstraints { make in
                    make.left.right.bottom.equalTo(self.view)
                    make.height.equalTo(kScreenHeight/2)
                }
            }
        }
    }
    func orientationLandScapeConfig(){
        if self.showCamera  != true {
            UIView.animate(withDuration: 0.3) {
                self.playerView.snp.remakeConstraints { make in
                    make.top.left.bottom.right.equalTo(self.view)
                }
                self.cameraView.snp.remakeConstraints { make in
                    make.left.right.bottom.equalTo(self.view)
                    make.height.equalTo(0)
                }
            }
        }else{
//            self.resetCaptureOrientation()
            UIView.animate(withDuration: 0.3) {
                self.playerView.snp.remakeConstraints { make in
                    make.top.left.bottom.equalTo(self.view)
                    make.width.equalTo(kScreenHeight/2)
                }
                self.cameraView.snp.remakeConstraints { make in
                    make.top.right.bottom.equalTo(self.view)
                    make.width.equalTo(kScreenHeight/2)
                }
            }
        }
    }
}
extension SplitVideoViewController{
    override var shouldAutorotate: Bool{
        return true
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return [.portrait,.landscapeRight,.landscapeLeft]
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
    override var prefersStatusBarHidden: Bool{
        return false
    }
}

//camera handler
//extension SplitVideoViewController:AVCaptureVideoDataOutputSampleBufferDelegate{
//    @objc func cameraBtnPressed(){
//        if self.showCamera == false {
//            self.showCamera = true
//            self.resetCaptureOrientation()
//            self.startCapture()
//            if self.videoOrientation == .portrait || self.videoOrientation == .portraitUpsideDown {
//                UIView.animate(withDuration: 0.3) {
//                    self.playerView.snp.remakeConstraints { make in
//                        make.top.left.right.equalTo(self.view)
//                        make.height.equalTo(kScreenHeight/2)
//                    }
//                    self.cameraView.snp.remakeConstraints { make in
//                        make.left.right.bottom.equalTo(self.view)
//                        make.height.equalTo(kScreenHeight/2)
//                    }
//                }
//            }else{
//                UIView.animate(withDuration: 0.3) {
//                    self.playerView.snp.remakeConstraints { make in
//                        make.top.left.bottom.equalTo(self.view)
//                        make.width.equalTo(kScreenHeight/2)
//                    }
//                    self.cameraView.snp.remakeConstraints { make in
//                        make.top.right.bottom.equalTo(self.view)
//                        make.width.equalTo(kScreenHeight/2)
//                    }
//                }
//            }
//        }else{
//            self.showCamera = false
//            self.stopCapture()
//            if self.videoOrientation == .portrait || self.videoOrientation == .portraitUpsideDown {
//                UIView.animate(withDuration: 0.3) {
//                    self.playerView.snp.remakeConstraints { make in
//                        make.top.left.right.equalTo(self.view)
//                        make.height.equalTo(kScreenHeight)
//                    }
//                    self.cameraView.snp.remakeConstraints { make in
//                        make.left.right.bottom.equalTo(self.view)
//                        make.height.equalTo(0)
//                    }
//                }
//            }else{
//                UIView.animate(withDuration: 0.3) {
//                    self.playerView.snp.remakeConstraints { make in
//                        make.top.left.right.equalTo(self.view)
//                        make.height.equalTo(kScreenWidth)
//                    }
//                    self.cameraView.snp.remakeConstraints { make in
//                        make.left.right.bottom.equalTo(self.view)
//                        make.height.equalTo(0)
//                    }
//                }
//            }
//        }
//    }
//    //检测相机可用性
//    func configCamera() {
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            //获取提供数据的设备以及数据类型
//            guard let videoDevice = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .front).devices.first else {
//                return
//            }
//            self.captureSession.beginConfiguration()
//            self.captureSession.sessionPreset = .vga640x480
//            do{
//                try self.captureSession.addInput(AVCaptureDeviceInput(device: videoDevice))
//            }
//            catch {
//                print("error: \(error.localizedDescription)")
//            }
//            if captureSession.canAddOutput(videoDataOutput) {
//                captureSession.addOutput(videoDataOutput)
//                videoDataOutput.alwaysDiscardsLateVideoFrames = true
//                videoDataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)]
//                videoDataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
//            } else {
//                print("Could not add video data output to the session")
//                captureSession.commitConfiguration()
//                return
//            }
//
//            let captureConnection = videoDataOutput.connection(with: .video)
//            captureConnection?.isEnabled = true
//            self.configCaptureOrientation(captureConnection: captureConnection)
//            captureConnection?.isVideoMirrored = true
//            captureSession.commitConfiguration()
//
//            self.videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//            self.videoPreviewLayer.videoGravity = .resizeAspectFill
//
////            videoPreviewLayer.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: self.standardView.height/2)
////            self.cameraView.layer.addSublayer(videoPreviewLayer)
//        } else {
//            print("不支持拍照")
//        }
//    }
//    func startCapture() {
//        self.concurrent.async {
//            if !self.captureSession.isRunning {
//                self.captureSession.startRunning()
//            }
//        }
//    }
//    func stopCapture() {
//        self.concurrent.async {
//            if self.captureSession.isRunning {
//                self.captureSession.stopRunning()
//            }
//        }
//    }
//    func resetCaptureOrientation(){
//        let captureConnection = videoDataOutput.connection(with: .video)
//        captureConnection?.isEnabled = true
//        self.configCaptureOrientation(captureConnection: captureConnection)
//        captureConnection?.isVideoMirrored = true
//        captureSession.commitConfiguration()
//    }
//    func configCaptureOrientation(captureConnection:AVCaptureConnection?){
//        switch self.videoOrientation {
//        case .portrait:
//            captureConnection?.videoOrientation = .portrait
//            break
//        case .portraitUpsideDown:
//            captureConnection?.videoOrientation = .portraitUpsideDown
//            break
//        case .landscapeLeft:
//            captureConnection?.videoOrientation = .landscapeRight
//            break
//        case .landscapeRight:
//            captureConnection?.videoOrientation = .landscapeLeft
//            break
//        default:
//            break
//        }
//    }
////    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
////
////    }
//    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//        DispatchQueue.main.async {
//            // 导出照片
//            let image = self.imageConvert(sampleBuffer: sampleBuffer)
//            self.cameraView.image = image
//        }
//    }
//
//    /// CMSampleBufferRef=>UIImage
//    func imageConvert(sampleBuffer:CMSampleBuffer?) -> UIImage? {
//        guard sampleBuffer != nil && CMSampleBufferIsValid(sampleBuffer!) == true else { return nil }
//        let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer!)
//        let ciImage = CIImage(cvPixelBuffer: pixelBuffer!)
//        return UIImage(ciImage: ciImage)
//    }
//
//}
