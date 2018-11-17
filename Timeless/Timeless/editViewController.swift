//
//  editViewController.swift
//  Timeless
//
//  Created by Syunsuke Nakao on 2018/08/15.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class editViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageScroll: UIScrollView!
    @IBOutlet weak var photoSwipeController: UIPageControl!
    @IBOutlet weak var editView:UIView!
    
    //各ページに表示する写真
    var photoList = [
        UIImage(named: "noImage.png")!,
        UIImage(named: "noImage.png")!,
        UIImage(named: "noImage.png")!,
        UIImage(named: "noImage.png")!,
        UIImage(named: "noImage.png")!,
        UIImage(named: "noImage.png")!,
        UIImage(named: "noImage.png")!,
        UIImage(named: "noImage.png")!,
        UIImage(named: "timeless.png")!]
    
    var pageNo = 0
    var currentViewPoint:CGFloat = 0
    
    //サブビューを作る
    lazy var subView = createContentsView(contentList: photoList)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //スクロールビューにサブビューを追加
        imageScroll.addSubview(subView)
        
        //スクロールビューの設定
        imageScroll.isPagingEnabled = true
        imageScroll.contentSize = subView.frame.size
        imageScroll.contentOffset = CGPoint(x: currentViewPoint, y: 0)
        
        //スクロールビューのデリゲートになる
        imageScroll.delegate = self
        
        //ページコントロールを設定する
        photoSwipeController.numberOfPages = photoList.count-1
        photoSwipeController.currentPage = pageNo
        
        self.imageScroll.bringSubview(toFront: editView)
        
        //ナビゲーションアイテムのタイトルに画像を設定する。
        self.navigationItem.titleView = UIImageView(image:UIImage(named:"header_logo.png"))
        
    }


    //スクロールビューに追加する、コンテンツビューを作る
    
    func createContentsView(contentList:Array<UIImage>) -> UIView {
        let contentView = UIView()
        
        let pageWidth = self.view.frame.width
        
        let pageViewRect = CGRect(x: 0, y: 0, width: pageWidth, height: 250)
        
        let photoSize = CGSize(width: 250, height: 250)
        
        contentView.frame = CGRect(x: 0, y: 0, width: pageWidth * 8, height: 250)
        
        for i in 0 ..< contentList.count-1 {
            
            let contentItem = contentList[i]
            
            let pageView = createPage(viewRect: pageViewRect, imageSize: photoSize, item: contentItem)
            
            let left = pageViewRect.width * CGFloat(i)
            let xy = CGPoint(x: left, y: 0)
            
            pageView.frame = CGRect(origin: xy, size: pageViewRect.size)
            
            contentView.addSubview(pageView)
        }
        return contentView
    }
    
    //１ページ分のビューを作る
    func createPage(viewRect:CGRect, imageSize:CGSize, item:UIImage) -> UIView {
        
        //ページを追加するコンテンツビューを作る
        let pageView = UIView(frame:viewRect)
        
        let photoView = UIImageView()
        let left = (pageView.frame.width - imageSize.width)/2
        
        photoView.frame = CGRect(x: left, y: 0, width: 250, height: 250)
        photoView.contentMode = .scaleAspectFill
        photoView.clipsToBounds = true
        photoView.image = item
        
        let center = pageView.frame.width/2
        let ButtonY = photoView.frame.height/2
        
        let cameraButton:UIButton = UIButton()
        cameraButton.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
        cameraButton.center = CGPoint(x: center - 50, y: ButtonY)
        let cameraImage = UIImage(named: "camera.png")
        cameraButton.setBackgroundImage(cameraImage, for: .normal)
        cameraButton.addTarget(self, action: #selector(editViewController.onTappedCameraButton(_:)), for: UIControlEvents.touchUpInside)
        
        let photoButton:UIButton = UIButton()
        photoButton.frame = CGRect(x: 0, y: 100, width: 50, height: 60)
        photoButton.center = CGPoint(x: center + 50, y: ButtonY)
        let photoImage = UIImage(named: "photo.png")
        photoButton.setBackgroundImage(photoImage, for: .normal)
        photoButton.addTarget(self, action: #selector(editViewController.onTappedPhotoButton(_:)), for: UIControlEvents.touchUpInside)
        
        pageView.addSubview(cameraButton)
        pageView.addSubview(photoButton)
        pageView.addSubview(photoView)
        
        pageView.bringSubview(toFront: cameraButton)
        pageView.bringSubview(toFront: photoButton)
        pageView.sendSubview(toBack: photoView)
        
        return pageView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNo = Int(imageScroll.contentOffset.x / imageScroll.frame.width)
        photoSwipeController.currentPage = pageNo
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reEdit (segue: UIStoryboardSegue){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func onTappedCameraButton(_ sender:UIButton) {
        presentPickerController(sourceType: .camera)
    }
    
    @objc func onTappedPhotoButton(_ sender:UIButton) {
        presentPickerController(sourceType: .photoLibrary)
    }
    
    func presentPickerController(sourceType: UIImagePickerControllerSourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    let photoContainer:UIImageView = UIImageView()
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)

        if Int(imageScroll.contentOffset.x / imageScroll.frame.width) == 0 {
            
            photoList[0] = info[UIImagePickerControllerOriginalImage] as! UIImage

        } else if Int(imageScroll.contentOffset.x / imageScroll.frame.width) == 1 {
            
            photoList[1] = info[UIImagePickerControllerOriginalImage] as! UIImage
            
        } else if Int(imageScroll.contentOffset.x / imageScroll.frame.width) == 2 {
            
            photoList[2] = info[UIImagePickerControllerOriginalImage] as! UIImage
            
        } else if Int(imageScroll.contentOffset.x / imageScroll.frame.width) == 3 {
            
            photoList[3] = info[UIImagePickerControllerOriginalImage] as! UIImage
            
        } else if Int(imageScroll.contentOffset.x / imageScroll.frame.width) == 4 {
            
            photoList[4] = info[UIImagePickerControllerOriginalImage] as! UIImage
            
        } else if Int(imageScroll.contentOffset.x / imageScroll.frame.width) == 5 {
            
            photoList[5] = info[UIImagePickerControllerOriginalImage] as! UIImage
            
        } else if Int(imageScroll.contentOffset.x / imageScroll.frame.width) == 6 {
            
            photoList[6] = info[UIImagePickerControllerOriginalImage] as! UIImage
            
        } else if Int(imageScroll.contentOffset.x / imageScroll.frame.width) == 7 {
            
            photoList[7] = info[UIImagePickerControllerOriginalImage] as! UIImage
            
        } else {
            
        }
        
        currentViewPoint = imageScroll.contentOffset.x
        subView = createContentsView(contentList: photoList)
        
        loadView()
        viewDidLoad()

    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "animation" {
        let animationviewController = segue.destination as! animationViewController
        animationviewController.photoList2 = photoList
        }
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
