
//
//  CameraManager.swift
//  sample_camera_avfoundation
//
//  Created by Syunsuke Nakao on 2019/04/04.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit
import AVFoundation

class CameraManager {
    
    private let cameraFrameView: UIView?
    
    init(view: UIView) {
        self.cameraFrameView = view
    }
    
    //①AVCaptureDeviceのセットアップ
    fileprivate var cameraDevice: AVCaptureDevice? = {
        //必要なデバイスを見つける為のセッションを作る（申請書みたいなもの） = 使いたいデバイスの設定 deviceType:どのデバイスを使うか mediaType:何のメディアか(video,audio) position:どれを使うか カメラ:front/back/どっちも
        let session = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)
        //※直接デフォルトのデバイスを指定したい場合は、AVCaptureDevice.defaultDevice()を使う！
        //let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        
        //セッションを使ってデバイスを探す
        let devices = session.devices
        //セッションにあったデバイスの中から、backCameraを見つけてcameraDeviceに返す
        for device in devices {
            if device.position == .back {
                return device
            }
        }
        return nil
    }()
    
    //③AVCaptureSessionのセットアップ
    private lazy var captureSession: AVCaptureSession = {
        //入力元のデバイスと出力先のファイルデータを結ぶAVCaptureSessionのインスタンスを作り、
        let session = AVCaptureSession()
        //出力データに写真を指定
        session.sessionPreset = .photo
        //AVCaptureDeviceInput/PhotoOutputをsessionに設定
        setUpInputOutput(session)
        //作ったsessionをcaptureSessioに格納
        return session
    }()
    
    //AVCaptureDeviceInput/PhotoOutputのセットアップ
    func setUpInputOutput(_ session: AVCaptureSession) {
        //ここで以下の「CaptureSessionを実行してDeviceに入力された画像（映像）をViewに出力する為の前準備」を行う
        //1.DeviceInputでデバイスからの入力データを受け取る
        //2.受け取ったDeviceInputをCaptureSession（photoOutputを作る為の合成場所みたいなもの）に入れる
        //3.photoOutputで入力データを写真ファイルとして出力するためのフォーマットを指定し、CaptureSessionに加える
        do {
            // 指定したデバイスを使用するために入力を初期化
            let captureDeviceInput = try AVCaptureDeviceInput(device: cameraDevice!)
            //デバイスからの入力をセッションに追加する
            session.addInput(captureDeviceInput)
            
            //④AVCaptureOutput...出力されたデータを受取→写真データとして整形→Viewに映し出す設定をするオブジェクト
            //出力データを受け取るオブジェクトを作る
            let captureDeviceOutput = AVCapturePhotoOutput()
            //出力データのフォーマットを指定
            captureDeviceOutput.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            session.addOutput(captureDeviceOutput)
        } catch {
            print(error)
        }
        
    }
    
    //⑤AVCaptureVideoPreviewLayerのセットアップ
    //...AVCaptureSessionから吐き出されたAVCapturePhotoOutputのデータを映し出すViewLayer
    private lazy var cameraPreviewLayer: AVCaptureVideoPreviewLayer = {
        //AVCapturePreviewLayerのインスタンスを作り、sessionにはcaptureSessionを指定
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        //表示領域を指定
        previewLayer.videoGravity = .resizeAspectFill
        //プレビューレイヤの向きを指定
        previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        previewLayer.frame = cameraFrameView!.frame
        //作ったインスタンスをcameraPreviewLayerに格納
        return previewLayer
    }()
    
    func cameraSetup() {
        //①AVCaptureDeviceのセットアップ = OK
        //②,④AVCaptureDeviceInput/Outputのセットアップ = OK
        //③AVCaptureSessionのセットアップ = OK
        
        //⑤プレビューレイヤのセットアップ
        cameraFrameView!.layer.insertSublayer(cameraPreviewLayer, at: 0)
        //セッション開始
        captureSession.startRunning()
    }
    
}
