//
//  CollectionCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/7.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var playTimeLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    //点击事件
    var jumpClosure:RecommendJumpClosure?
    
    //数据
    var bodyArray:Array<CollectionBodyList>? {
        didSet {
            //showData()
        }
    }
    
    func showData() {
        
        if bodyArray?.count > 0 {
            
            for i in 0..<bodyArray!.count {
                
                let model = bodyArray![i]
                //设置图片
                if model.imageList![0].image != nil {
                    let url = NSURL(string: model.imageList![0].image!)
                    bgImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }
                
                //标题
                titleLabel.text = model.title
                
                //左边图片
                if model.weMedia?.headPic != nil {
                    let url = NSURL(string: (model.weMedia?.headPic)!)
                    headImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "sdefalutImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }
                
                //来源
                sourceLabel.text = model.weMedia?.name
                
                //播放次数
                playTimeLabel.text = "\(model.memberItem!.playTime!)播放"
                
                //评论数
                commentLabel.text = model.memberItem?.commentNo
             
            }
        }
    }
    
    //创建cell的方法
    class func createCellFor(collectionView:UICollectionView, atIndexPath indexPath:NSIndexPath, bodyArray:Array<CollectionBodyList>?) -> CollectionCell {
        
        let cellId = "collectionCellId"
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as? CollectionCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("CollectionCell", owner: nil, options: nil).last as? CollectionCell
        }
        cell?.bodyArray = bodyArray
        return cell!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
}
