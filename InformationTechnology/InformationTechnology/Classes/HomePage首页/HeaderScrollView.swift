//
//  HeaderScrollView.swift
//  InformationTechnology
//
//  Created by zzj on 16/10/27.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class HeaderScrollView: UIView,UIScrollViewDelegate{
    
    var scrollView:UIScrollView!
    var pageControl:UIPageControl!
    //轮播页图片数组
    var imageArray:[String]!
    //轮播页标题数组
    var titlesArray:[String]!
    //装载label、pageControl的view
    var bottomView:UIView!
    //轮播页标题的label
    var label:UILabel!
    var timer:NSTimer!
    //上一页
    var preImageView:UIImageView!
    //当前页
    var currentImageView:UIImageView!
    //下一页
    var nextImageView:UIImageView!
    var curentPage:Int=0
    
    var viewWidth:CGFloat{
        return self.frame.size.width
    }
    var viewHeight:CGFloat{
        return self.frame.size.height
    }
    
    init(frame: CGRect,imageNames:[String],titleArray:[String]) {
        super.init(frame: frame)
        self.imageArray=imageNames
        self.titlesArray = titleArray
        configView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //给imageArray、titles赋上传递过来的值
    func NameArray(array:[String], array2:[String]){
        imageArray = array
        titlesArray = array2
        configView()//搭建界面
    }
    
    //添加定时器方法
    func timeRun(){
        UIView.animateWithDuration(0.3, animations: {[unowned self] in
            self.scrollView.contentOffset=CGPointMake(self.viewWidth*2, 0)
        }) {[unowned self] (b) in
            self.scrollViewDidEndDecelerating(self.scrollView)
        }
    }
    
    //添加手势
    func tapAction(g:UIGestureRecognizer) {
        
        
    }
    
    //搭建界面
    func configView(){
        if imageArray.count <= 1{
            return
        }
        //初始化scollView
        scrollView=UIScrollView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        
        //点击状态栏回到列表头部
        //scrollView.scrollsToTop = false
        
        scrollView.contentSize=CGSize(width: 3*viewWidth, height: viewHeight)
        scrollView.contentOffset=CGPoint(x: viewWidth, y: 0)
        scrollView.delegate=self
        scrollView.showsHorizontalScrollIndicator=false
        scrollView.showsVerticalScrollIndicator=false
        scrollView.bounces=false
        scrollView.pagingEnabled=true
        self.addSubview(scrollView)
        
        //上一页
        preImageView=UIImageView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        scrollView.addSubview(preImageView)
        
        //当前页
        currentImageView=UIImageView(frame: CGRect(x: viewWidth, y: 0, width: viewWidth, height: viewHeight))
        scrollView.addSubview(currentImageView)
        
        //下一页
        nextImageView=UIImageView(frame: CGRect(x: 2*viewWidth, y: 0, width: viewWidth, height: viewHeight))
        scrollView.addSubview(nextImageView)
    
        //MARK: 添加点击事件
        for i in 0..<imageArray.count {
            
            scrollView.userInteractionEnabled = true
            preImageView.tag = 100+i-1
            currentImageView.tag = 100
            nextImageView.tag = 100+i+1
            let g = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
            scrollView.addGestureRecognizer(g)
        }
        
        //定时器
        timer=NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(timeRun), userInfo: nil, repeats: false)
        
        //赋值
        curentPage=0
        preImageView.kf_setImageWithURL(NSURL(string: imageArray[0]),placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        currentImageView.kf_setImageWithURL(NSURL(string: imageArray[0]), placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        nextImageView.kf_setImageWithURL(NSURL(string: imageArray[1]), placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)

        //装载label、pageControl的view
        bottomView = UIView(frame: CGRect(x: 0, y: viewHeight-30, width: viewWidth, height: 30))
        bottomView.userInteractionEnabled = false
        bottomView.backgroundColor = UIColor.blackColor()
        bottomView.layer.opacity = 0.6
        self.addSubview(bottomView)
        
        //轮播页标题的label
        label = UILabel(frame: CGRect(x: 100, y: 0, width: viewWidth-100, height: 30))
        label.font = UIFont.systemFontOfSize(14)
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        label.text = titlesArray[curentPage]
        bottomView.addSubview(label)
        
        pageControl=UIPageControl(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        pageControl.numberOfPages=imageArray.count
        bottomView.addSubview(pageControl)
    
    }
    
    //MARK:scrollView的代理方法
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        timer.invalidate()
        timer=NSTimer.scheduledTimerWithTimeInterval(9, target: self, selector: #selector(timeRun), userInfo: nil, repeats: false)
        if scrollView.contentOffset.x==2*viewWidth{
            //朝右边滑动
            curentPage=(curentPage+1)%imageArray.count
        }else if scrollView.contentOffset.x==0{
            //朝左边滑动
        curentPage=(curentPage-1+imageArray.count)%imageArray.count
        }
        
        //设置网络图片
        preImageView.kf_setImageWithURL(NSURL(string: imageArray[(curentPage-1+imageArray.count)%imageArray.count]), placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)

        currentImageView.kf_setImageWithURL(NSURL(string: imageArray[curentPage]), placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        nextImageView.kf_setImageWithURL(NSURL(string: imageArray[(curentPage+1)%imageArray.count]), placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        pageControl.currentPage=curentPage
        label.text = titlesArray[curentPage]
        scrollView.contentOffset=CGPoint(x: viewWidth, y: 0)
        
    }
    
}
