//
//  RecommendHeaderCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

public typealias RecommendJumpClosure = (String -> Void)

class RecommendHeaderCell: UITableViewCell {
    
    //点击事件
    var jumpClosure:RecommendJumpClosure?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //显示数据
    var itemArray:Array<RecommendValueOneItem>? {
        didSet {
            showData()
        }
    }
    
    //显示数据
    private func showData() {
        
        //遍历添加图片
        let cnt = itemArray?.count
        if itemArray?.count > 0 {
            
            //滚动视图加约束
            //1.创建一个容器视图，作为滚动视图的子视图
            let containerView = UIView.createView()
            scrollView.delegate = self
            
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
                
                let model = itemArray![i]
                //创建图片
                let tmpImageView = UIImageView()
                if model.thumbnail != nil {
                    let url = NSURL(string: model.thumbnail!)
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
                    titleLabel.text = itemArray![pageControl.currentPage].title
                }
            }
            
            //3.修改container的宽度
            containerView.snp_makeConstraints(closure: {
                (make) in
                make.right.equalTo(lastView!)
            })
            
            //分页控件
            pageControl.numberOfPages = cnt!
        }
    }
    
    func tapImage(g: UIGestureRecognizer) {
        
        let index = (g.view?.tag)! - 200
        //获取点击的数据
        let item = itemArray![index]
        
        if jumpClosure != nil  && item.id != nil {
            jumpClosure!(item.id!)
        }
    }
    
    //创建cell的方法
    class func createHeaderCellFor(tableView:UITableView, atIndexPath:NSIndexPath, itemArray:Array<RecommendValueOneItem>?) -> RecommendHeaderCell {
        
        let cellId = "recommendHeaderCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? RecommendHeaderCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("RecommendHeaderCell", owner: nil, options: nil).last as? RecommendHeaderCell
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

//MARK: UIScrollView代理方法
extension RecommendHeaderCell:UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x/scrollView.bounds.size.width
        pageControl.currentPage = Int(index)
        
        //显示title文字
        if itemArray?[pageControl.currentPage].title != nil {
            titleLabel.text = itemArray![pageControl.currentPage].title
        }
        
    }
    
    //点击状态栏返回顶部
    func scrollViewShouldScrollToTop(scrollView: UIScrollView) -> Bool {
        return false
    }
}













