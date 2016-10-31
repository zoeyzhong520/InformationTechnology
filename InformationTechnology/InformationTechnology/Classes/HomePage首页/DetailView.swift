//
//  DetailView.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/31.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class DetailView: UIViewController,navigationBarProtocol {

    //点击跳转页面
    var webView:UIWebView?
    var url:NSURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    func configUI() {
        
        //点击跳转页面
        self.automaticallyAdjustsScrollViewInsets = false
        webView = UIWebView(frame: CGRect(x: 0, y: 64, width: screenW, height: screenH-64))
        let request = NSURLRequest(URL: url!)
        webView?.loadRequest(request)
        view.addSubview(webView!)
        
        //添加button
        addButton(nil, imageName: "back@2x", position: .left, selector: #selector(leftBtnClick))
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
