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
    
    //数据
    var model:RecommendValueZero? {
        didSet {
            
            //set方法调用之后会调用这里的方法
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
            row = (model?.item?.count)!
        }
        return row
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let itemModel = model?.item![indexPath.row]
        let cell = RecommendScienceCell.createScienceCellFor(tableView, atIndexPath: indexPath, itemArray: [itemModel!])
        return cell
        
    }
}














