//
//  TranslateAdTitleService.swift
//  InformationTechnology
//
//  Created by zzj on 16/11/18.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class TranslateAdTitleService: NSObject {

    class func handleTranslateTitle(title:String?, onViewController vc:UIViewController) {
        
        //传递title到详情页面
        let ctrl = AdDetailViewController()
        ctrl.title = title
        
        
    }
}
