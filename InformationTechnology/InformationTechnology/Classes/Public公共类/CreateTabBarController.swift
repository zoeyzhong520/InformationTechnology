//
//  CreateTabBarController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class CreateTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建视图控制器
        createViewControllers()
    }
    
    func createViewControllers() {
        
        //视图控制器的名字
        let nameArray = ["HomepageViewController","RecommendViewController","CollectionViewController"]
        
        //图片的名字
        let images = ["tabbar_news","tabbar_discover","tabbar_vision","tabbar_my"]
        
        //标题文字
        let titles = ["首页","推荐","精选"]
        
        //2.创建视图控制器
        //视图控制器对象的数组
        var ctrlArray = Array<UINavigationController>()
        for i in 0..<nameArray.count {
            
            let name = "InformationTechnology." + nameArray[i]
            
            //使用类名创建类的对象
            let ctrl = NSClassFromString(name) as! UIViewController.Type
            let vc = ctrl.init()
            
            //导航
            let navCtrl = UINavigationController(rootViewController: vc)
            navCtrl.tabBarItem.image = UIImage(named: images[i])
            navCtrl.tabBarItem.selectedImage = UIImage(named: images[i]+"_selected")?.imageWithRenderingMode(.Automatic)
            self.tabBar.tintColor = UIColor(red: 209/255.0, green: 49/255.0, blue: 92/255.0, alpha: 1.0)
            navCtrl.title = titles[i]
            ctrlArray.append(navCtrl)
        }
        viewControllers = ctrlArray

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
