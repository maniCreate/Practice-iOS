//
//  TestClass.swift
//  sample_delegate
//
//  Created by Syunsuke Nakao on 2019/04/07.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

//依頼人クラス...TestDelegateに準拠しているクラスに処理をお願いする
class TestClass {
    
    //TestDelegateに準拠する代理人クラスを保持
    weak var delegate: TestDelegate?
    
    //代理人クラスの持つデリゲートメソッドを実行する
    func test() {
        delegate?.test(string: "testメソッドが実行された通知を受け取る")
    }
    
}
