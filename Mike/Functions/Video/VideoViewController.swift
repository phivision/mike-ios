//
//  VideoViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/4/28.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {
    var videoName:String?
    @IBOutlet weak var standardView: UIImageView!
    @IBOutlet weak var playerView:UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backBtn:UIButton!
    var videoModel:UserCenterContent!
//    var playVC:AVPlayerViewController!
//    var palyerItem:AVPlayerItem!
    var captureSession:AVCaptureSession = AVCaptureSession()
    lazy var playerManager:ZFAVPlayerManager = {
        var playerManager:ZFAVPlayerManager = ZFAVPlayerManager()
        playerManager.shouldAutoPlay = false
        return playerManager
    }()
    lazy var player:ZFPlayerController = {
        var player:ZFPlayerController = ZFPlayerController(playerManager: self.playerManager, containerView: self.playerView)
//        player.controlView = controlView
        player.pauseWhenAppResignActive = true
        return player
    }()
    lazy var controlView:ZFPlayerControlView = {
        var controlView:ZFPlayerControlView = ZFPlayerControlView()
        controlView.fastViewAnimated = true
        controlView.autoHiddenTimeInterval = 5
        controlView.autoFadeTimeInterval = 0.5
        controlView.prepareShowLoading = true
        controlView.prepareShowControlView = false
        controlView.fullScreenMode = .portrait
        return controlView
    }()
    @IBOutlet weak var videoHeightRatio:NSLayoutConstraint!
    @IBOutlet weak var cameraHeightRatio:NSLayoutConstraint!
    @IBOutlet weak var playBtn:UIButton!
    @IBOutlet weak var controlArea:UIView!
    var isLoaded:Bool = false
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
            self.cameraEnable()
            self.configVideoView()
            self.isLoaded = true
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.playerManager.stop()
    }
    func configVideoView(){
        self.controlArea.layer.cornerRadius = 10
        self.controlArea.clipsToBounds = true
        self.videoHeightRatio.constant = self.standardView.height
        self.cameraHeightRatio.constant = 0
        self.playBtn.layer.cornerRadius = 10
        self.player.orientationDidChanged = { player,isFullScreen in
            
        }
        self.player.playerDidToEnd = { asset in
            self.playerManager.pause()
            self.playBtn.isSelected = false
        }
        self.player.playerPlayTimeChanged = { asset,curTime,duration in
            
        }
        self.playerManager.assetURL = NSURL(string: String(format: "%@%@", kVideoHostUrl,(self.videoModel.contentName ?? "").replacingOccurrences(of: "MOV", with: "m3u8")))! as URL
    }
    @IBAction func backBtnPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func playBtnPressed(){
        if self.playerManager.isPlaying == true {
            self.playBtn.isSelected = false
            self.playerManager.pause()
        }else{
            self.playBtn.isSelected = true
            self.playerManager.play()
        }
    }
    @IBAction func cameraBtnPressed(){
        if self.showCamera == false {
            self.showCamera = true
            UIView.animate(withDuration: 0.3) {
                self.videoHeightRatio.constant = self.standardView.height/2
                self.cameraHeightRatio.constant = self.standardView.height/2
            }
        }else{
            self.showCamera = false
            UIView.animate(withDuration: 0.3) {
                self.videoHeightRatio.constant = self.standardView.height
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
    func cameraEnable() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            //获取提供数据的设备以及数据类型
//            let device = AVCaptureDevice.default(for: AVMediaType.video)
            let devices = AVCaptureDevice.devices()
            //1.1默认获取前置摄像头
            guard let device = devices.filter({$0.position == .front}).first else {
                 print("get front video AVCaptureDevice  failed!")
                return
            }
            //初始化 AVCaptureSession
            self.captureSession.sessionPreset = AVCaptureSession.Preset.photo
            do{
                try self.captureSession.addInput(AVCaptureDeviceInput(device: device))
            }
            catch {
                print("error: \(error.localizedDescription)")
            }
            
            
            //设置输出流
            let output = AVCaptureVideoDataOutput()
            let cameraQueue = DispatchQueue.init(label: "cameraQueue")
            //设置代理
            output.setSampleBufferDelegate(self, queue: cameraQueue)
            //视频流质量设置
            output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
            //添加到session
            self.captureSession.addOutput(output)
            
//            创建一个显示用的layer
            let previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
            previewLayer.videoGravity = AVLayerVideoGravity(rawValue: "AVLayerVideoGravityResizeAspect")
            previewLayer.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: self.standardView.height/2)
            self.imageView.layer.addSublayer(previewLayer)
            
            //启动数据流
            self.captureSession.startRunning()
            //关闭数据流
            //self.captureSession.startRunning()
        } else {
            print("不支持拍照")
        }
    }
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        DispatchQueue.main.async {
            // 导出照片
//            let image = self.imageConvert(sampleBuffer: sampleBuffer)
//            self.imageView.image = image
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
    
}
