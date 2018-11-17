//
//  saveViewController.swift
//  Timeless
//
//  Created by Syunsuke Nakao on 2018/08/16.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit


class saveViewController: UIViewController {

    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var alphaView: UIView!
    
    var photoList3 = Array<UIImage>()
    var photoList = Array<AnyObject>()
    
    @IBAction func saveData(_ sender: AnyObject) {
        
        for i in 0..<photoList3.count {
            
            let imageData = UIImageJPEGRepresentation(photoList3[i], 1)
            photoList.append(imageData! as AnyObject)
            
        }
        
        var count: Int = UserDefaults.standard.integer(forKey: "count")
        count += 1
        UserDefaults.standard.set(photoList, forKey: "\(count)")
        UserDefaults.standard.set(count, forKey: "count")
        UserDefaults.standard.synchronize()
        
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        alphaView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        
        firstImage.image = photoList3[0] as! UIImage

        // Do any additional setup after loading the view.
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
