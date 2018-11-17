//
//  UnderLinerTextField.swift
//  Dream
//
//  Created by Syunsuke Nakao on 2018/05/27.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class UnderLinerTextField: UITextField {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let border = CALayer()
        border.frame = CGRect(x:0, y: self.frame.height - 1.0, width: self.frame.width, height: 1.0)
        border.backgroundColor = UIColor.gray.cgColor
        self.layer.addSublayer(border)
    }

}
