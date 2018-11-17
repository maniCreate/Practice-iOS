//
//  ViewController.swift
//  Timeless
//
//  Created by Syunsuke Nakao on 2018/08/15.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var borderUIView: UIView!
    @IBOutlet weak var editButton: UIImageView!
    @IBOutlet weak var galleryBtutton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.borderUIView.layer.borderColor = UIColor.white.cgColor
        self.borderUIView.layer.borderWidth = 2
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func reTop (segue: UIStoryboardSegue) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

