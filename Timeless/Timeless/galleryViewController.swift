//
//  galleryViewController.swift
//  Timeless
//
//  Created by Syunsuke Nakao on 2018/09/02.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit


class galleryViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var datas:[[UIImage]] = []
    
    var photoList4 = Array<UIImage>()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        datas = []

        
        let count = UserDefaults.standard.integer(forKey: "count")
        if count == 0 {
            
        }
        else if count == 1 {
            var slide = Array<UIImage>()
            let slideData = UserDefaults.standard.array(forKey: "1") as! Array<Data>
            
            for i in 0..<slideData.count {
                
                let image = slideData[i] as Data
                let imageData = UIImage(data: image)
                slide.append(imageData!)
            }
            datas.append(slide)
            
        } else {
            for i in 1...count {
                var slide = Array<UIImage>()
                let slideData = UserDefaults.standard.array(forKey: "\(i)") as! Array<Data>
                
                for a in 0..<slideData.count {
                    
                    let image = slideData[a] as Data
                    let imageData = UIImage(data: image)
                    slide.append(imageData!)
                    
                }
                datas.append(slide)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alphaView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        scrollView.backgroundColor = UIColor.clear
        collectionView.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let slideCell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        
        let imageView = slideCell.contentView.viewWithTag(1) as! UIImageView
        
        let cellImage = datas[indexPath.item][0]
        imageView.image = cellImage
        
        return slideCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // section数は１つ
        return 1
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
