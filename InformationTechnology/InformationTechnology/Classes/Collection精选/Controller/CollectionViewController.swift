//
//  CollectionViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire

class CollectionViewController: UIViewController {
    
    //定义数据刷新页码
    var currentPage = 1
    
    //精选视图
    private var colView:CollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //下载数据
        downloadData()
        
        //创建视图
        createView()
    }
    
    //创建视图
    func createView() {
        
        automaticallyAdjustsScrollViewInsets = false
        colView = CollectionView(frame: CGRectZero)
        view.addSubview(colView!)
        
        colView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
    }
    
    //下载数据
    func downloadData() {
        
        let aurlLimitList = String(format: collectUrl, currentPage)
        
        Alamofire.request(.GET, aurlLimitList, parameters: nil, encoding: ParameterEncoding.URL, headers: nil).responseData {(response) in
            
            if let tmpData = response.data {
                let model = CollectionModel.parseData(tmpData)
                
//                let str = NSString(data: tmpData, encoding: NSUTF8StringEncoding)
//                print(str!)
                
                //json解析
                self.colView?.model = model
                
                //点击事件
                self.colView?.jumpClosure = {
                    mediaUrl in
                    print(mediaUrl)
                    let vc = DetailViewController()
                    vc.urlString = mediaUrl
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}













