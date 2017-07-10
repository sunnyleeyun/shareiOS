//
//  MainSettingTableViewCell.swift
//  shareiOS
//
//  Created by Mac on 2017/7/10.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class MainSettingTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    
    @IBOutlet weak var imagreVW: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
