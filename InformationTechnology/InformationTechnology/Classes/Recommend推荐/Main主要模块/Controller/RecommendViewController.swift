//
//  RecommendViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh

class RecommendViewController: UIViewController {
    
    //定义数据刷新页码
    var currentPage = 1
    
    //滚动视图
    private var scrollView:UIScrollView?
    
    //资讯视图
    private var scienceView:RecommendView?
    
    //时尚视图
    private var funView:RecommendView?
    
    //导航上面的选择控件
    private var segCtrl: KTCSegCtrl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        //滚动视图或者其子视图放在导航下面，会自动加一个上面的间距,我们要取消这个间距
        automaticallyAdjustsScrollViewInsets = false
        
        //下载推荐页的数据
        downloadRecommendData()
        
        //导航
        createNav()
        
        //创建首页视图
        createHomePage()
    }
    
    //下载推荐页的数据
    func downloadRecommendData() {
        
        //下载科技界面的数据
        downloadRecommendScience()
        
        //下载Fun界面的数据
        downloadRecommendFun()
    }
    
    //下载科技界面的数据
    func downloadRecommendScience() {
        
        let aurlLimitList = String(format: scienceUrl, currentPage)
        
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.downloadType = .RecommendScience
        downloader.postWithUrl(aurlLimitList)
    }
    
    //下载Fun界面的数据
    func downloadRecommendFun() {
        
        let aurlLimitList = String(format: funUrl, currentPage)
        
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.downloadType = .RecommendFun
        downloader.postWithUrl(aurlLimitList)
    }
    
    //创建首页视图
    func createHomePage() {
        
        scrollView = UIScrollView()
        scrollView!.pagingEnabled = true
        //设置代理
        scrollView?.delegate = self
        
        view.addSubview(scrollView!)
        
        //约束
        scrollView!.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        }
        
        //容器视图
        let containerView = UIView.createView()
        scrollView!.addSubview(containerView)
        containerView.snp_makeConstraints { (make) in
            make.edges.equalTo(scrollView!)
            make.height.equalTo(scrollView!)
        }
        
        //添加子视图
        //1.科技视图
        scienceView = RecommendView()
        containerView.addSubview(scienceView!)
        scienceView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.left.equalTo(containerView)
            make.width.equalTo(screenW)
        })
        
        //2.Fun视图
        funView = RecommendView()
        containerView.addSubview(funView!)
        funView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.equalTo(containerView)
            make.width.equalTo(screenW)
            make.left.equalTo((scienceView?.snp_right)!)
        })
        
        //修改容器视图的大小
        containerView.snp_makeConstraints { (make) in
            make.right.equalTo(funView!)
        }
        
    }
    
    //创建导航
    func createNav() {
        
        //选择控件
        let frame = CGRectMake(80, 0, screenW-80*2, 44)
        segCtrl = KTCSegCtrl(frame: frame, titleArray: ["科技","FUN"])
        segCtrl!.delegate = self
        navigationItem.titleView = segCtrl
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK:KTCSegCtrl代理方法
extension RecommendViewController:KTCSegCtrlDelegate {
    
    func segCtrl(segCtrl: KTCSegCtrl, didClickBtnAtIndex index: Int) {
        scrollView?.setContentOffset(CGPointMake(CGFloat(index)*screenW, 0), animated: true)
    }
}

//MARK:UIScrollView代理方法
extension RecommendViewController:UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x/scrollView.bounds.width
        segCtrl?.selectIndex = Int(index)
        
    }
    
}

//MARK:KTCDownloader的代理方法
extension RecommendViewController:KTCDownloaderProtocol {
    
    //下载失败
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    //下载成功
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
        if downloader.downloadType == .RecommendScience {
            
            if let tmpData = data {
                //1.json解析
                let scienceModel = RecommendModel.parseData(tmpData)
                
                //2.显示UI
                //2.1 头部滚动视图
                scienceView?.adModel = scienceModel.RecommendValue1
                //2.2 Cell视图
                scienceView?.model = scienceModel.RecommendValue0
                
                //3.点击科技页面的某一个部分，跳转到后面的界面
                self.scienceView?.jumpClosure = {  jumpUrl in
                   
                    KTCService.handleEvent(jumpUrl, onViewController: self)
                }
                
            }
            
        }else if downloader.downloadType == .RecommendFun {
            
            if let tmpData = data {
                //1.json解析
                let funModel = RecommendModel.parseData(tmpData)
                
                //2.显示UI
                //2.1 头部滚动视图
                funView?.adModel = funModel.RecommendValue1
                //2.2 Cell视图
                funView?.model = funModel.RecommendValue0
                
                //3.点击科技页面的某一个部分，跳转到后面的界面
                self.funView?.jumpClosure = {  jumpUrl in
                    
                    KTCService.handleEvent(jumpUrl, onViewController: self)
                }
                
            }
            
        }
        
    }
}



