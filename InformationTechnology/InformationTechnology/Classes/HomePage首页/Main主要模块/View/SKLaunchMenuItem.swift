//
//  SKLaunchMenuItem.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class SKLaunchMenuItem: UICollectionViewCell {
    
    var titleLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel = UILabel(frame: CGRectMake(0, 0, kScreenWidth/5, 30))
        titleLabel.backgroundColor = UIColor.groupTableViewBackgroundColor()
        titleLabel.font = UIFont.systemFontOfSize(14)
        titleLabel.textAlignment = .Center
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 0.2
        self.contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
