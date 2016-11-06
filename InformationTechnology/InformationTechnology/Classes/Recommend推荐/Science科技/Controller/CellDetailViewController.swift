//
//  CellDetailViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire

class CellDetailViewController: UIViewController {
    
    //定义数据刷新页码
    var currentPage = 1
    
    //cell数据接口
    var urlString:String?
    
    //cell详情视图
    var cellDetailView:CellDetailView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blueColor()
        
        //创建视图
        createView()
        
        //下载视图的数据
        downloadCellData()
    }
    
    //创建视图
    func createView() {
        
        //滚动视图或者其子视图放在导航下面，会自动加一个上面的间距,我们要取消这个间距
        automaticallyAdjustsScrollViewInsets = false
        
        cellDetailView = CellDetailView(frame: CGRectZero)
        view.addSubview(cellDetailView!)
        cellDetailView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
    }
    
    //下载cell视图的数据
    func downloadCellData() {
        
        let aurlLimitList = String(format: urlString!, currentPage)
        Alamofire.request(.GET, aurlLimitList, parameters: nil, encoding: ParameterEncoding.URL, headers: nil).responseData {(response) in
            
            if let tmpData = response.data {
                let model = CellDetailModel.parseData(tmpData)
                
//                let str = NSString(data: tmpData, encoding: NSUTF8StringEncoding)
//                print(str!)
                
                //json解析
                self.cellDetailView?.model = model
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
