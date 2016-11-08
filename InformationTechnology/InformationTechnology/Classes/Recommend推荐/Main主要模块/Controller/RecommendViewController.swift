//
//  RecommendViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire

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
        
        //下载科技界面的数据
        downloadScienceData()
        
        //下载时尚界面的数据
        downloadFashionData()
        
        //导航
        createNav()
        
        //创建首页视图
        createHomePage()
    }
    
    //下载科技界面的数据
    func downloadScienceData() {
        
        let aurlLimitList = String(format: scienceUrl, currentPage)
        Alamofire.request(.GET, aurlLimitList, parameters: nil, encoding: ParameterEncoding.URL, headers: nil).responseData {(response) in
            
            if let tmpData = response.data {
                let model = RecommendModel.parseData(tmpData)
                
                //                let str = NSString(data: tmpData, encoding: NSUTF8StringEncoding)
                //                print(str!)
                
                //json解析
                self.scienceView?.model = model.RecommendValue0
                self.scienceView?.adModel = model.RecommendValue1
                
                //点击事件
                self.scienceView?.jumpClosure = {  jumpUrl in
                    print(jumpUrl)
                    
                    //跳转到详情页
                    if jumpUrl.characters.count == 65 {
                        let vc = AdDetailViewController()
                        vc.urlString = jumpUrl
                        self.navigationController?.pushViewController(vc, animated: true)
                    }else{
                        let vc = CellDetailViewController()
                        vc.urlString = jumpUrl
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }
    }
    
    //下载时尚界面的数据
    func downloadFashionData() {
        
        let aurlLimitList = String(format: funUrl, currentPage)
        Alamofire.request(.GET, aurlLimitList, parameters: nil, encoding: ParameterEncoding.URL, headers: nil).responseData {(response) in
            if let tmpData = response.data {
                let model = RecommendModel.parseData(tmpData)
                
                //json解析
                self.funView?.model = model.RecommendValue0
                self.funView?.adModel = model.RecommendValue1
                
                //点击事件
                self.funView?.jumpClosure = {  jumpUrl in
                    print(jumpUrl)
                    
                    //跳转到详情页
                    if jumpUrl.characters.count == 65 {
                        let vc = AdDetailViewController()
                        vc.urlString = jumpUrl
                        self.navigationController?.pushViewController(vc, animated: true)
                    }else{
                        let vc = CellDetailViewController()
                        vc.urlString = jumpUrl
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }
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
        
        //2.时尚视图
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





