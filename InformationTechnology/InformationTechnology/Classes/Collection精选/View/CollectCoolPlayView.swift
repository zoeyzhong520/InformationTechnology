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
    var collecView:UICollectionView?
    
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
        collecView?.registerNib(UINib(nibName: "CoolPlaySlideCell",bundle: nil), forCellWithReuseIdentifier: "coolPlaySlideCellId")
        
        collecView?.registerNib(UINib(nibName: "CoolPlayCell",bundle: nil), forCellWithReuseIdentifier: "coolPlayCellId")
        
        //注册header
        collecView?.registerClass(HeaderReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK:UICollectionView的代理方法
extension CollectCoolPlayView:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        if model?.channel_page_modules?.count != nil {
            return (model?.channel_page_modules?.count)!+1
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var num = 0
        if section == 0 {
            num = 1
        }else if section > 0 {
            num = (model?.channel_page_modules![section-1].cards_inf?.count)!
        }
        return num
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: kScreenWidth, height: 180)
        }else{
            return CGSize(width: (kScreenWidth-2*5-10)/2, height: 180)
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSizeMake(0, 0)
        }else{
            return CGSizeMake(kScreenWidth, 40)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsetsMake(0, 0, 0, 0)
        }else{
            return UIEdgeInsetsMake(5, 5, 5, 5)
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        //创建组的头部视图
        if kind == UICollectionElementKindSectionHeader {
            
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath) as? HeaderReusableView
            if model?.channel_page_modules![indexPath.section-1].title != nil {
                
                header?.headerLabel?.text = model?.channel_page_modules![indexPath.section-1].title
            }
            return header!
        }
        return HeaderReusableView()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                let cell = CoolPlaySlideCell.createHeaderCellFor(collectionView, atIndexPath: indexPath, slideArray: model?.top_slide_area?.cards_inf)
                
                //点击事件
                cell.jumpClosure = jumpClosure
                
                return cell
            }
            
        }else if indexPath.section > 0 {
            let cfmodel = model?.channel_page_modules?[indexPath.section-1].cards_inf![indexPath.row]
            let cell = CoolPlayCell.createCellFor(collectionView, atIndexPath: indexPath, carsInfArray: [cfmodel!])
            
            //点击事件
            cell.jumpClosure = jumpClosure
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}



















