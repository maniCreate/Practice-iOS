//
//  ViewController.swift
//  sample_delegate
//
//  Created by Syunsuke Nakao on 2019/04/07.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit


//代理人クラス...Delegateメソッドを実行するクラス
class ViewController: UIViewController, TestDelegate {
    
    let testClass = TestClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //testClassのdelegateに自分自身=ViewControllerを指定
        testClass.delegate = self
        //依頼人クラスのメソッドを実行...実行する内容は下のデリゲートメソッドに書いている
        testClass.test()
    }
    
    //代理で実行するデリゲートメソッド...TestDelegateに書かれている実装必須のメソッド
    //TestClassのtest()メソッドが返すdelegate.test(string: String)の内容がこれ
    func test(string: String) {
        print(string)
    }
    
}

