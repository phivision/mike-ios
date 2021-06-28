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
    lazy var cameraBtn: UIButton = {
        var cameraBtn: UIButton = UIButton()
        cameraBtn.backgroundColor = HexRGBAlpha(0xffffff,0.8)
        cameraBtn.setImage(UIImage(named: "icon-camera"), for: .normal)
        cameraBtn.addTarget(self, action: #selector(cameraBtnPressed), for: .touchUpInside)
        cameraBtn.layer.cornerRadius = 5
        cameraBtn.clipsToBounds = true
        return cameraBtn
    }()
    //back btn
    lazy var backBtn:UIButton = {
        var backBtn: UIButton = UIButton()
        backBtn.setImage(UIImage(named: "back_white"), for: .normal)
        backBtn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        backBtn.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        return backBtn
    }()
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
        self.configVideoView()
        NotificationCenter.default.addObserver(self, selector: #selector(receiverNotification), name: UIDevice.orientationDidChangeNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        if self.isLoaded == false {
            self.configData()
            self.configCamera()
            self.configVideoView()
            self.isLoaded = true
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.playerManager.stop()
        self.stopCapture()
        let rotation : UIInterfaceOrientationMask = [.portrait]
        kAppdelegate?.blockRotation = rotation
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
        self.view.addSubview(self.cameraBtn)
        self.cameraBtn.snp.makeConstraints { make in
            make.bottom.equalTo(self.playerView).offset(-10)
            make.right.equalTo(self.playerView).offset(-10)
            make.height.width.equalTo(48)
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
//            self.playBtn.isSelected = false
//            self.videoState = .end
//            self.handlePlayBtn(byState: self.videoState)
        }
        self.player.playerPlayTimeChanged = { asset,curTime,duration in
//            self.handleSegmentTime(currentTime: curTime)
        }
        let strArr:Array<String> = (self.videoModel.contentName ?? "").components(separatedBy: ".")
        if strArr.count > 0 {
            let videoUrl:String = strArr.first ?? ""
//            self.playerManager.assetURL = NSURL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")! as URL
            self.playerManager.assetURL = NSURL(string: String(format: "%@%@.m3u8", LoginTools.sharedTools.videoHost,videoUrl))! as URL
//            self.videoState = .play
//            self.handlePlayBtn(byState: self.videoState)
            self.playerManager.play()
        }
          
    }
    func configData(){
//        self.segmentTitle.text = ""
//        self.segmentTime.text = ""
//        let segList:NSArray = JSONUtils.getArrayFromJSONString(jsonString: self.videoModel.segments ?? "")
//        print("\(segList)");
//        for segItem in segList {
//            if let segDic = segItem as? NSDictionary {
//                let model = UserContentSegmentListModel(fromDictionary: segDic as? [String : Any] ?? [:])
//                self.segList.append(model)
//                var finalTime:Int = 0
//                let timeArr = model.timestamp.components(separatedBy: ":")
//                if timeArr.count > 2 {
//                    finalTime += (Int(timeArr[0]) ?? 0)*3600
//                    finalTime += (Int(timeArr[1]) ?? 0)*60
//                    finalTime += Int(timeArr[2]) ?? 0
//                }else if timeArr.count > 1 {
//                    finalTime += (Int(timeArr[0]) ?? 0)*60
//                    finalTime += Int(timeArr[1]) ?? 0
//                }else{
//                    finalTime += Int(timeArr[0]) ?? 0
//                }
//                self.segTimeList.append(finalTime)
//            }
//        }
//        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\(self.segTimeList)");
//        self.handleSegmentTime(currentTime: 0)
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
extension SplitVideoViewController:AVCaptureVideoDataOutputSampleBufferDelegate{
    @objc func cameraBtnPressed(){
        if self.showCamera == false {
            self.showCamera = true
            self.resetCaptureOrientation()
            self.startCapture()
            if self.videoOrientation == .portrait || self.videoOrientation == .portraitUpsideDown {
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
            }else{
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
        }else{
            self.showCamera = false
            self.stopCapture()
            if self.videoOrientation == .portrait || self.videoOrientation == .portraitUpsideDown {
                UIView.animate(withDuration: 0.3) {
                    self.playerView.snp.remakeConstraints { make in
                        make.top.left.right.equalTo(self.view)
                        make.height.equalTo(kScreenHeight)
                    }
                    self.cameraView.snp.remakeConstraints { make in
                        make.left.right.bottom.equalTo(self.view)
                        make.height.equalTo(0)
                    }
                }
            }else{
                UIView.animate(withDuration: 0.3) {
                    self.playerView.snp.remakeConstraints { make in
                        make.top.left.right.equalTo(self.view)
                        make.height.equalTo(kScreenWidth)
                    }
                    self.cameraView.snp.remakeConstraints { make in
                        make.left.right.bottom.equalTo(self.view)
                        make.height.equalTo(0)
                    }
                }
            }
        }
    }
    //检测相机可用性
    func configCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            //获取提供数据的设备以及数据类型
            guard let videoDevice = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .front).devices.first else {
                return
            }
            self.captureSession.beginConfiguration()
            self.captureSession.sessionPreset = .vga640x480
            do{
                try self.captureSession.addInput(AVCaptureDeviceInput(device: videoDevice))
            }
            catch {
                print("error: \(error.localizedDescription)")
            }
            if captureSession.canAddOutput(videoDataOutput) {
                captureSession.addOutput(videoDataOutput)
                videoDataOutput.alwaysDiscardsLateVideoFrames = true
                videoDataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)]
                videoDataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
            } else {
                print("Could not add video data output to the session")
                captureSession.commitConfiguration()
                return
            }
             
            let captureConnection = videoDataOutput.connection(with: .video)
            captureConnection?.isEnabled = true
            self.configCaptureOrientation(captureConnection: captureConnection)
            captureConnection?.isVideoMirrored = true
            captureSession.commitConfiguration()
            
            self.videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            self.videoPreviewLayer.videoGravity = .resizeAspectFill
                    
//            videoPreviewLayer.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: self.standardView.height/2)
//            self.cameraView.layer.addSublayer(videoPreviewLayer)
        } else {
            print("不支持拍照")
        }
    }
    func startCapture() {
        self.concurrent.async {
            if !self.captureSession.isRunning {
                self.captureSession.startRunning()
            }
        }
    }
    func stopCapture() {
        self.concurrent.async {
            if self.captureSession.isRunning {
                self.captureSession.stopRunning()
            }
        }
    }
    func resetCaptureOrientation(){
        let captureConnection = videoDataOutput.connection(with: .video)
        captureConnection?.isEnabled = true
        self.configCaptureOrientation(captureConnection: captureConnection)
        captureConnection?.isVideoMirrored = true
        captureSession.commitConfiguration()
    }
    func configCaptureOrientation(captureConnection:AVCaptureConnection?){
        switch self.videoOrientation {
        case .portrait:
            captureConnection?.videoOrientation = .portrait
            break
        case .portraitUpsideDown:
            captureConnection?.videoOrientation = .portraitUpsideDown
            break
        case .landscapeLeft:
            captureConnection?.videoOrientation = .landscapeRight
            break
        case .landscapeRight:
            captureConnection?.videoOrientation = .landscapeLeft
            break
        default:
            break
        }
    }
//    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//
//    }
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        DispatchQueue.main.async {
            // 导出照片
            let image = self.imageConvert(sampleBuffer: sampleBuffer)
            self.cameraView.image = image
        }
    }

    /// CMSampleBufferRef=>UIImage
    func imageConvert(sampleBuffer:CMSampleBuffer?) -> UIImage? {
        guard sampleBuffer != nil && CMSampleBufferIsValid(sampleBuffer!) == true else { return nil }
        let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer!)
        let ciImage = CIImage(cvPixelBuffer: pixelBuffer!)
        return UIImage(ciImage: ciImage)
    }

}
extension SplitVideoViewController{
    @objc func receiverNotification(){
            let orient = UIDevice.current.orientation
        self.videoOrientation = orient
            switch orient {
            case .portrait :
                print("屏幕正常竖向")
                self.backBtn.isHidden = false
                self.orientationPortraitConfig()
                break
            case .portraitUpsideDown:
                self.backBtn.isHidden = true
                self.orientationPortraitConfig()
                print("屏幕倒立")
                break
            case .landscapeLeft:
                self.backBtn.isHidden = true
                self.orientationLandScapeConfig()
                print("屏幕左旋转")
                break
            case .landscapeRight:
                print("屏幕右旋转")
                self.backBtn.isHidden = true
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
            self.resetCaptureOrientation()
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
            self.resetCaptureOrientation()
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
