//
//  AddReasonViewController.swift
//  Dream
//
//  Created by Syunsuke Nakao on 2018/05/27.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class AddReasonViewController: UIViewController {
    @IBOutlet weak var addReasonTextField: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addReason(_ sender: Any) {
        //現在の日付を取得
        let time = timePicker.date
        
        //日付のフォーマットを指定する。
        let format = DateFormatter()
        format.dateFormat = "HH時mm分"
        
        //日付をStringに変換する
        let sTime = format.string(from: time)
        
        let value = sTime
        UserDefaults.standard.setValue(value, forKey: "time")
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
