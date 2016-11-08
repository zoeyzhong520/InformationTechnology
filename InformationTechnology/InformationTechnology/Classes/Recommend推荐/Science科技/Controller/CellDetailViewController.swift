//
//  CellDetailViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire

class CellDetailViewController: KTCTabViewController {
    
    //定义webView
    var webView:UIWebView?
    
    //网络上html数据
    var html:String?
    
    //数据
    var webModel:CellDetailModel?
    
    //定义数据刷新页码
    private var currentPage = 1
    
    //cell数据接口
    var urlString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //下载视图的数据
        downloadCellData()
        
        //创建视图
        configUI()
    }
    
    func configUI() {
        
        //webView
        webView = UIWebView(frame: view.bounds)
        automaticallyAdjustsScrollViewInsets = false
        webView?.userInteractionEnabled = true
        webView?.tintColor = UIColor.redColor()
        webView?.scalesPageToFit = true
        webView?.delegate = self
        self.view.addSubview(webView!)
        webView!.stringByEvaluatingJavaScriptFromString("document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '100%'")
        
        //约束
        webView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
    }
    
    //下载cell视图的数据
    func downloadCellData() {
        
        let aurlLimitList = String(format: urlString!, currentPage)
        Alamofire.request(.GET, aurlLimitList, parameters: nil, encoding: ParameterEncoding.URL, headers: nil).responseData {(response) in
            
            if let tmpData = response.data {
                let model = CellDetailModel.parseData(tmpData)
                
                //json解析
                self.webModel = model
                print(self.webModel?.body?.text)
                if self.webModel?.body?.text != nil {
                    self.webView?.loadHTMLString((self.webModel?.body?.text)!, baseURL: nil)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CellDetailViewController:UIWebViewDelegate {
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        //字体大小
        webView.stringByEvaluatingJavaScriptFromString("document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '250%'")
        
        //图片大小
        
    }
}











