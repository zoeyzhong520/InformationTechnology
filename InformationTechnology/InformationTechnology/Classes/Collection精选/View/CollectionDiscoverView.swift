//
//  CollectionDiscoverView.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/7.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import MJRefresh

class CollectionDiscoverView: UIView {
    
    //点击事件
    var jumpClosure:RecommendJumpClosure?
    
    //数据
    var model:CollectionModel? {
        didSet {
            collecView?.reloadData()
        }
    }
    
    //表格
    private var collecView:UICollectionView?
    
    private var flowLayout:UICollectionViewFlowLayout?
    
    //重新实现初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //创建表格视图
        flowLayout = UICollectionViewFlowLayout()
        flowLayout!.scrollDirection = .Vertical
        //设置平行滑动方向的cell间的最小间隔
        //flowLayout!.minimumInteritemSpacing = 10
        //设置垂直滑动方向的cell间的最小间隔
        flowLayout!.minimumLineSpacing = 10
        collecView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout!)
        
        collecView?.delegate = self
        collecView?.dataSource = self
        collecView?.backgroundColor = UIColor.whiteColor()
        addSubview(collecView!)
        
        //约束
        collecView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self)
        })
        
        //注册nib
        collecView?.registerNib(UINib(nibName: "CollectionCell",bundle: nil), forCellWithReuseIdentifier: "collectionCellId")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:UICollectionView的代理方法
extension CollectionDiscoverView:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if model?.bodyList?.count != nil {
            return (model?.bodyList?.count)!
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: kScreenWidth, height: 220)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCellId", forIndexPath: indexPath) as? CollectionCell
        
        let clModel = model?.bodyList![indexPath.row]
        
        //设置图片
        if clModel?.imageList![0].image != nil {
            let url = NSURL(string: clModel!.imageList![0].image!)
            cell!.bgImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        }
        
        //标题
        cell?.titleLabel.text = clModel?.title
        
        //左边图片
        if clModel?.weMedia?.headPic != nil {
            let url = NSURL(string: (clModel!.weMedia?.headPic)!)
            cell!.headImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "sdefalutImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        }
        
        //来源
        cell?.sourceLabel.text = clModel?.weMedia?.name
        
        //播放次数
        if clModel?.memberItem?.playTime != nil {
            cell?.playTimeLabel.text = "\(clModel!.memberItem!.playTime!)播放"
        }
        
        //评论数
        cell?.createDateLabel.text = clModel?.createDate
        
        //视频时长
        if clModel?.memberItem?.duration != nil {
            let totalSeconds = Int((clModel?.memberItem?.duration)!)
            cell?.durationLabel.text = String.init(format: "%02d:%02d", totalSeconds/60,totalSeconds%60)
        }
        
        /*
         //转换成时分秒
         
         label.text = String.init(format:"%02d:%02d",num/60,num%60)
         */
        
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if jumpClosure != nil {
            let mediaUrl = model?.bodyList![indexPath.row].memberItem?.videoFiles![0].mediaUrl
            jumpClosure!(mediaUrl!)
            
        }
    }
    
}












