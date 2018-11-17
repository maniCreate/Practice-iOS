//
//  TableViewCell.swift
//  Dream
//
//  Created by Syunsuke Nakao on 2018/05/27.
//  Copyright © 2018年 Syunsuke Nakao. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskName: UILabel!
    
    @IBOutlet weak var taskDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
