//
//  AdDetailCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class AdDetailCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var pageLabel: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    //缩放比例
    var scale:CGFloat = 1.0
    
    //显示数据
    var slideArray:Array<AdDetailBodySlides>? {
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
                
                let model = slideArray![i]
                //创建图片
                let tmpImageView = UIImageView()
                if model.image != nil {
                    let url = NSURL(string: model.image!)
                    tmpImageView.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }
                
                containerView.addSubview(tmpImageView)
                
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
                
                //添加pinch缩放手势
                tmpImageView.userInteractionEnabled = true
                let pinch = UIPinchGestureRecognizer(target: self, action: #selector(bigOrSmall(_:)))
                tmpImageView.addGestureRecognizer(pinch)
                
                //显示标题
                if model.title != nil {
                    titleLabel.text = slideArray![pageControl.currentPage].title
                }
                
                //显示描述内容
                if model.description1 != nil {
                    descLabel.text = slideArray![pageControl.currentPage].description1
                }
                
                //显示图片页数
                pageLabel.text = "\(pageControl.currentPage+1)∕\(slideArray!.count)"
                
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
    
    func bigOrSmall(pinch:UIPinchGestureRecognizer) {
        
        pinch.view?.transform = CGAffineTransformMakeScale(pinch.scale*scale, pinch.scale*scale)
        if pinch.state == .Ended {
            //记录每次手势结束后，缩放的比例
            scale *= pinch.scale
        }
    }
    
    //创建cell的方法
    class func createAdSlidesForCell(tableView:UITableView, atIndexPath:NSIndexPath, slideArray:Array<AdDetailBodySlides>?) -> AdDetailCell {
        
        let cellId = "adDetailCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? AdDetailCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("AdDetailCell", owner: nil, options: nil).last as? AdDetailCell
        }
        cell?.slideArray = slideArray
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
extension AdDetailCell:UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x/scrollView.bounds.size.width
        pageControl!.currentPage = Int(index)
        
        //显示标题
        titleLabel.text = slideArray![pageControl.currentPage].title
        
        //显示描述内容
        descLabel.text = slideArray![pageControl.currentPage].description1
        
        //显示图片页数
        pageLabel.text = "\(pageControl.currentPage+1)∕\(slideArray!.count)"
    }
}












