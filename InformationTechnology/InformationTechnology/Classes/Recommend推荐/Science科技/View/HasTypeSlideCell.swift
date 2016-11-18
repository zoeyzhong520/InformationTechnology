//
//  HasTypeSlideCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/17.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class HasTypeSlideCell: UITableViewCell {
    
    //点击事件
    var jumpClosure:RecommendJumpClosure?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var leftImg: UIImageView!
    
    @IBOutlet weak var middleImg: UIImageView!
    
    @IBOutlet weak var rightImg: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var commentSallLabel: UILabel!
    
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
                if model.hasSlide == true {
                    
                    //创建图片
                    if model.style?.images?.count > 0 {
                        
                        let url1 = NSURL(string: (model.style?.images![0])!)
                        
                        leftImg.kf_setImageWithURL(url1!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                        
                        
                        let url2 = NSURL(string: (model.style?.images![1])!)
                        
                        middleImg.kf_setImageWithURL(url2!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                        
                        
                        let url3 = NSURL(string: (model.style?.images![2])!)
                        
                        rightImg.kf_setImageWithURL(url3!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                        
                    }
                    
                    //点击数
                    let tmpCountLabel = itemArray![i]
                    if tmpCountLabel.style?.slideCount != nil {
                        countLabel.text = "\(tmpCountLabel.style!.slideCount!)"
                    }
                }
                
                //添加点击事件
                contentView.tag = 200+i
                let g = UITapGestureRecognizer(target: self, action: #selector(tapImage(_:)))
                contentView.addGestureRecognizer(g)
                
                //评论数
                let tmpSallLabel = itemArray![i]
                if tmpSallLabel.commentsall == nil {
                    commentSallLabel.text = "0"
                }else{
                    commentSallLabel.text = tmpSallLabel.commentsall!
                }
                
                
            }
        }
        
    }
    
    func tapImage(g: UIGestureRecognizer) {
        
        let index = (g.view?.tag)! - 200
        //获取点击的数据
        let item = itemArray?[index]
        
        if jumpClosure != nil && item!.id != nil {
            jumpClosure!((item?.id)!)
            //print("\(item.id!)"+"\(item.documentId!)")
        }
    }
    
    //创建cell的方法
    class func createHasTypeSlideCellFor(tableView:UITableView, atIndexPath indexPath:NSIndexPath, itemArray:Array<RecommendValueZeroItem>?) -> HasTypeSlideCell {
        
        let cellId = "hasTypeSlideCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? HasTypeSlideCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("HasTypeSlideCell", owner: nil, options: nil).last as? HasTypeSlideCell
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
