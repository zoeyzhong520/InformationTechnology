//
//  AdDetailViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire

class AdDetailViewController: KTCTabViewController {
    
    //定义数据刷新页码
    var currentPage = 1
    
    //广告数据接口
    var adUrlString:String?
    
    //广告详情视图
    var adDetailView:AdDetailView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        //下载广告详情页面的数据
        downloadData()
        
        //创建视图
        createAdView()
    }
    
    //创建广告详情视图
    func createAdView() {
        
        //滚动视图或者其子视图放在导航下面，会自动加一个上面的间距,我们要取消这个间距
        automaticallyAdjustsScrollViewInsets = false
        
        //广告详情页
        adDetailView = AdDetailView(frame: CGRectZero)
        view.addSubview(adDetailView!)
        adDetailView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
    }
    
    //下载广告详情页面的数据
    func downloadData() {
        
        let aurlLimitList = String(format: adUrlString!, currentPage)
        
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.postWithUrl(aurlLimitList)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:KTCDownloader的代理方法
extension AdDetailViewController:KTCDownloaderProtocol {
    
    //下载失败
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    //下载成功
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
        if let tmpData = data {
            let model = AdDetailModel.parseData(tmpData)
            
            //json解析
            self.adDetailView?.model = model
        }
    }
    
}








