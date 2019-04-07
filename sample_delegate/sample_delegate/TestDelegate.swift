//
//  TestDelegate.swift
//  sample_delegate
//
//  Created by Syunsuke Nakao on 2019/04/07.
//  Copyright © 2019 Syunsuke Nakao. All rights reserved.
//

import UIKit

//代理人クラスに実装させる処理をまとめたプロトコル
protocol TestDelegate: class {
    func test(string: String)
}
