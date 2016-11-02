//
//  RecommendScienceCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/1.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class RecommendScienceCell: UITableViewCell {
    
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
        
        if itemArray?.count > 0 {
            
            //标题
            let tmpTitle = itemArray![0]
            titleLabel.text = tmpTitle.title
            
            //更新时间
            let tmpTimeLabel = itemArray![0]
            timeLabel.text = tmpTimeLabel.updateTime
            
            //图片
            let tmpImage = itemArray![0]
            if tmpImage.thumbnail != nil {
                
                let url = NSURL(string: (tmpImage.thumbnail)!)
                newsImageView.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
            }
            
            //阅读数
            let tmpSallLabel = itemArray![0]
            commentSallLabel.text = tmpSallLabel.commentsall
            
            //来源
            let tmpSourceLabel = itemArray![0]
            sourceLabel.text = tmpSourceLabel.source
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
