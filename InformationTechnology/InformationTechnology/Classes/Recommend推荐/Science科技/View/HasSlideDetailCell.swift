//
//  HasSlideDetailCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/18.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class HasSlideDetailCell: UITableViewCell {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageCtrl: UIPageControl!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var pageLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    //缩放比例
    var scale:CGFloat = 1.0
    
    //显示数据
    var slideArray:Array<CellDetailBodySlides>? {
        didSet {
            showData()
        }
    }
    
    //显示数据
    func showData() {
        
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
                    titleLabel.text = slideArray![pageCtrl.currentPage].title
                }
                
                //显示描述内容
                if model.description1 != nil {
                    descLabel.text = slideArray![pageCtrl.currentPage].description1
                }
                
                //显示图片页数
                pageLabel.text = "\(pageCtrl.currentPage+1)∕\(slideArray!.count)"
                
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
    
    func bigOrSmall(pinch:UIPinchGestureRecognizer) {
        
        pinch.view?.transform = CGAffineTransformMakeScale(pinch.scale*scale, pinch.scale*scale)
        if pinch.state == .Ended {
            //记录每次手势结束后，缩放的比例
            scale *= pinch.scale
        }
    }
    
    //创建cell的方法
    class func createSlidesForCell(tableView:UITableView, atIndexPath:NSIndexPath, slideArray:Array<CellDetailBodySlides>?) -> HasSlideDetailCell {
        
        let cellId = "hasSlideDetailCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? HasSlideDetailCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("AdDetailCell", owner: nil, options: nil).last as? HasSlideDetailCell
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
extension HasSlideDetailCell:UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x/scrollView.bounds.size.width
        pageCtrl!.currentPage = Int(index)
        
        //显示标题
        titleLabel.text = slideArray![pageCtrl.currentPage].title
        
        //显示描述内容
        descLabel.text = slideArray![pageCtrl.currentPage].description1
        
        //显示图片页数
        pageLabel.text = "\(pageCtrl.currentPage+1)∕\(slideArray!.count)"
    }
}















