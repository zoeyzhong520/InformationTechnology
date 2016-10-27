//
//  NewestViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser

class NewestViewController: UITableViewController {
    
    //定义头部轮播页数据数组
    var headerDataArray:[NewestHeaderModel] = []
    
    //定义界面数据数组
    var dataArray:[NewestModel] = []
    
    //定义头部图片数组
    var newestHeaderImageArray:[String] = []
    
    //设置网络接口刷新页
    var currentPage:Int = 1
    var headerUrlString:String = newestHeaderUrl
    var UrlString:String = newestUrl
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData()//下载数据
        configUI()
    }
    
    func configUI() {
        
        tableView.registerClass(HeaderScrollViewCell.classForCoder(), forCellReuseIdentifier: "newestADCellId")
    }
    
    func downloadData() {
        
        //头部轮播页数据
        Alamofire.request(.GET, headerUrlString+"\(currentPage)").responseData { [unowned self] (response) in
            let xml = XML.parse(response.result.value!)
            if response.result.error == nil {
                let items = xml["rss"]["channel"]["item"]
                for item in items {
                    let model = NewestHeaderModel()
                    model.title = item["title"].text
                    model.image = item["image"].text
                    model.link = item["link"].text
                    self.headerDataArray.append(model)
                    if model.link != "262983" {
                        self.newestHeaderImageArray.append(model.image!)
                    }
                    
                }
                self.tableView.reloadData()
            }
        }
        
        //界面数据
        Alamofire.request(.GET, UrlString+"\(currentPage)").responseData { [unowned self] (response) in
            let xml = XML.parse(response.result.value!)
            if response.result.error == nil {
                let items = xml["rss"]["channel"]["item"]
                for item in items {
                    let model = NewestModel()
                    model.title = item["title"].text
                    model.image = item["image"].text
                    model.postdate = item["description"].text
                    model.description1 = item["description"].text
                    self.dataArray.append(model)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //广告的section显示一行
        return dataArray.count+1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            //广告为202
            return 202
        }
        return 80
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            //广告
            let cell = tableView.dequeueReusableCellWithIdentifier("newestADCellId", forIndexPath: indexPath) as? HeaderScrollViewCell
            cell?.jlScrollView.imageNameArray(newestHeaderImageArray)
            return cell!
        }
        return UITableViewCell()
        
    }
    
}






















