//
//  AddDreamViewController.swift
//  Dream
//
//  Created by Syunsuke Nakao on 2018/05/27.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class AddDreamViewController: UIViewController {
    
    @IBOutlet weak var dreamTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dreamTextField.placeholder = "叶えたい夢";
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addDream(_ sender: Any) {
        let value = dreamTextField.text!
        UserDefaults.standard.setValue(value, forKey: "dream")
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
