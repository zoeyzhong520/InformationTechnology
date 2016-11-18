//
//  HomepageViewController.swift
//  SKScNavBarController
//
//  Created by lanouhn on 15/10/31.
//  Copyright © 2015年 Sue. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController,navigationBarProtocol {

    
    /*
     注意：
     1.将需要添加的controller放在一个数组中。然后通过初始化方法给SKScNavViewController
     2.addParentController(:UIViewController)添加父视图控制器
     3.需要修改的配置看SKScNavViewController文件中标注的属性
     4.修改高度或者宽度，参照SKMacros中标注的属性
     */
    
    
    var v1 = HomePageTableView()
    var v2 = HomePageTableView()
    var v3 = HomePageTableView()
    var v4 = HomePageTableView()
    var v5 = HomePageTableView()
    var v6 = HomePageTableView()
    var v7 = HomePageTableView()
    var v8 = HomePageTableView()
    var v9 = HomePageTableView()
    var v10 = HomePageTableView()
    var v11 = HomePageTableView()
    var v12 = HomePageTableView()
    var v13 = HomePageTableView()
    var v14 = HomePageTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        addTitle("科技之窗")
        
        //更新界面数据接口，并reloadData()
        v1.title = "最新"
        v1.headerUrlString = newestHeaderUrl
        v1.UrlString = newestUrl
        v1.tableView.reloadData()
        
        v2.title = "手机"
        v2.UrlString = mobileUrl
        v2.tableView.reloadData()
        
        v3.title = "VR"
        v3.UrlString = vrUrl
        v3.tableView.reloadData()
        
        v4.title = "Windows"
        v4.headerUrlString = winHeaderUrl
        v4.UrlString = winUrl
        v4.tableView.reloadData()
        
        v5.title = "苹果"
        v5.headerUrlString = appleHeaderUrl
        v5.UrlString = appleUrl
        
        v6.title = "智能汽车"
        v6.UrlString = autoCarUrl
        
        v7.title = "安卓"
        v7.headerUrlString = androidHeaderUrl
        v7.UrlString = androidUrl
    
        v8.title = "游戏电竞"
        v8.UrlString = gameUrl
        
        v9.title = "电脑"
        v9.UrlString = pcUrl
        
        v10.title = "数码"
        v10.UrlString = digiUrl
        
        v11.title = "行业前沿"
        v11.UrlString = industryUrl
        
        v12.title = "评测室"
        v12.UrlString = labsUrl
        
        v13.title = "科普"
        v13.UrlString = discoveryUrl
        
        v14.title = "网络焦点"
        v14.UrlString = internetUrl
        
        let skScNavC = SKScNavViewController(subViewControllers: [v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14])
        skScNavC.addParentController(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

