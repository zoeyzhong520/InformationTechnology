//
//  CellDetailView.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/15.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class CellDetailView: UIView {

    //定义Cell详情页面的布局类型
    enum ScienceDetailCellType:String {
        case doc = "doc"
        case slide = "slides"

    }
    
    //数据
    var model:CellDetailModel? {
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
extension CellDetailView:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var row = 0
        if model?.body != nil {
            row = 1
        }
        return row
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return kScreenHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            if model?.meta?.type == ScienceDetailCellType.slide.rawValue {
                
                let cell = HasSlideDetailCell.createSlidesForCell(tableView, atIndexPath: indexPath, slideArray: model?.body?.slides)
                
                cell.selectionStyle = .None
                return cell
                
            }else{
                
                let cell = DetailCell.ceateCellFor(tableView, atIndexPath: indexPath, bodyModel: model?.body)
                
                //设置选中样式
                cell.selectionStyle = .None
                return cell
            }
            
        }
        return UITableViewCell()
    }
}















