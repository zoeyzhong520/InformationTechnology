//
//  HeaderReusableView.swift
//  InformationTechnology
//
//  Created by zzj on 16/11/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    var headerLabel:UILabel?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        headerLabel = UILabel()
        headerLabel?.font = UIFont.systemFontOfSize(20)
        headerLabel?.textAlignment = .Left
        //headerLabel?.textColor = UIColor.whiteColor()
        addSubview(headerLabel!)
        headerLabel?.snp_makeConstraints(closure: { (make) in
            make.top.right.bottom.equalTo(self)
            make.left.equalTo(self).inset(5)
        })
        //self.backgroundColor = UIColor.orangeColor()
        //self.alpha = 0.6
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
