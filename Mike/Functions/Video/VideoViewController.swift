//
//  VideoViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/4/28.
//

import UIKit
import AVKit
enum VideoPlayType {
    case stop
    case pause
    case play
    case end
}
class VideoViewController: UIViewController {
    //model for before controller
    var videoModel:UserCenterContent!
    //standardView
    @IBOutlet weak var standardView: UIImageView!
    //split video and cameraView
    @IBOutlet weak var playerView:UIImageView!
    @IBOutlet weak var cameraView: UIImageView!
    //split video and camera height layoutconstraint
    @IBOutlet weak var videoHeightRatio:NSLayoutConstraint!
    @IBOutlet weak var cameraHeightRatio:NSLayoutConstraint!
    @IBOutlet weak var controlViewLeftMargin:NSLayoutConstraint!
    //back btn for poping
    @IBOutlet weak var backBtn:UIButton!
    //control view
    @IBOutlet weak var controlArea:UIView!
    @IBOutlet weak var playBtn:UIButton!
    @IBOutlet weak var segmentTitle:UILabel!
    @IBOutlet weak var segmentTime:UILabel!
    //video state
    var videoState:VideoPlayType = .stop
    lazy var segList:Array<UserContentSegmentListModel> = {
        var segList:Array<UserContentSegmentListModel> = Array<UserContentSegmentListModel>()
        return segList
    }()
    lazy var segTimeList:Array<Int> = {
        var segTimeList:Array<Int> = Array<Int>()
        return segTimeList
    }()
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
    //cameraLayer relation property
    private let captureSession = AVCaptureSession()
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer! = nil
    private let videoDataOutput = AVCaptureVideoDataOutput()
    private let videoDataOutputQueue = DispatchQueue(label: "VideoDataOutput", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    private var videoFrameSize: CGSize = .zero
    //is loaded
    var isLoaded:Bool = false
    //show camera
    var showCamera:Bool = false
    
//    var player:AVPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        //关闭数据流
        self.captureSession.stopRunning()
        let rotation : UIInterfaceOrientationMask = [.portrait]
        kAppdelegate?.blockRotation = rotation
    }
    func configData(){
        let segList:NSArray = JSONUtils.getArrayFromJSONString(jsonString: self.videoModel.segments ?? "")
        print("\(segList)");
        for segItem in segList {
            if let segDic = segItem as? NSDictionary {
                let model = UserContentSegmentListModel(fromDictionary: segDic as? [String : Any] ?? [:])
                self.segList.append(model)
                var finalTime:Int = 0
                let timeArr = model.timestamp.components(separatedBy: ":")
                if timeArr.count > 1 {
                    finalTime += (Int(timeArr[0]) ?? 0)*60
                    finalTime += Int(timeArr[1]) ?? 0
                }else{
                    finalTime += Int(timeArr[0]) ?? 0
                }
                self.segTimeList.append(finalTime)
            }
        }
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\(self.segTimeList)");
    }
    func configVideoView(){
        self.controlArea.layer.cornerRadius = 10
        self.controlArea.clipsToBounds = true
        self.videoHeightRatio.constant = self.standardView.width
        self.cameraHeightRatio.constant = 0
        self.playBtn.layer.cornerRadius = 10
        self.player.playerDidToEnd = { asset in
            self.playerManager.pause()
            self.playBtn.isSelected = false
            self.videoState = .end
            self.handlePlayBtn(byState: self.videoState)
        }
        self.player.playerPlayTimeChanged = { asset,curTime,duration in
            self.handleSegmentTime(currentTime: curTime)
        }
        self.playerManager.assetURL = NSURL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")! as URL
        self.videoState = .play
        self.handlePlayBtn(byState: self.videoState)
        self.playerManager.play()
//        self.playerManager.assetURL = NSURL(string: String(format: "%@%@", kVideoHostUrl,(self.videoModel.contentName ?? "").replacingOccurrences(of: "MOV", with: "m3u8")))! as URL
    }
    @IBAction func backBtnPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func playBtnPressed(){
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
    @IBAction func cameraBtnPressed(){
        if self.showCamera == false {
            self.showCamera = true
            self.startCapture()
            let rotation : UIInterfaceOrientationMask = [.landscapeLeft]
            kAppdelegate?.blockRotation = rotation
            UIView.animate(withDuration: 0.3) {
                self.controlViewLeftMargin.constant = self.standardView.width/2 + 28
                self.videoHeightRatio.constant = self.standardView.width/2
                self.cameraHeightRatio.constant = self.standardView.width/2
            }
        }else{
            self.showCamera = false
            self.stopCapture()
            let rotation : UIInterfaceOrientationMask = [.portrait]
            kAppdelegate?.blockRotation = rotation
            UIView.animate(withDuration: 0.3) {
                self.controlViewLeftMargin.constant = 28
                self.videoHeightRatio.constant = self.standardView.width
                self.cameraHeightRatio.constant = 0
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
extension VideoViewController:AVCaptureVideoDataOutputSampleBufferDelegate{
    
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
            captureConnection?.videoOrientation = .landscapeLeft
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
        if !captureSession.isRunning {
            captureSession.startRunning()
        }
    }
    func stopCapture() {
        if captureSession.isRunning {
            captureSession.stopRunning()
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
extension VideoViewController{
   func handlePlayBtn(byState:VideoPlayType){
        switch byState {
        case .stop:
            self.playBtn.setImage(UIImage(named: "icon-play"), for: .normal)
            break
        case .pause:
            self.playBtn.setImage(UIImage(named: "icon-play"), for: .normal)
            break
        case .end:
            self.playBtn.setImage(UIImage(named: "icon-replay"), for: .normal)
            break
        case .play:
            self.playBtn.setImage(UIImage(named: "icon-pause"), for: .normal)
            break
        }
    }
    func handleSegmentTime(currentTime:TimeInterval){
        if self.segList.count > 0 {
            var selectIndex = 0
            for i in 0 ..< self.segTimeList.count {
                let segTime:Int = self.segTimeList[i]
                if currentTime > Double(segTime) && i < self.segTimeList.count - 1 {
                    continue
                }else{
                    selectIndex = i
                    break
                }
            }
            let model:UserContentSegmentListModel = self.segList[selectIndex]
            self.segmentTitle.text = "\(model.name ?? "")"
            self.segmentTime.text = "\(model.timestamp ?? "")"
        }else{
            self.segmentTitle.text = "No Segments"
            self.segmentTime.text = ""
        }
    }
}
