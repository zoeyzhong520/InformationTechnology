//
//  HeaderScrollViewCell.swift
//  InformationTechnology
//
//  Created by zzj on 16/10/27.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class HeaderScrollViewCell: UITableViewCell {
    var scrollView:HeaderScrollView!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        scrollView = HeaderScrollView(frame: CGRect(x: 0, y: 0, width: screenW, height: 200))
        contentView.addSubview(scrollView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
