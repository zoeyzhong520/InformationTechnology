//
//  HasTypeLiveCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/17.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class HasTypeLiveCell: UITableViewCell {

    //点击事件
    var jumpClosure:RecommendJumpClosure?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    //数据
    var itemArray:Array<RecommendValueZeroItem>? {
        didSet {
            //显示数据
            showData()
        }
    }

    //显示数据
    func showData() {
        
        let cnt = itemArray?.count
        for i in 0..<cnt! {
            if itemArray?.count > 0 {
                
                //标题
                let tmpTitle = itemArray![i]
                titleLabel.text = tmpTitle.title
                
                //新闻状态Label
                stateLabel.text = "进行中・・・"
                
                //图片
                let model = itemArray![i]
                //创建图片
                if model.thumbnail != nil {
                    
                    let url = NSURL(string: model.thumbnail!)
                    
                    imgView.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                    
                }
                
                //添加点击事件
                contentView.tag = 200+i
                let g = UITapGestureRecognizer(target: self, action: #selector(tapImage(_:)))
                contentView.addGestureRecognizer(g)
                
            }
        }
        
    }
    
    func tapImage(g: UIGestureRecognizer) {
        
        let index = (g.view?.tag)! - 200
        //获取点击的数据
        let item = itemArray![index]
        
        if jumpClosure != nil  && item.commentsUrl != nil && item.id != nil {
            jumpClosure!(item.commentsUrl!)
            //print("\(item.id!)"+"\(item.documentId!)")
        }
    }
    
    //创建cell的方法
    class func createHasTypeLiveCellFor(tableView:UITableView, atIndexPath indexPath:NSIndexPath, itemArray:Array<RecommendValueZeroItem>?) -> HasTypeLiveCell {
        
        let cellId = "hasTypeLiveCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? HasTypeLiveCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("HasTypeLiveCell", owner: nil, options: nil).last as? HasTypeLiveCell
        }
        cell?.itemArray = itemArray
        return cell!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
