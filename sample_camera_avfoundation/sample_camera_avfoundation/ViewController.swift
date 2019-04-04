//
//  ViewController.swift
//  sample_camera_avfoundation
//
//  Created by Syunsuke Nakao on 2019/04/04.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var cameraManager: CameraManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //CameraManagerを初期化＋カメラの画面領域を指定
        cameraManager = CameraManager(view: self.view)
        //カメラを起動
        cameraManager.cameraSetup()
        
    }


}

