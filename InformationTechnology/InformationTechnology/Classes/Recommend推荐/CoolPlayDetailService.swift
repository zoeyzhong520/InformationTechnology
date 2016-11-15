//
//  CoolPlayDetailService.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/15.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class CoolPlayDetailService: NSObject {

    class func handleCellDetail(urlString:String?, onViewController vc:UIViewController) {
        
        //跳转到CoolPlay详情页面
        let ctrl = CoolPlayDetailViewController()
        ctrl.urlString = "http://www.tudou.com/programs/view/"+urlString!
        vc.navigationController?.pushViewController(ctrl, animated: true)
        
    }
}
