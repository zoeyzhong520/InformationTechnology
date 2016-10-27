//
//  HomePageViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    //添加首页顶部滑动菜单视图
    var vc1 = NewestViewController()
    var vc2 = UIViewController()
    var vc3 = UIViewController()
    var vc4 = UIViewController()
    var vc5 = UIViewController()
    var vc6 = UIViewController()
    var vc7 = UIViewController()
    var vc8 = UIViewController()
    var vc9 = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vc1.title = "最新"
        vc1.view.backgroundColor = UIColor.whiteColor()
        vc2.title = "排行"
        vc2.view.backgroundColor = UIColor.blueColor()
        vc3.title = "苹果"
        vc3.view.backgroundColor = UIColor.greenColor()
        vc4.title = "手机"
        vc4.view.backgroundColor = UIColor.yellowColor()
        vc5.title = "数码"
        vc5.view.backgroundColor = UIColor.cyanColor()
        vc6.title = "评测室"
        vc6.view.backgroundColor = UIColor.grayColor()
        vc7.title = "VR"
        vc7.view.backgroundColor = UIColor.purpleColor()
        vc8.title = "智能汽车"
        vc8.view.backgroundColor = UIColor.grayColor()
        vc9.title = "电脑"
        vc9.view.backgroundColor = UIColor.purpleColor()
        
        let scNavVC = NavViewController(subViewControllers: [vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8,vc9])
        scNavVC.addParentController(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
