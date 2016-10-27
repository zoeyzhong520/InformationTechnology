//
//  HeaderScrollViewCell.swift
//  CustomCell-XIB
//
//  Created by 沈家林 on 16/9/14.
//  Copyright © 2016年 沈家林. All rights reserved.
//

import UIKit

class HeaderScrollViewCell: UITableViewCell {
    var jlScrollView:HeaderScrollView!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        jlScrollView=HeaderScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 200))
        contentView.addSubview(jlScrollView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
