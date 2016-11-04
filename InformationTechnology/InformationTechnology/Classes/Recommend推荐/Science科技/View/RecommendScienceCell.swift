//
//  RecommendScienceCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/1.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class RecommendScienceCell: UITableViewCell {
    
    //点击事件
    var jumpClosure:RecommendJumpClosure?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var newsImageView: UIImageView!
    
    
    @IBOutlet weak var commentImage: UIImageView!
    
    @IBOutlet weak var commentSallLabel: UILabel!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var sourceImage: UIImageView!
    
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
                
                //更新时间
                let tmpTimeLabel = itemArray![i]
                timeLabel.text = tmpTimeLabel.updateTime
                
                //图片
                let model = itemArray![i]
                //创建图片
                if model.thumbnail != nil {
                    
                    let url = NSURL(string: (model.thumbnail)!)
                    if model.thumbnail != nil {
                        newsImageView.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                    }
                }
                
                //添加点击事件
                contentView.tag = 200+i
                let g = UITapGestureRecognizer(target: self, action: #selector(tapImage(_:)))
                contentView.addGestureRecognizer(g)
                
                //阅读数
                let tmpSallLabel = itemArray![i]
                if tmpSallLabel.commentsall == nil {
                    commentSallLabel.text = "0"
                }else{
                    commentSallLabel.text = tmpSallLabel.commentsall
                }
                
                //来源
                let tmpSourceLabel = itemArray![i]
                if tmpSourceLabel.source == nil {
                    sourceLabel.text = "敬请期待"
                }else{
                    sourceLabel.text = tmpSourceLabel.source
                }
            }
        }
        
    }
    
    func tapImage(g: UIGestureRecognizer) {
        
        let index = (g.view?.tag)! - 200
        //获取点击的数据
        let item = itemArray![index]
        
        if jumpClosure != nil  && item.documentId != nil {
            jumpClosure!(item.documentId!)
        }
    }

    
    //创建cell的方法
    class func createScienceCellFor(tableView:UITableView, atIndexPath indexPath:NSIndexPath, itemArray:Array<RecommendValueZeroItem>?) -> RecommendScienceCell {
        
        let cellId = "recommendScienceCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? RecommendScienceCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("RecommendScienceCell", owner: nil, options: nil).last as? RecommendScienceCell
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
