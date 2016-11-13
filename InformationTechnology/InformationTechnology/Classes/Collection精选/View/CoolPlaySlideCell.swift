//
//  CoolPlaySlideCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/11.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class CoolPlaySlideCell: UICollectionViewCell {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var pageCtrl: UIPageControl!
    
    //点击事件
    var jumpClosure:RecommendJumpClosure?
    
    //显示数据
    var slideArray:Array<CoolPlaySlideCardsInf>? {
        didSet {
            showData()
        }
    }
    
    //显示数据
    private func showData() {
        
        //遍历添加图片
        let cnt = slideArray?.count
        if slideArray?.count > 0 {
            
            //滚动视图加约束
            //1.创建一个容器视图，作为滚动视图的子视图
            let containerView = UIView.createView()
            scrollView.addSubview(containerView)
            containerView.snp_makeConstraints(closure: {
                (make) in
                make.edges.equalTo(scrollView)
                //一定要设置高度
                make.height.equalTo(scrollView)
            })
            
            //2.循环设置子视图的约束,子视图是添加到容器视图里面
            var lastView: UIView? = nil
            for i in 0..<cnt! {
                
                let model = slideArray![i]
                //创建图片
                let tmpImageView = UIImageView()
                if model.image_800_450 != nil {
                    let url = NSURL(string: model.image_800_450!)
                    tmpImageView.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }
                
                containerView.addSubview(tmpImageView)
                
                //添加点击事件
                tmpImageView.userInteractionEnabled = true
                tmpImageView.tag = 200+i
                let g = UITapGestureRecognizer(target: self, action: #selector(tapImage(_:)))
                tmpImageView.addGestureRecognizer(g)
                
                //图片的约束
                tmpImageView.snp_makeConstraints(closure: {
                    (make) in
                    make.top.bottom.equalTo(containerView)
                    make.width.equalTo(scrollView)
                    if lastView == nil {
                        make.left.equalTo(containerView)
                    }else{
                        make.left.equalTo((lastView?.snp_right)!)
                    }
                })
                
                lastView = tmpImageView
                
                //显示title文字
                if model.title != nil {
                    titleLabel.text = slideArray![pageCtrl.currentPage].title
                }
            }
            
            //3.修改container的宽度
            containerView.snp_makeConstraints(closure: {
                (make) in
                make.right.equalTo(lastView!)
            })
            
            //分页控件
            pageCtrl.numberOfPages = cnt!
        }
    }
    
    func tapImage(g: UIGestureRecognizer) {
        
//        let index = (g.view?.tag)! - 200
//        //获取点击的数据
//        let item = slideArray![index]
//        
//        if jumpClosure != nil  && item.id != nil {
//            jumpClosure!(item.id!)
//        }
    }
    
    //创建cell的方法
    class func createHeaderCellFor(collectionView:UICollectionView, atIndexPath indexPath:NSIndexPath, slideArray:Array<CoolPlaySlideCardsInf>?) -> CoolPlaySlideCell {
        
        let cellId = "coolPlaySlideCellId"
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as? CoolPlaySlideCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("CoolPlaySlideCell", owner: nil, options: nil).last as? CoolPlaySlideCell
        }
        cell?.slideArray = slideArray
        return cell!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}



















