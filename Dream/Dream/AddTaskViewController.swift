//
//  AddTaskViewController.swift
//  Dream
//
//  Created by Syunsuke Nakao on 2018/05/27.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var textFields: [UnderLinerTextField]!
    
    @IBOutlet weak var taskTextField: UnderLinerTextField!
    
    @IBOutlet weak var deadlineTextField:UnderLinerTextField!
    
    @IBOutlet weak var commentTextField: UnderLinerTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.taskTextField.placeholder = "タスク";
        self.deadlineTextField.placeholder = "期限";
        self.commentTextField.placeholder = "メモ";

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for i in textFields {
            i.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func saveTask(_ sender: Any) {
        let task = taskTextField.text
        let date = deadlineTextField.text
        let comment = commentTextField.text
        var count: Int = UserDefaults.standard.integer(forKey:"count")
        count += 1
        UserDefaults.standard.setValue(["task":task, "deadline":date, "comment":comment], forKey: "\(count)")
        UserDefaults.standard.set(count, forKey: "count")
        self.navigationController?.popViewController(animated: true)
        
        
        
        
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
