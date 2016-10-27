//
//  NewestModel.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class NewestModel: NSObject {

    //界面数据model
    var title:String?
    var url:String?
    var postdate:String?
    var image:String?
    var description1:String?
    
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "description" {
            description1 = value as? String
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}











