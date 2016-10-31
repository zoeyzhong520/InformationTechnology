//
//  navigationBarProtocol.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit

enum BarButtonPosition {
    case left
    case right
}

protocol navigationBarProtocol:NSObjectProtocol {
    func addTitle(title:String)
    func addButton(title:String?,imageName:String?,position:BarButtonPosition?,selector:Selector)
}

extension navigationBarProtocol where Self:UIViewController {
    func addTitle(title:String) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), forBarMetrics: .Default)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        label.textAlignment = .Center
        label.text = title
        navigationItem.titleView = label
    }
    
    func addButton(title: String?=nil,imageName:String?=nil,position:BarButtonPosition?=nil,selector:Selector) {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        if title != nil {
            button.setTitle(title, forState: .Normal)
        }
        if imageName != nil {
            button.setBackgroundImage(UIImage(named: imageName!), forState: .Normal)
        }
        button.addTarget(self, action: selector, forControlEvents: .TouchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        if position == .left {
            if navigationItem.leftBarButtonItems != nil {
                navigationItem.leftBarButtonItems = navigationItem.leftBarButtonItems!+[barButtonItem]
            }else{
                navigationItem.leftBarButtonItems = [barButtonItem]
            }
        }else{
            if navigationItem.rightBarButtonItems != nil {
                navigationItem.rightBarButtonItems = navigationItem.rightBarButtonItems!+[barButtonItem]
            }else{
                navigationItem.rightBarButtonItems = [barButtonItem]
            }
        }
    }
}