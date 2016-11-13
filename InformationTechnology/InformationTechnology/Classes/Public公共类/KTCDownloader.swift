//
//  KTCDownloader.swift
//  TestKitchen
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire

protocol KTCDownloaderProtocol:NSObjectProtocol {
    
    //下载失败
    func downloader(downloader:KTCDownloader, didFailWithError error:NSError)
    //下载成功
    func downloader(downloader:KTCDownloader, didFinishWithData data:NSData?)
}

enum KTCDownloadType:Int {
    case Normal = 0
    case RecommendScience //推荐页的科技
    case RecommendFun  //推荐页的Fun
    case CollectionCoolPlay  //精选页的酷玩
    case CollectionDiscover //精选页的发现
    case Recommend3//待定。。。
}

class KTCDownloader: NSObject {
    
    weak var delegate:KTCDownloaderProtocol?
    
    //下载类型
    var downloadType:KTCDownloadType = .Normal
    
    //.GET请求数据
    func postWithUrl(urlString:String) {
        
        Alamofire.request(.POST, urlString, parameters: nil, encoding: ParameterEncoding.URL, headers: nil).responseData { (response) in
            switch response.result {
            case .Failure(let error):
                //出错了
                self.delegate?.downloader(self, didFailWithError: error)
            case .Success:
                //下载成功
                self.delegate?.downloader(self, didFinishWithData: response.data)
            }
        }
    }
}












