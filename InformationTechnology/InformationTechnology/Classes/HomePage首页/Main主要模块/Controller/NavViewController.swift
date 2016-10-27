//
//  NavViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class NavViewController: UIViewController,SKScNavBarDelegate, UIScrollViewDelegate {
    
    var showArrowButton:Bool! //是否显示扩展按钮
    var navBarColor:UIColor = UIColor.whiteColor() //导航栏的颜色
    var navBarArrowImage:UIImage! //扩展按钮上的图片
    var subViewControllers:NSArray! //包含所有子视图控制器的数组
    var lineColor:UIColor!
    var launchMenuHeight:CGFloat! //扩展菜单栏的高度
    
    private var currentIndex:Int! //当前显示的页面的下标
    private var titles:NSMutableArray! //子视图控制器的title数组
    private var scNavBar:SKScNavBar! //导航栏视图
    private var mainView:UIScrollView! //主页面的ScrollView

    /*
     初始化withShowArrowButton
     showArrowButton 显示扩展菜单按钮
     */
    init(show:Bool) {
        super.init(nibName: nil, bundle: nil)
        self.showArrowButton = show
    }
    
    /*
     初始化withSubViewControllers
     subViewControllers 子视图控制器数组
     */
    init(subViewControllers:NSArray) {
        super.init(nibName: nil, bundle: nil)
        self.subViewControllers = subViewControllers
    }
    
    /*
     初始化withParentViewController
     param parentViewController 父视图控制器
     */
    init(parentViewController:UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.addParentController(parentViewController)
    }
    
    /*
     初始化SKScNavBarController
     subViewControllers   子视图控制器
     parentViewController 父视图控制器
     show 是否显示展开扩展菜单栏按钮
     */
    init(subViewControllers:NSArray, parentViewController:ViewController, show:Bool) {
        super.init(nibName: nil, bundle: nil)
        self.subViewControllers = subViewControllers
        self.showArrowButton = show
        self.addParentController(parentViewController)
    }
    
    /*
     添加父视图控制器的方法
     viewController 父视图控制器
     */
    func addParentController(viewController:UIViewController) {
        if viewController.respondsToSelector(Selector("edgesForExtendedLayout")) {
            viewController.edgesForExtendedLayout = UIRectEdge.None
        }
        viewController.addChildViewController(self)
        viewController.view.addSubview(self.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //调用初始化属性的方法
        initParamConfig()
        //调用初始化、配置视图的方法
        viewParamConfig()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initParamConfig() {
        //初始化一些变量
        currentIndex = 1
        if navBarArrowImage == nil {
            navBarArrowImage = UIImage(named: "arrow down")
        }
        if showArrowButton == nil {
            showArrowButton = true
        }
        if lineColor == nil {
            lineColor = UIColor.redColor()
        }
        //获取所有子视图控制器上的title
        titles = NSMutableArray(capacity: subViewControllers.count)
        for vc in subViewControllers {
            titles.addObject(vc.navigationItem.title!)
        }
    }
    
    //初始化视图
    private func initWithNavBarAndMainView() {
        scNavBar = SKScNavBar(frame: CGRectMake(0, 0, kScreenWidth, kScNavBarHeight), show: showArrowButton, image: navBarArrowImage)
        scNavBar.delegate = self
        scNavBar.backgroundColor = navBarColor
        scNavBar.itemsTitles = titles
        scNavBar.lineColor = lineColor
        scNavBar.setItemData()
        
        mainView = UIScrollView(frame: CGRectMake(0, scNavBar.frame.origin.y + scNavBar.frame.size.height, kScreenWidth, kScreenHeight - scNavBar.frame.origin.y - scNavBar.frame.size.height))
        mainView.delegate = self
        mainView.pagingEnabled = true
        mainView.bounces = false
        mainView.showsHorizontalScrollIndicator = false
        mainView.contentSize = CGSizeMake(kScreenWidth * CGFloat(subViewControllers.count), 0)
        view.addSubview(mainView)
        view.addSubview(scNavBar)
    }
    
    //配置视图参数
    private func viewParamConfig() {
        initWithNavBarAndMainView()
        
        //将子视图控制器的view添加到mainView上
        subViewControllers.enumerateObjectsUsingBlock { (_, index:Int, _) in
            let vc = self.subViewControllers[index] as! UIViewController
            vc.view.frame = CGRectMake(CGFloat(index) * kScreenWidth, 0, kScreenWidth, self.mainView.frame.size.height)
            self.mainView.addSubview(vc.view)
            self.mainView.backgroundColor = UIColor.cyanColor()
            self.addChildViewController(vc)
        }
    }
    
    //MARK:ScrollView代理方法
    func scrollViewDidScroll(scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x/kScreenWidth)
        scNavBar.setViewWithItemIndex = currentIndex
    }
    
    //MARK:SKScNavBarDelegate的方法
    func didSelectedWithIndex(index: Int) {
        mainView.setContentOffset(CGPointMake(CGFloat(index) * kScreenWidth, 0), animated: true)
    }
    
    func isShowScNavBarItemMenu(show: Bool, height: CGFloat) {
        if show {
            UIView.animateWithDuration(0.3) { () -> Void in
                self.scNavBar.frame = CGRectMake(self.scNavBar.frame.origin.x, self.scNavBar.frame.origin.y, kScreenWidth, height)
            }
        }else{
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.scNavBar.frame = CGRectMake(self.scNavBar.frame.origin.x, self.scNavBar.frame.origin.y, kScreenWidth, kScNavBarHeight)
            })
        }
        scNavBar.refreshAll()
    }
}














