//
//  CoolPlayCell.swift
//  InformationTechnology
//
//  Created by zzj on 16/11/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class CoolPlayCell: UICollectionViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var playTimeLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    //点击事件
    var jumpClosure:RecommendJumpClosure?
    
    //显示数据
    var carsInfArray:Array<CoolPlayCarsInf>? {
        didSet {
            showData()
        }
    }
    
    //显示数据
    private func showData() {
        
        let cnt = carsInfArray?.count
        if carsInfArray?.count > 0 {
            
            for i in 0..<cnt! {
                
                let model = carsInfArray![i]
                //创建图片
                if model.image_448_252 != nil {
                    let url = NSURL(string: model.image_448_252!)
                    bgImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: model.image_448_252!), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }
                
                //添加手势
                contentView.tag = 200+i
                let g = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
                contentView.addGestureRecognizer(g)
                
                //标题
                if model.title != nil {
                    nameLabel.text = model.title
                }
                
                //播放次数
                if model.sub_title != nil {
                    playTimeLabel.text = model.sub_title
                }
                
                //视频时长
                if model.image_b_r_title != nil {
                    durationLabel.text = model.image_b_r_title
                }
                
            }
        }
    }
    
    //手势点击事件
    func tapAction(g:UIGestureRecognizer) {
        
        let index = (g.view?.tag)!-200
        //获取点击的数据
        let item = carsInfArray![index]
        
        if jumpClosure != nil && item.skip_inf?.video_id != nil {
            jumpClosure!((item.skip_inf?.video_id)!)
        }
    }
    
    //创建cell的方法
    class func createCellFor(collectionView:UICollectionView, atIndexPath indexPath:NSIndexPath, carsInfArray:Array<CoolPlayCarsInf>?) -> CoolPlayCell {
        
        let cellId = "coolPlayCellId"
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as? CoolPlayCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("CoolPlayCell", owner: nil, options: nil).last as? CoolPlayCell
        }
        cell?.carsInfArray = carsInfArray
        return cell!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}



















