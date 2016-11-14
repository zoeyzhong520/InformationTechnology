//
//  MineViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
    
    var mineView:MineView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        automaticallyAdjustsScrollViewInsets = false
        
        //创建视图
        configView()
    }
    
    //创建视图
    func configView() {
        
        mineView = MineView(frame: CGRectZero)
        view.addSubview(mineView!)
        
        mineView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
        
        //点击事件
        mineView?.jumpClosure = {
            
            let vc = LoginViewController()
            self.navigationController?.pushViewController(vc, animated: true)
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
