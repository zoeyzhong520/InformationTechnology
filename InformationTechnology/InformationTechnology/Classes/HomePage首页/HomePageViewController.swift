//
//  HomepageViewController.swift
//  SKScNavBarController
//
//  Created by lanouhn on 15/10/31.
//  Copyright © 2015年 Sue. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController {

    
    /*
     注意：
     1.将需要添加的controller放在一个数组中。然后通过初始化方法给SKScNavViewController
     2.addParentController(:UIViewController)添加父视图控制器
     3.需要修改的配置看SKScNavViewController文件中标注的属性
     4.修改高度或者宽度，参照SKMacros中标注的属性
     */
    
    
    var v1 = HomePageTableView()
    var v2 = UIViewController()
    var v3 = UIViewController()
    var v4 = UIViewController()
    var v5 = UIViewController()
    var v6 = UIViewController()
    var v7 = UIViewController()
    var v8 = UIViewController()
    var v9 = UIViewController()
    var v10 = UIViewController()
    var v11 = UIViewController()
    var v12 = UIViewController()
    var v13 = UIViewController()
    var v14 = UIViewController()
    var v15 = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        v1.title = "测试1"
        v1.view.backgroundColor = UIColor.cyanColor()
        v2.title = "测试2"
        v2.view.backgroundColor = UIColor.redColor()
        v3.title = "测试3"
        v3.view.backgroundColor = UIColor.grayColor()
        v4.title = "测试4"
        v4.view.backgroundColor = UIColor.yellowColor()
        v5.title = "测试5"
        v5.view.backgroundColor = UIColor.lightGrayColor()
        v6.title = "测试6"
        v6.view.backgroundColor = UIColor.lightTextColor()
        v7.title = "测试7"
        v7.view.backgroundColor = UIColor.blueColor()
        v8.title = "测试8"
        v8.view.backgroundColor = UIColor.greenColor()
        v9.title = "测试9"
        v9.view.backgroundColor = UIColor.cyanColor()
        v10.title = "测试10"
        v10.view.backgroundColor = UIColor.redColor()
        v11.title = "测试11"
        v11.view.backgroundColor = UIColor.grayColor()
        v12.title = "测试12"
        v12.view.backgroundColor = UIColor.yellowColor()
        v13.title = "测试13"
        v13.view.backgroundColor = UIColor.greenColor()
        v14.title = "测试14"
        v14.view.backgroundColor = UIColor.blueColor()
        v15.title = "测试15"
        v15.view.backgroundColor = UIColor.cyanColor()
        
        let skScNavC = SKScNavViewController(subViewControllers: [v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15])
        skScNavC.addParentController(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

