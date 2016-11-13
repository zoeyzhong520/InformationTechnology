//
//  CollectionCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/7.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var playTimeLabel: UILabel!
    
    @IBOutlet weak var createDateLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
}
