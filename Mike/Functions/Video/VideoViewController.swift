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
    @IBOutlet weak var playerView:ZZPlayerView!
    var playVC:AVPlayerViewController!
    var palyerItem:AVPlayerItem!
    var captureSession:AVCaptureSession = AVCaptureSession()
    @IBOutlet weak var imageView: UIImageView!
    var isLoaded:Bool = false
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
            self.addPlayerView()
            self.isLoaded = true
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
            
            //创建一个显示用的layer
//            let previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
//            previewLayer.videoGravity = AVLayerVideoGravity(rawValue: "AVLayerVideoGravityResizeAspect")
//            previewLayer.frame = self.imageView.bounds
//            self.imageView.layer.addSublayer(previewLayer)
            
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
            let image = self.imageConvert(sampleBuffer: sampleBuffer)
            self.imageView.image = image
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
    func addPlayerView(){
        //通知拿到播放结束的时间节点并且继续play
        NotificationCenter.default.addObserver(self, selector: #selector(goBackFinished), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
//
        
        self.palyerItem = AVPlayerItem(url: NSURL(string: String(format: "%@%@", kVideoHostUrl,(self.videoName ?? "").replacingOccurrences(of: "MOV", with: "m3u8")))! as URL)
        
        self.playVC = AVPlayerViewController()
        self.playVC.view.frame = CGRect(x: 0, y: 0, width: self.playerView.width, height: self.playerView.height)
        self.playVC.showsPlaybackControls = true
        self.playVC.player = AVPlayer.init(playerItem: self.palyerItem);
        self.playerView.addSubview(self.playVC.view)
        self.playerView.playerLayer?.videoGravity = .resizeAspectFill
        //创建ACplayer：负责视频播放
//        self.player = AVPlayer.init(playerItem: self.palyerItem)
//        self.player.rate = 1.0//播放速度 播放前设置
        //创建显示视频的图层
//        let playerLayer = AVPlayerLayer.init(player: self.player)
//        playerLayer.videoGravity = .resizeAspect
//        playerLayer.frame = self.view.bounds
//        self.playerView.playerLayer = playerLayer;
        //播放
        self.playVC.player?.play()
    }
    
    @objc func goBackFinished() {
        replay()
    }
    
    func replay() {
        self.playVC.player?.seek(to: CMTimeMake(value: 0, timescale: 1))
        self.playVC.player?.pause()
    }
}
