//
//  RecommendCellDetailService.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/10.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class RecommendCellDetailService: NSObject {

    class func handleCellDetail(cellUrlString:String?, onViewController vc:UIViewController) {
        
        //跳转到cell详情页面
        let ctrl = CellDetailViewController()
        ctrl.cellUrlString = cellUrlString
        vc.navigationController?.pushViewController(ctrl, animated: true)
    }
}
