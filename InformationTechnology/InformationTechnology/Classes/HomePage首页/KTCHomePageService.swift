//
//  KTCHomePageService.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/21.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class KTCHomePageService: NSObject {

    class func handleEvent(urlString:String, onViewController vc:UIViewController) {
        
        if urlString.hasPrefix("http://") {
            
            TopScrollViewService.handleAdSlide(urlString, onViewController: vc)
//            print(urlString)
        }else{
            
            let aurlLimitList = String(format: newestHeaderDetail, Int(urlString)!)
            TopScrollViewService.handleAdSlide(aurlLimitList, onViewController: vc)
        }
    }
}
