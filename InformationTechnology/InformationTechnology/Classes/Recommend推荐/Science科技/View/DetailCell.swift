//
//  DetailCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/15.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var webView: UIWebView!
    
    //数据
    var bodyModel:CellDetailBody? {
        didSet{
            showData()
        }
    }
    
    //创建视图
    func createView() {
        
        webView.scrollView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
        
        //创建头部View
        let topView = UIView.createView()
        webView.scrollView.addSubview(topView)
        topView.frame = CGRect(x: 0, y: -100, width: kScreenWidth, height: 100)
        
        //创建titleLabel
        if bodyModel?.title != nil && bodyModel?.editTime != nil && bodyModel?.source != nil {
            
            let titleLabel = UILabel.createLabel(bodyModel?.title, textAlignment: .Left, font: UIFont.systemFontOfSize(20))
            titleLabel.numberOfLines = 2
            topView.addSubview(titleLabel)
            
            titleLabel.snp_makeConstraints { (make) in
                make.left.equalTo(topView).inset(5)
                make.right.equalTo(topView).inset(-5)
                make.top.equalTo(topView)
                make.height.equalTo(60)
            }
            
            //创建文档编辑时间Label
            let timeLabel = UILabel.createLabel("\(bodyModel!.editTime!)"+" "+"\( bodyModel!.source!)", textAlignment: .Left, font: UIFont.systemFontOfSize(14))
            timeLabel.textColor = UIColor.lightGrayColor()
            topView.addSubview(timeLabel)
            
            timeLabel.snp_makeConstraints { (make) in
                make.top.equalTo(titleLabel.snp_bottom).inset(-10)
                make.left.equalTo(topView).inset(5)
                make.right.equalTo(topView).inset(-5)
                make.height.equalTo(20)
            }
            
        }
    }
    
    //显示数据
    func showData() {
        //<style>img{width:400px !important;}</style>
        if bodyModel?.text != nil {
            let htmlStr = "<head><style>img{width:100% !important;}</style></head>"+(bodyModel?.text)!
            webView.loadHTMLString(htmlStr, baseURL: nil)
            
            //创建视图
            createView()
        }else{
            
            webView.scrollView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0)
            let view = UIView.createView()
            view.backgroundColor = UIColor.whiteColor()
            webView.scrollView.addSubview(view)
            view.frame = CGRect(x: 0, y: -200, width: kScreenWidth, height: 200)
            
            let label = UILabel.createLabel("真不巧，网页走失了......", textAlignment: .Center, font: UIFont.systemFontOfSize(20))
            label.textColor = UIColor.grayColor()
            view.addSubview(label)
            
            label.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(view).inset(5)
                make.right.equalTo(view).inset(-5)
                make.top.equalTo(view).inset(160)
                make.height.equalTo(40)
            })
        }
        
        
    }
    
    //创建cell的方法
    class func ceateCellFor(tableView:UITableView, atIndexPath indexPath:NSIndexPath, bodyModel:CellDetailBody?) -> DetailCell {
        
        let cellId = "detailCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? DetailCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("DetailCell", owner: nil, options: nil).last as? DetailCell
        }
        cell?.bodyModel = bodyModel
        return cell!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        webView.delegate = self
        webView.backgroundColor = UIColor.whiteColor()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//MARK:UIWebView的代理方法
extension DetailCell:UIWebViewDelegate {
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        
    }
}













