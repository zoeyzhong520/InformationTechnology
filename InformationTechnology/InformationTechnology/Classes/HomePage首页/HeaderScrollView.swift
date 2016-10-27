//
//  HeaderScrollView.swift
//  CustomCell-XIB
//
//  Created by 沈家林 on 16/9/14.
//  Copyright © 2016年 沈家林. All rights reserved.
//

import UIKit

class HeaderScrollView: UIView,UIScrollViewDelegate{
    var scollView:UIScrollView!
    var pageControl:UIPageControl!
    var imageArray:[String]!
    var timer:NSTimer!
    var preImageView:UIImageView!
    var nextImageView:UIImageView!
    var currentImageView:UIImageView!
    var curentPage:Int=0
    var viewWidth:CGFloat{
        return self.frame.size.width
    }
    var viewHeight:CGFloat{
        return self.frame.size.height
    }
    
    init(frame: CGRect,imageNames:[String]) {
        super.init(frame: frame)
        imageArray=imageNames
        configView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func imageNameArray(array:[String]){
        imageArray=array
        configView()
    }
    
    func configView(){
        if imageArray.count<=1{
            return
        }
        scollView=UIScrollView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        scollView.showsHorizontalScrollIndicator=false
        scollView.showsVerticalScrollIndicator=false
        scollView.bounces=false
        scollView.pagingEnabled=true
        self.addSubview(scollView)
        
        preImageView=UIImageView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        scollView.addSubview(preImageView)
        
        currentImageView=UIImageView(frame: CGRect(x: viewWidth, y: 0, width: viewWidth, height: viewHeight))
        scollView.addSubview(currentImageView)
        
        nextImageView=UIImageView(frame: CGRect(x: 2*viewWidth, y: 0, width: viewWidth, height: viewHeight))
        scollView.addSubview(nextImageView)
        
        scollView.contentSize=CGSize(width: 3*viewWidth, height: viewHeight)
        scollView.contentOffset=CGPoint(x: viewWidth, y: 0)
        scollView.delegate=self
        
        pageControl=UIPageControl(frame: CGRect(x: 0, y: viewHeight-30, width: viewWidth, height: 30))
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        pageControl.numberOfPages=imageArray.count
        self.addSubview(pageControl)
        
        timer=NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(timeRun), userInfo: nil, repeats: false)
        
        curentPage=0
        preImageView.image=UIImage(named: imageArray[imageArray.count-1])
        currentImageView.image=UIImage(named: imageArray[0])
        nextImageView.image=UIImage(named: imageArray[1])
        pageControl.currentPage=curentPage
        
    }
    
    func timeRun(){
        UIView.animateWithDuration(0.3, animations: {[unowned self] in
            self.scollView.contentOffset=CGPointMake(self.viewWidth*2, 0)
            }) {[unowned self] (b) in
               self.scrollViewDidEndDecelerating(self.scollView)
        }
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        timer.invalidate()
        timer=NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(timeRun), userInfo: nil, repeats: false)
        if scollView.contentOffset.x==2*viewWidth{
            //朝⬅️边滑动
            curentPage=(curentPage+1)%imageArray.count
        }else if scollView.contentOffset.x==0{
            //朝➡️边滑动
        curentPage=(curentPage-1+imageArray.count)%imageArray.count
        }
        
        //设置网络图片
        preImageView.kf_setImageWithURL(NSURL(string: imageArray[(curentPage-1+imageArray.count)%imageArray.count]))
        currentImageView.kf_setImageWithURL(NSURL(string: imageArray[curentPage]))
        nextImageView.kf_setImageWithURL(NSURL(string: imageArray[(curentPage+1)%4]))
        
        pageControl.currentPage=curentPage
        scollView.contentOffset=CGPoint(x: viewWidth, y: 0)
    }
    
}
