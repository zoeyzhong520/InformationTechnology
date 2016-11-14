//
//  GuideViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/14.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //创建界面
        configView()
    }

    //创建界面
    func configView() {
        
        //添加滚动视图
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.pagingEnabled = true
        view.addSubview(scrollView)
        
        //循环添加图片
        for i in 1..<5 {
            
            //背景图片
            let frame:CGRect = CGRectMake(kScreenWidth*(CGFloat(i)-1), 0, kScreenWidth, kScreenHeight)
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: "guideView_bg@2x")
            scrollView.addSubview(imageView)
            
            //图片
            let tmpImgView = UIImageView(frame: imageView.bounds)
            tmpImgView.image = UIImage(named: String(format: "guideView_%ld", i))
            imageView.addSubview(tmpImgView)
            
            if i==4 {
                imageView.userInteractionEnabled = true
                //按钮
                let btn = UIButton(frame: CGRect(x: 110, y: kScreenHeight-180, width: kScreenWidth-2*110, height: 60))
                //btn.backgroundColor = UIColor.redColor()
                btn.addTarget(self, action: #selector(clickBtn), forControlEvents: .TouchUpInside)
                imageView.addSubview(btn)
            }
        }
        scrollView.contentSize = CGSizeMake(kScreenWidth*4, 0)
    }
    
    func clickBtn() {
        
        self.view.window?.rootViewController = CreateTabBarController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
