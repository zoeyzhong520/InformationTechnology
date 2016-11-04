//
//  RecommendView.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/1.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire

class RecommendView: UIView {
    
    //点击事件
    var jumpClosure:RecommendJumpClosure?
    
    //数据
    var model:RecommendValueZero? {
        didSet {
            
            //set方法调用之后会调用这里的方法
            tableView?.reloadData()
        }
    }
    
    //广告数据
    var adModel:RecommendValueOne? {
        didSet {
            tableView?.reloadData()
        }
    }
    
    //表格
    private var tableView:UITableView?

    //重新实现初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //创建表格视图
        tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        addSubview(tableView!)
        
        //约束
        tableView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:UITableView的代理方法
extension RecommendView:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var row = 0
        if model?.item?.count > 0 {
            row = (model?.item?.count)!+1
        }
        return row
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height:CGFloat = 0
        if indexPath.row == 0 {
            height = 180
        }else{
            height = 110
        }
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            //广告
            let cell = RecommendHeaderCell.createHeaderCellFor(tableView, atIndexPath: indexPath, itemArray: adModel?.item)
            
            //点击事件的响应代码
            cell.jumpClosure = jumpClosure
            
            return cell
        }else{
            //新闻部分
            let itemModel = model?.item![indexPath.row-1]
            let cell = RecommendScienceCell.createScienceCellFor(tableView, atIndexPath: indexPath, itemArray: [itemModel!])
            
            //点击事件的响应代码
            cell.jumpClosure = jumpClosure
            
            return cell
        }
    }
}














