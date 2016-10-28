//
//  NewestCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/27.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class NewestCell: UITableViewCell {

    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var DescImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
