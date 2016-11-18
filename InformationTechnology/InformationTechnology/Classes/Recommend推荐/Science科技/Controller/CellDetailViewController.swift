//
//  CellDetailViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire

class CellDetailViewController: UIViewController,navigationBarProtocol {
    
    //创建视图
    private var detailView:CellDetailView?
    
    //定义数据刷新页码
    private var currentPage = 1
    
    //cell数据接口
    var urlString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        //下载cell详情页面的数据
        downloadData()
        
        //创建视图
        configUI()
    }
    
    func leftBtnClick() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func configUI() {
        
        addTitle("推荐")
        
        //添加button
        //addButton(nil, imageName: "userdetails_back_unselected_night", position: .left, selector: #selector(leftBtnClick))
        
        automaticallyAdjustsScrollViewInsets = false
        detailView = CellDetailView(frame: CGRectZero)
        view.addSubview(detailView!)
        
        //约束
        detailView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 0, 0))
        })
    }
    
    //下载cell详情页面的数据
    func downloadData() {
        
        let aurlLimitList = String(format: urlString!, currentPage)
        
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
extension CellDetailViewController:KTCDownloaderProtocol {
    
    //下载失败
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    //下载成功
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
        if let tmpData = data {
            let model = CellDetailModel.parseData(tmpData)
            
            //json解析
            self.detailView?.model = model
        }
    }
    
}









