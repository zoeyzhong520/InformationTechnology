//
//  MineView.swift
//  InformationTechnology
//
//  Created by zzj on 16/11/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class MineView: UIView {

    //点击事件
    var jumpClosure:(()->(Void))?
    
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
extension MineView:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 9
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height:CGFloat = 0
        if indexPath.row == 0 {
            height = 300
        }else{
            height = 50
        }
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
          
            let cell = topCell.createTopCellFor(tableView, atIndexPath: indexPath)
            cell.selectionStyle = .None
            return cell
        }else if indexPath.row == 5 {
            
            //添加开关控件的cell
            
            let cell = hasSwitchCell.createSwitchCellFor(tableView, atIndexPath: indexPath)
            
            //图片
            cell.leftImg.image = UIImage(named: "userCenter_NightMode")
            
            //文字
            cell.nameLabel.text = "夜间"
            
            return cell
            
        }else{
            
            let cell = downCell.createSwitchCellFor(tableView, atIndexPath: indexPath)
            
            //图片
            let picArray = ["userCenter_mall","userCenter_financial","userCenter_activity","userCeneter_subscribe","userCenter_NightMode","userCenter_setting","userCenter_OffLine","userCenter_FeedBack"]
            cell.leftImg.image = UIImage(named: picArray[indexPath.row-1])
            
            //文字
            let titleArray = ["商城","理财","活动","订阅","夜间","设置","离线","反馈"]
            cell.nameLabel.text = titleArray[indexPath.row-1]
            
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
            //点击事件
            jumpClosure!()
        }
    }
}
















