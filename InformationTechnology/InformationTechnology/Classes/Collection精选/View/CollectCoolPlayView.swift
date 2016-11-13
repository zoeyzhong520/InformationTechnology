//
//  CollectCoolPlayView.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/11.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class CollectCoolPlayView: UIView {

    //点击事件
    var jumpClosure:RecommendJumpClosure?
    
    //数据
    var model:CoolPlayModel? {
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
        //collecView?.registerNib(UINib(nibName: "CoolPlaySlideCell",bundle: nil), forCellWithReuseIdentifier: "coolPlaySlideCellId")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK:UICollectionView的代理方法
extension CollectCoolPlayView:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: kScreenWidth, height: 180)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = CoolPlaySlideCell.createHeaderCellFor(collectionView, atIndexPath: indexPath, slideArray: model?.top_slide_aera?.cards_inf)
            return cell
        }
        
        return UICollectionViewCell()
    }
}



















