//
//  RecommendAdService.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/10.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class RecommendAdService: NSObject {

    class func handleAdSlide(adUrlString:String?, onViewController vc:UIViewController) {
        
        //跳转到广告详情页面
        let ctrl = AdDetailViewController()
        ctrl.adUrlString = adUrlString
        ctrl.hidesBottomBarWhenPushed = true
        vc.navigationController?.pushViewController(ctrl, animated: true)
    }
}
