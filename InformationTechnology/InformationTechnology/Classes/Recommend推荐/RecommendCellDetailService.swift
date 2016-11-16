//
//  RecommendCellDetailService.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/10.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class RecommendCellDetailService: NSObject {

    class func handleCellDetail(urlString:String?, onViewController vc:UIViewController) {
        
        //跳转到cell详情页面
        let ctrl = CellDetailViewController()
        ctrl.urlString = urlString
        ctrl.hidesBottomBarWhenPushed = true
        vc.navigationController?.pushViewController(ctrl, animated: true)
    }
}
