//
//  animationViewController.swift
//  Timeless
//
//  Created by Syunsuke Nakao on 2018/08/31.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit
import AVFoundation

class animationViewController: UIViewController {

    @IBOutlet weak var slideView: UIView!
    
    var audioPlayer: AVAudioPlayer!
    var photoList2 = Array<UIImage>()
    
    let Delay = 2.0
    let MaxImageNameNumber = 8
    var imageNameNumber = 0

    lazy var firstImageView = UIImageView(image: photoList2[0])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Timer.scheduledTimer(
            timeInterval: 0.0,
            target: self,
            selector: #selector(start),
            userInfo: nil,
            repeats: false
        )
        
    }
    
    @objc func start() {
        
        let firstImageView = UIImageView(image: photoList2[0])
        
        setAudioPlayer(soundName: "timeless", type: "mp3")
        
        audioPlayer.play()
        
        firstImageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        firstImageView.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        firstImageView.contentMode = .scaleAspectFill
        firstImageView.clipsToBounds = true
        firstImageView.alpha = 0
        self.view.addSubview(firstImageView)
        
        
        UIView.animate(withDuration: 2.0,
                       delay: 0.0,
                       options: [.curveEaseOut],
                       animations: {
                        firstImageView.alpha = 1.0
        },
                       completion: {_ in
                        UIView.animate(withDuration: 2.0,
                                       delay: 1.0,
                                       options: UIViewAnimationOptions(),
                                       animations: {
                                        firstImageView.alpha = 0.0
                                        
                        },
                                       completion:{(finished: Bool) in
                                        firstImageView.removeFromSuperview()
                        })
                        self.repeatImageShow()
        })
    }
    
    func repeatImageShow() {
        imageNameNumber += 1
        
        if self.MaxImageNameNumber < self.imageNameNumber {
            segueToSave()
            imageNameNumber = 0
            return
        }
        
        let secondImageView = UIImageView(image: photoList2[imageNameNumber])
        secondImageView.contentMode = .scaleAspectFill
        secondImageView.clipsToBounds = true
        secondImageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        secondImageView.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        secondImageView.alpha = 0
        
        self.view.insertSubview(secondImageView, aboveSubview: firstImageView)
        
        UIView.animate(withDuration: 2.0,
                       delay: 1.0,
                       options: [.curveEaseOut],
                       animations: {
                        secondImageView.alpha = 1.0
        },
                       completion: {_ in
                        UIView.animate(withDuration: 2.0,
                                       delay: 1.0,
                                       options: UIViewAnimationOptions(),
                                       animations: {
                                        secondImageView.alpha = 0.0
                                        
                        },
                                       completion:{(finished: Bool) in
                                        secondImageView.removeFromSuperview()
                        })
                        self.repeatImageShow()
        })
        
    }
    
    func segueToSave() {
        self.performSegue(withIdentifier: "save", sender: self.photoList2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            let saveviewController = segue.destination as! saveViewController
            saveviewController.photoList3 = photoList2
        }
    }

    
    
    func setAudioPlayer(soundName: String, type: String) {
        
        let soundFilePath = Bundle.main.path(forResource: soundName, ofType: type)!
        let fileURL = URL(fileURLWithPath: soundFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        } catch {
            print("音楽ファイルが読み込めませんでした")
        }
        
    }
    
    @IBAction func replay(segue: UIStoryboardSegue) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
