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
        let vcNames = ["InformationTechnology.HomePageViewController","InformationTechnology.CollectionViewController","InformationTechnology.DiscoveryViewController","InformationTechnology.MineViewController"]
        let imageNames = ["dog house@2x","Neutron@2x","Target@2x","Cookie Man@2x"]
        let titles = ["首页","精选","发现","我的"]
        for i in 0..<vcNames.count {
            let vcClasss = NSClassFromString(vcNames[i]) as! UIViewController.Type
            let vc = vcClasss.init()
            vc.title = titles[i]
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = UIImage(named: imageNames[i])
            nav.title = titles[i]
            ViewControllers.append(nav)
        }
        viewControllers = ViewControllers
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
