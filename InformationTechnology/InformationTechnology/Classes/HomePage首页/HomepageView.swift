//
//  HomepageView.swift
//  ChildViewController
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class HomepageView: UIViewController {
    
    var ChildVCS:[UIViewController] = []
    var currentVC:UIViewController?//记录当前视图控制器
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let width = self.view.frame.size.width/4
        for i in 1...4 {
            let btn = UIButton(frame: CGRect(x: width*CGFloat(i-1), y: 64, width: width, height: 30))
            btn.setTitle("\(i)", forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            btn.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
            btn.addTarget(self, action: #selector(btnClick(_:)), forControlEvents: .TouchUpInside)
            btn.tag = 100+i
            btn.setBackgroundImage(UIImage(named: "sdefaultImage"), forState: .Normal)
            self.view.addSubview(btn)
        }

        let sW = self.view.frame.size.width
        let sH = self.view.frame.size.height
        let VC1 = HomePageViewController()
        VC1.view.frame = CGRect(x: 0, y: 64, width: sW, height: sH-64)
        self.view.addSubview(VC1.view)
        //添加子视图控制器
        self.addChildViewController(VC1)
        currentVC = VC1
        ChildVCS.append(VC1)
        let VC2 = HomePageViewController()
        VC2.view.frame = CGRect(x: 0, y: 64, width: sW, height: sH-64)
        ChildVCS.append(VC2)
        let VC3 = HomePageViewController()
        VC3.view.frame = CGRect(x: 0, y: 64, width: sW, height: sH-64)
        ChildVCS.append(VC3)
        let VC4 = HomePageViewController()
        VC4.view.frame = CGRect(x: 0, y: 64, width: sW, height: sH-64)
        ChildVCS.append(VC4)
        
    }

    func btnClick(btn:UIButton) {
        let new = ChildVCS[btn.tag-101]
        if currentVC != new {
            self.exchangeOld(currentVC!, new:new)
        }
    }
    
    func exchangeOld(old:UIViewController,new:UIViewController) {
        self.addChildViewController(new)
        /*交换两个视图控制器
         第一个参数：当前显示的视图控制器
         第二个参数：将要显示的视图控制器
         第三个参数：切换的时间
         第四个参数：切换时候的动画样式
         第五个参数：切换的动画
         第六个动画：切换完成之后调用的闭包，闭包中的参数是bool，如果切换失败就是false，成功就是true
         */
        self.transitionFromViewController(old, toViewController: new, duration: 0.5, options: .CurveEaseInOut, animations: nil) {[unowned self] (b) in
            if b {
                //从父视图控制器中移除
                old.removeFromParentViewController()
                self.currentVC = new
            }else{
                new.removeFromParentViewController()
                self.currentVC = old
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

