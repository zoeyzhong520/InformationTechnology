//
//  TopScrollViewService.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/21.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class TopScrollViewService: NSObject {

    class func handleAdSlide(urlString:String?, onViewController vc:UIViewController) {
        
        //跳转到TopScrollView详情页面
        let ctrl = DetailView()
        ctrl.url = NSURL(string: urlString!)
        ctrl.hidesBottomBarWhenPushed = true
        vc.navigationController?.pushViewController(ctrl, animated: true)
    }
}
