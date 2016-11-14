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
    var cellUrlString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //下载cell详情页面的数据
        downloadData()
        
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
        
        //约束
        webView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
    }
    
    //下载cell详情页面的数据
    func downloadData() {
        
        let aurlLimitList = String(format: cellUrlString!, currentPage)
        
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.postWithUrl(aurlLimitList)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CellDetailViewController:UIWebViewDelegate {
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        //字体大小
        webView.stringByEvaluatingJavaScriptFromString("document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '200%'")
        
        //图片大小
        var js = "var script = document.createElement('script');script.type = 'text/javascript';"
        "script.text = \"function ResizeImages() { "
        "var myimg,oldwidth;"
        "var maxwidth = %f;"
        "for(i=0;i <document.images.length;i++){"
        "myimg = document.images[i];"
        "if(myimg.width > maxwidth){"
        "oldwidth = myimg.width;"
        "myimg.width = %f;"
        "}"
        "}"
        "}\";"
        "document.getElementsByTagName('head')[0].appendChild(script);"
        js = String(format: js, kScreenWidth,kScreenWidth-15)
        webView.stringByEvaluatingJavaScriptFromString(js)
    }
}

//MARK:KTCDownloader的代理方法
extension CellDetailViewController:KTCDownloaderProtocol {
    
    //下载失败
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    //下载成功
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
        if let tmpData = data {
            let model = CellDetailModel.parseData(tmpData)
            
            //json解析
            self.webModel = model
            if self.webModel?.body?.text != nil {
                self.webView?.loadHTMLString((self.webModel?.body?.text)!, baseURL: nil)
            }
        }
    }
    
}









