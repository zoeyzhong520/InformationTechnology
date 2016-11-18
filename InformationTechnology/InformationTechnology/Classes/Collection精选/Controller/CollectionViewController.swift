//
//  CollectionViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh

class CollectionViewController: UIViewController {
    
    //定义数据刷新页码
    var currentPage = 1
    
    //精选的CoolPlay视图
    private var coolPlayView:CollectCoolPlayView?
    
    //精选的Discover视图
    private var discoverView:CollectionDiscoverView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        automaticallyAdjustsScrollViewInsets = false
        
        //下载界面的数据
        downloadCollectionData()
        
        //构造segment视图控制器
        configUI()
    }
    
    //添加上下拉刷新
    func addRefresh(header:(()->())?,footer:(()->())?) {
        
        if header != nil {
            
            self.coolPlayView?.collecView?.mj_header = MJRefreshNormalHeader(refreshingBlock: header)
            self.discoverView?.collecView?.mj_header = MJRefreshNormalHeader(refreshingBlock: header)
        }
        
        if footer != nil {
            
            self.coolPlayView?.collecView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: footer)
            self.discoverView?.collecView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: footer)
        }
    }
    
    //下载精选界面的数据
    func downloadCollectionData() {
        
        //下载discover页面数据
        downloadDiscoverData(collectDiscoverUrl)
        
        //下载CoolPlay页面的数据
        downloadCoolPlayData(collectPlayUrl)
    }
    
    //下载CoolPlay页面的数据
    func downloadCoolPlayData(urlString:String?) {
        
        createCoolPlayView()
        
        //let aurlLimitList = String(format: urlString!, currentPage)
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.downloadType = .CollectionCoolPlay
        downloader.postWithUrl(urlString!)
    }
    
    //下载Discover页面的数据
    func downloadDiscoverData(urlString:String?) {
        
        createDiscoverView()
        
        let aurlLimitList = String(format: urlString!, currentPage)
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.downloadType = .CollectionDiscover
        downloader.postWithUrl(aurlLimitList)
    }
    
    //构造segment视图控制器
    func configUI() {
        
        //先创建数组用于设置分段控件标题
        let viewArray = ["酷玩","发现"]
        
        //创建分段控件
        let segment = UISegmentedControl(items: viewArray)
        segment.frame = CGRectMake(0, 0, 100, 40)
        segment.setWidth(100, forSegmentAtIndex: 0)
        segment.setWidth(100, forSegmentAtIndex: 1)
        segment.tintColor = UIColor.redColor()
        segment.layer.masksToBounds = true
        segment.layer.cornerRadius = 5
        
        //默认选中下标为1的
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentChange(_:)), forControlEvents: .ValueChanged)
        navigationItem.titleView = segment
        
    }
    
    //segment点击事件
    func segmentChange(segment:UISegmentedControl) {
        
        //segemnet选择改变事件
        switch segment.selectedSegmentIndex {
        case 0:
            downloadCoolPlayData(collectPlayUrl)
            break
        case 1:
            downloadDiscoverData(collectDiscoverUrl)
            break
        default:
            return
        }
    }
    
    //创建CoolPlay视图
    func createCoolPlayView() {
        
        coolPlayView = CollectCoolPlayView(frame: CGRectZero)
        view.addSubview(coolPlayView!)
        
        coolPlayView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
    }
    
    //创建Discover视图
    func createDiscoverView() {
        
        discoverView = CollectionDiscoverView(frame: CGRectZero)
        view.addSubview(discoverView!)
        
        discoverView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:KTCDownloader的代理方法
extension CollectionViewController:KTCDownloaderProtocol {
    
    //下载失败
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    //下载成功
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
        if downloader.downloadType == .CollectionCoolPlay {
            
            if let tmpData = data {
                let model = CoolPlayModel.parseData(tmpData)
                
                //json解析
                self.coolPlayView?.model = model
                
                //点击事件
                self.coolPlayView?.jumpClosure = {
                    jumpUrl in
                    
                    CoolPlayDetailService.handleCellDetail(jumpUrl, onViewController: self)
                }
            }
            
        }else if downloader.downloadType == .CollectionDiscover {
            
            if let tmpData = data {
                let model = CollectionModel.parseData(tmpData)
                
                //json解析
                self.discoverView?.model = model
                
                //点击事件
                self.discoverView?.jumpClosure = {
                    mediaUrl in
                    
                    //播放video
                    playVideoService.playVideo(mediaUrl, onViewController: self)
                }
            }
        }
        
    }
}











