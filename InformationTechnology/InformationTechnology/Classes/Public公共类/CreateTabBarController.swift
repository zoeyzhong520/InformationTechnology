//
//  CreateTabBarController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class CreateTabBarController: UITabBarController {
    
    //tabbar的背景
    private var bgView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViewControllers()
    }
    
    func createViewControllers() {

        var ViewControllers:[UIViewController] = []
        let vcNames = ["InformationTechnology.HomepageViewController","InformationTechnology.RecommendViewController","InformationTechnology.CollectionViewController","InformationTechnology.MineViewController"]
        let imageNames = ["tabbar_news","tabbar_discover","tabbar_vision","tabbar_my"]
        let selectImages = ["tabbar_news_selected","tabbar_discover_selected","tabbar_vision_selected","tabbar_my_selected"]
        let titles = ["首页","推荐","精选","我的"]
        for i in 0..<vcNames.count {
            let vcClasss = NSClassFromString(vcNames[i]) as! UIViewController.Type
            let vc = vcClasss.init()
            vc.title = titles[i]
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = UIImage(named: imageNames[i])
            nav.tabBarItem.selectedImage = UIImage(named: selectImages[i])
            nav.title = titles[i]
            ViewControllers.append(nav)
        }
        viewControllers = ViewControllers
        navigationController?.toolbar.tintColor = UIColor.greenColor()
        //自定制TabBar
        //自定制
        
    }
    
    //显示tabbar
    func showTabBar() {
        UIView.animateWithDuration(0.25) {
            self.bgView?.hidden = false
        }
    }
    
    //隐藏tabbar
    func hideTabBar() {
        UIView.animateWithDuration(0.25) {
            self.bgView?.hidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
