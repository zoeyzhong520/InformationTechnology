//
//  RecommendTopicCellService.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/17.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class RecommendTopicCellService: NSObject {

    class func handleCellDetail(urlString:String?, onViewController vc:UIViewController) {
        
        //跳转到cell详情页面
        let ctrl = CoolPlayDetailViewController()
        ctrl.urlString = urlString
        ctrl.hidesBottomBarWhenPushed = true
        vc.navigationController?.pushViewController(ctrl, animated: true)
    }
}
