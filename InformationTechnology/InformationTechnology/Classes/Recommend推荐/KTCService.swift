//
//  KTCService.swift
//  TestKitchen
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

//Factory
class KTCService: NSObject {

    class func handleEvent(urlString:String, onViewController vc:UIViewController) {
        
        if urlString.characters.count == 65 {
            
            //头部广告详情
            RecommendAdService.handleAdSlide(urlString, onViewController: vc)
            
        }else{
            
            //cell详情
            RecommendCellDetailService.handleCellDetail(urlString, onViewController: vc)
        }
    }
}









