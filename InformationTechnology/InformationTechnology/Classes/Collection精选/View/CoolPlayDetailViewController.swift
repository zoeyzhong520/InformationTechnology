//
//  CoolPlayDetailViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/15.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class CoolPlayDetailViewController: UIViewController,navigationBarProtocol {

    //点击跳转页面
    var webView:UIWebView?
    var urlString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        //搭建界面
        configUI()
    }

    //搭建界面
    func configUI() {
        
        addTitle("酷玩")
        
        //响应用户操作
        self.view.userInteractionEnabled = true
        
        //点击跳转页面
        self.automaticallyAdjustsScrollViewInsets = false
        webView = UIWebView(frame: CGRect(x: 0, y: 64, width: screenW, height: screenH-64))
        let url = NSURL(string: urlString!)
        let request = NSURLRequest(URL: url!)
        webView?.loadRequest(request)
        view.addSubview(webView!)
        
        self.navigationController?.navigationBar.tintColor = UIColor(red: 209/255.0, green: 49/255.0, blue: 92/255.0, alpha: 1.0)
        
        //添加button
        //addButton(nil, imageName: "userdetails_back_unselected_night", position: .left, selector: #selector(leftBtnClick))
    }
    
    func leftBtnClick() {
        navigationController?.popViewControllerAnimated(true)
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
