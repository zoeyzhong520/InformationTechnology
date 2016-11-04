//
//  AdDetailView.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class AdDetailView: UIView {
    
    //数据
    var model:AdDetailModel? {
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
extension AdDetailView:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var row = 0
        if model?.body?.slides?.count > 0 {
            row = 1
        }
        return row
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height:CGFloat = 0
        if indexPath.row == 0 {
            height = 736
        }
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = AdDetailCell.createAdSlidesForCell(tableView, atIndexPath: indexPath, slideArray: model?.body?.slides)
            return cell
        }
        return UITableViewCell()
    }
}










