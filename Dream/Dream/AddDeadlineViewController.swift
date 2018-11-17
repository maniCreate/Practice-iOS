//
//  AddDeadlineViewController.swift
//  Dream
//
//  Created by Syunsuke Nakao on 2018/05/27.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class AddDeadlineViewController: UIViewController {
    @IBOutlet weak var DreamDeadlineField: UITextField!
    @IBOutlet weak var deadlinePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addDeadline(_ sender: Any) {
        //現在の日付を取得
        let date = deadlinePicker.date
        
        //日付のフォーマットを指定する。
        let format = DateFormatter()
        format.dateFormat = "yyyy年MM月dd日"
        
        //日付をStringに変換する
        let sDate = format.string(from: date)
        
        let value = sDate
        UserDefaults.standard.setValue(value, forKey: "deadline")
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
