//
//  UITextField+Login.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/14.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    class func creatTextField(placeHolder:String?, imageName:String?) -> UITextField {
        
        let textField = UITextField()
        if let tmpPlaceHolder = placeHolder {
            textField.placeholder = tmpPlaceHolder
        }
        let image = UIImage(named: imageName!)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 30, 18)
        textField.leftView = imageView
        textField.leftViewMode = .Always
        textField.textAlignment = .Left
        textField.borderStyle = .RoundedRect
        
        return textField
    }
}