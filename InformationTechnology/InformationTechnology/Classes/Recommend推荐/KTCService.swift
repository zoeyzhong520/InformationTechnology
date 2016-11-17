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
            
        }else if urlString.characters.count == 121 {
            
            //cell详情
            RecommendCellDetailService.handleCellDetail(urlString, onViewController: vc)
            
        }else if urlString.characters.count == 87 {
            
            //cell详情
            RecommendTopicCellService.handleCellDetail(urlString, onViewController: vc)
        }
    }
}









