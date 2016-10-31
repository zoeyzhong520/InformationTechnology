//
//  HomePageTableView.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser
import MBProgressHUD

class HomePageTableView: UITableViewController,AddReFreshProtocol {
    
    //定义界面数据数组
    var dataArray:[NewestModel] = []
    
    //定义头部图片数组
    var newestHeaderImageArray:[String] = []
    
    //定义头部图片标题数组
    var newestTitleArray:[String] = []
    
    //设置网络接口刷新页
    var currentPage:Int = 1
    var headerUrlString:String = newestHeaderUrl
    var UrlString:String = newestUrl
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()//搭建界面
        DownloadData()//下载界面数据
        HeaderDownloadData()//下载头部轮播页数据
    }
    
    func configUI() {
        
        //注册头部轮播页
        tableView.registerClass(HeaderScrollViewCell.classForCoder(), forCellReuseIdentifier: "newestADCellId")
        
        //注册界面cell
        let nib = UINib(nibName: "NewestCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "newestCellId")
        
        //添加上下拉刷新
        addRefresh({ [unowned self] in
            self.currentPage = 1
            self.DownloadData()
            }) { [unowned self] in
                self.currentPage += 1
                self.DownloadData()
        }
    }
    
    //头部轮播页
    func HeaderDownloadData() {
        
        //下载头部轮播页数据
        Alamofire.request(.GET, headerUrlString+"\(currentPage)").responseData { [unowned self] (response) in
            let xml = XML.parse(response.result.value!)
            if response.result.error == nil {
                let items = xml["rss"]["channel"]["item"]
                for item in items {
                    let model = NewestHeaderModel()
                    model.title = item["title"].text
                    model.image = item["image"].text
                    model.link = item["link"].text
    
                    if model.link != "262983" {
                        //头部图片数组
                        self.newestHeaderImageArray.append(model.image!)
                        //头部图片标题数组
                        self.newestTitleArray.append(model.title!)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    //添加提示等待加载功能
    func addHud() {
        let hud = MBProgressHUD .showHUDAddedTo(self.view, animated: true)
        hud.mode = .DeterminateHorizontalBar
        hud.label.text = "一会就好"
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            sleep(1)
            self.DownloadData()
            dispatch_async(dispatch_get_main_queue(), {
                MBProgressHUD .hideHUDForView(self.view, animated: true)
            })
        }
    }
    
    //界面
    func DownloadData() {
 
        //下载界面数据
        Alamofire.request(.GET, UrlString+"\(currentPage)").responseData { [unowned self] (response) in
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            if self.currentPage == 1 {
                self.dataArray.removeAll()
            }
            let xml = XML.parse(response.result.value!)
            if response.result.error == nil {
                let items = xml["rss"]["channel"]["item"]
                for item in items {
                    let model = NewestModel()
                    model.title = item["title"].text
                    model.image = item["image"].text
                    model.postdate = item["description"].text
                    model.description1 = item["description"].text
                    model.url = item["url"].text
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
    
    // MARK: tableView的代理方法
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //广告的section显示一行
        return dataArray.count+1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            //广告高度为200
            return 230
        }
        return 90
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            //广告
            let cell = tableView.dequeueReusableCellWithIdentifier("newestADCellId", forIndexPath: indexPath) as? HeaderScrollViewCell
            cell?.scrollView.NameArray(newestHeaderImageArray, array2: newestTitleArray)
            return cell!
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("newestCellId", forIndexPath: indexPath) as! NewestCell
        let model = dataArray[indexPath.row-1]
        cell.TitleLabel.text = model.title
        cell.DateLabel.text = model.postdate
        if model.image != nil {
            let url = NSURL(string: model.image!)
            cell.DescImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        }
        return cell
    }
}






















