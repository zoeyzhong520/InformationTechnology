//
//  LoginViewController.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/14.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,navigationBarProtocol {
    
    //账号、密码
    var accountTF:UITextField?
    var passwordTF:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()

        //创建界面
        configView()
    }

    //创建界面
    func configView() {
        
        //标题
        self.title = "登录注册"
        
        //返回button
        addButton(nil, imageName: "userdetails_back_unselected_night", position: .left, selector: #selector(backBtn))
        
        //账号、密码
        //1.账号
        accountTF = UITextField.creatTextField("手机号或邮箱注册", imageName: "uctextfield_leftimage_icon")
        accountTF!.delegate = self
        //accountTF?.becomeFirstResponder()
        accountTF?.clearButtonMode = .Always
        view.addSubview(accountTF!)
        
        accountTF!.snp_makeConstraints { (make) in
            make.left.right.equalTo(self.view).inset(20)
            make.top.equalTo(self.view).inset(64)
            make.height.equalTo(40)
        }
        
        //2.密码
        passwordTF = UITextField.creatTextField("密码", imageName: "uctextfield_leftimage_passw")
        passwordTF!.delegate = self
        passwordTF?.clearButtonMode = .Always
        view.addSubview(passwordTF!)
        
        passwordTF!.snp_makeConstraints { (make) in
            make.left.right.equalTo(self.view).inset(20)
            make.top.equalTo(accountTF!.snp_bottom)
            make.height.equalTo(accountTF!)
        }
        
        //创建 忘记密码? button
        //为button上文字设置下划线
        let str = "忘记密码?"
        let attributedString = NSMutableAttributedString(string: "")
        let attrs = [NSFontAttributeName:UIFont.systemFontOfSize(17),NSForegroundColorAttributeName:UIColor.redColor(),NSUnderlineStyleAttributeName:1] as [String:AnyObject]
        let setStr = NSMutableAttributedString.init(string: str, attributes: attrs)
        attributedString.appendAttributedString(setStr)
        
        let btn = UIButton.createBtn("忘记密码?", bgImageName: nil, highlightImageName: nil, selectImageName: nil, target: self, action: #selector(forgetPasswrAction))
        btn.setAttributedTitle(attributedString, forState: .Normal)
        view.addSubview(btn)
        
        btn.snp_makeConstraints { (make) in
            make.top.equalTo(passwordTF!.snp_bottom).inset(-20)
            make.right.equalTo(self.view.snp_right).inset(20)
            make.size.equalTo(CGSizeMake(100, 20))
        }
        
        //登陆按键
        let loginBtn = UIButton.createBtn("登陆", bgImageName: nil, highlightImageName: nil, selectImageName: nil, target: self, action: #selector(loginClickBtn))
        loginBtn.backgroundColor = UIColor.lightGrayColor()
        loginBtn.alpha = 0.6
        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        view.addSubview(loginBtn)
        
        loginBtn.snp_makeConstraints { (make) in
            make.height.equalTo(passwordTF!)
            make.left.right.equalTo(self.view).inset(20)
            make.top.equalTo(btn.snp_bottom).inset(-30)
        }
        
        //其他登陆方式Label
        let otherLabel = UILabel.createLabel("其他登陆方式", textAlignment: .Center, font: UIFont.systemFontOfSize(14))
        otherLabel.textColor = UIColor.lightGrayColor()
        view.addSubview(otherLabel)
        
        otherLabel.snp_makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp_bottom).inset(-30)
            make.left.right.equalTo(self.view).inset(20)
            make.height.equalTo(20)
        }
        
        //其他登陆方式图标
        let otherBtnW:CGFloat = 60
        let otherBtnH:CGFloat = 60
        let imgArray = ["lr_wechat","lr_QQ","lr_webo"]
        for i in 0..<imgArray.count {
            let otherBtn = UIButton.createBtn(nil, bgImageName: imgArray[i], highlightImageName: nil, selectImageName: nil, target: self, action: #selector(otherBtnClick(_:)))
            otherBtn.tag = 100+i
            view.addSubview(otherBtn)
            
            otherBtn.snp_makeConstraints(closure: { (make) in
                //间距
                let margin:CGFloat = (kScreenWidth-otherBtnW*3)/4
                let cnt = imgArray.count
                //let row = 1
                let col = i%cnt
                let x = margin+(otherBtnW+margin)*CGFloat(col)
                make.left.equalTo(x)
                make.top.equalTo(otherLabel.snp_bottom).inset(-20)
                make.size.equalTo(CGSizeMake(otherBtnW, otherBtnH))
            })
        }
        
        //点击注册
        let str1 = "没有账号？立即注册"
        let attributedString1 = NSMutableAttributedString(string: "")
        let attrs1 = [NSFontAttributeName:UIFont.systemFontOfSize(14),NSForegroundColorAttributeName:UIColor.lightGrayColor(),NSUnderlineStyleAttributeName:1] as [String:AnyObject]
        let setStr1 = NSMutableAttributedString.init(string: str1, attributes: attrs1)
        attributedString1.appendAttributedString(setStr1)
        
        let registBtn = UIButton.createBtn("没有账号？立即注册", bgImageName: nil, highlightImageName: nil, selectImageName: nil, target: self, action: #selector(registClickBtn))
        registBtn.setAttributedTitle(attributedString1, forState: .Normal)
        view.addSubview(registBtn)
        
        registBtn.snp_makeConstraints { (make) in
            make.left.right.equalTo(self.view).inset(100)
            make.bottom.equalTo(self.view.snp_bottom).inset(20+49)
            make.height.equalTo(30)
        }
        
    }
    
    //点击注册
    func registClickBtn() {
        
        print("Regist")
    }
    
    //其他登陆方式图标
    func otherBtnClick(btn:UIButton) {
        
        
    }
    
    //登陆按键
    func loginClickBtn() {
        
        print("Login")
    }
    
    //创建 忘记密码? button
    func forgetPasswrAction() {
        
        print("忘记密码")
    }
    
    //返回按钮
    func backBtn() {
        
        navigationController?.popViewControllerAnimated(true)
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

//MARK:UITextField代理方法
extension LoginViewController:UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true
    }
    
    //点击回车键的时候调用的方法，参数是当前第一响应者的textField
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == accountTF {
            passwordTF?.becomeFirstResponder()
        }else if textField == passwordTF {
            passwordTF?.resignFirstResponder()
        }
        return true
    }
}














