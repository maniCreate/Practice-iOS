//
//  DecisionViewController.swift
//  Dream
//
//  Created by Syunsuke Nakao on 2018/05/30.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class DecisionViewController: UIViewController {
    @IBOutlet weak var dreamCheck: UILabel!
    @IBOutlet weak var deadlineCheck: UILabel!
    @IBOutlet weak var timeCheck: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dreamCheck.text = UserDefaults.standard.string(forKey: "dream")
        self.deadlineCheck.text = UserDefaults.standard.string(forKey: "deadline")
        self.timeCheck.text = UserDefaults.standard.string(forKey: "time")! + "から始める"
        

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
