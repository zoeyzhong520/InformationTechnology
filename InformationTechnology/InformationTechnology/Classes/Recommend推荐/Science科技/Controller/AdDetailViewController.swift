//
//  AdDetailViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire

class AdDetailViewController: UIViewController {

    //数据接口
    var urlString:String?
    
    //定义数据刷新页码
    var currentPage = 1
    
    //广告视图
    private var adDetailView:AdDetailView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        //下载广告视图的数据
        downloadAdData()
        
        //创建视图
        createView()
    }

    //创建视图
    func createView() {
        
        //滚动视图或者其子视图放在导航下面，会自动加一个上面的间距,我们要取消这个间距
        automaticallyAdjustsScrollViewInsets = false
        
        adDetailView = AdDetailView(frame: CGRectZero)
        view.addSubview(adDetailView!)
        adDetailView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
    }
    
    //下载广告视图的数据
    func downloadAdData() {
        
        let aurlLimitList = String(format: urlString!, currentPage)
        
        Alamofire.request(.GET, aurlLimitList, parameters: nil, encoding: ParameterEncoding.URL, headers: nil).responseData {(response) in
            
            if let tmpData = response.data {
                let model = AdDetailModel.parseData(tmpData)
                
//                let str = NSString(data: tmpData, encoding: NSUTF8StringEncoding)
//                print(str!)
                
                //json解析
                self.adDetailView?.model = model
            }
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
