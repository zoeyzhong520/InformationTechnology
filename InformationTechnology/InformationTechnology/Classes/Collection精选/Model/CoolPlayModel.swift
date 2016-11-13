//
//  CoolPlayModel.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/11.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import SwiftyJSON

class CoolPlayModel: NSObject {

    var channel_base_inf:NSObject?
    var channel_page_labels:NSArray?
    var channel_page_modules:Array<CoolPlayPageModules>?
    
    var comment:String?
    var error:NSNumber?
    var msg:String?
    var top_slide_aera:CoolPlayTopSlide?
    
    class func parseData(data:NSData) -> CoolPlayModel {
        
        let json = JSON(data: data)
        let model = CoolPlayModel()
        
        model.channel_base_inf = json["channel_base_inf"].object as? NSObject
        model.channel_page_labels = json["channel_page_labels"].object as? NSArray
        
        var array = Array<CoolPlayPageModules>()
        for (_,subjson) in json["channel_page_modules"] {
            let pmModel = CoolPlayPageModules.parse(subjson)
            array.append(pmModel)
        }
        model.channel_page_modules = array
        
        model.comment = json["comment"].string
        model.error = json["error"].number
        model.msg = json["msg"].string
        
        model.top_slide_aera = CoolPlayTopSlide.parse(json["top_slide_aera"])
        
        return model
    }
}

class CoolPlayPageModules:NSObject {
    
    var bottom_label_type:String?
    var cards_inf:Array<CoolPlayCarsInf>?
    var channel_id:String?
    
    var image_state:NSNumber?
    var module_bottom_labels:NSArray?
    var module_id:String?
    
    var module_more_pos:NSArray?
    var skip_inf:CoolPlaySkipInf?
    var sub_title:String?
    
    var sub_title_labels:NSArray?
    var sub_type:String?
    var title:String?
    
    var title_corner_image:String?
    var title_display_style:String?
    var title_icon:String?
    var week_schedule_labels:NSObject?
    
    class func parse(json:JSON) -> CoolPlayPageModules {
        
        let model = CoolPlayPageModules()
        model.bottom_label_type = json["bottom_label_type"].string
        
        var array = Array<CoolPlayCarsInf>()
        for (_,subjson) in json["cards_inf"] {
            let infModel = CoolPlayCarsInf.parse(subjson)
            array.append(infModel)
        }
        model.cards_inf = array
        
        model.channel_id = json["channel_id"].string
        
        model.image_state = json["image_state"].number
        model.module_bottom_labels = json["module_bottom_labels"].object as? NSArray
        model.module_id = json["module_id"].string
        
        model.module_more_pos = json["module_more_pos"].object as? NSArray
        
        model.skip_inf = CoolPlaySkipInf.parse(json["skip_inf"])
        
        model.sub_title = json["sub_title"].string
        
        model.title_corner_image = json["title_corner_image"].string
        model.title_display_style = json["title_display_style"].string
        model.title_icon = json["title_icon"].string
        model.week_schedule_labels = json["week_schedule_labels"].object as? NSObject
        
        return model
    }
}

class CoolPlayCarsInf:NSObject {
    
    var bottom_title:String?
    var corner_image:String?
    var corner_image_for_pad:String?
    
    var image_200_300:String?
    var image_448_252:String?
    var image_b_l_title:String?
    
    var image_b_r_title:String?
    var is_big_image:NSNumber?
    var skip_inf:CoolPlayCarsInfSkipInf?
    
    var sub_title:String?
    var title:String?
    
    class func parse(json:JSON) -> CoolPlayCarsInf {
        
        let model = CoolPlayCarsInf()
        model.bottom_title = json["bottom_title"].string
        model.corner_image = json["corner_image"].string
        model.corner_image_for_pad = json["corner_image_for_pad"].string
        
        model.image_200_300 = json["image_200_300"].string
        model.image_448_252 = json["image_448_252"].string
        model.image_b_l_title = json["image_b_l_title"].string
        
        model.image_b_r_title = json["image_b_r_title"].string
        model.is_big_image = json["is_big_image"].number
        
        model.skip_inf = CoolPlayCarsInfSkipInf.parse(json["skip_inf"])
        
        model.sub_title = json["sub_title"].string
        model.title = json["title"].string
        
        return model
    }
    
}

class CoolPlayCarsInfSkipInf:NSObject {
    
    var skip_type:String?
    var title:String?
    var video_id:String?
    
    class func parse(json:JSON) -> CoolPlayCarsInfSkipInf {
        
        let model = CoolPlayCarsInfSkipInf()
        model.skip_type = json["skip_type"].string
        model.title = json["title"].string
        model.video_id = json["video_id"].string
        
        return model
    }
}

class CoolPlaySkipInf:NSObject {
    
    var title:String?
    
    class func parse(json:JSON) -> CoolPlaySkipInf {
        
        let model = CoolPlaySkipInf()
        model.title = json["title"].string
        
        return model
    }
}

class CoolPlayTopSlide:NSObject {
    
    var cards_inf:Array<CoolPlaySlideCardsInf>?
    var image_state:NSNumber?
    
    class func parse(json:JSON) -> CoolPlayTopSlide {
        
        let model = CoolPlayTopSlide()
        
        var array = Array<CoolPlaySlideCardsInf>()
        for (_,subjson) in json["cards_inf"] {
            let infModel = CoolPlaySlideCardsInf.parse(subjson)
            array.append(infModel)
        }
        model.cards_inf = array
        
        model.image_state = json["image_state"].number
        
        return model
    }
}

class CoolPlaySlideCardsInf:NSObject {
    
    var bottom_title:String?
    var corner_image:String?
    var corner_image_for_pad:String?
    
    var image_200_300:String?
    var image_448_252:String?
    var image_726_289:String?
    
    var image_800_407:String?
    var image_800_450:String?
    var image_b_r_title:String?
    
    var is_big_image:NSNumber?
    var skip_inf:CoolPlaySlideSkipInf?
    var sub_title:String?
    var title:String?
    
    class func parse(json:JSON) -> CoolPlaySlideCardsInf {
        
        let model = CoolPlaySlideCardsInf()
        model.bottom_title = json["bottom_title"].string
        model.corner_image = json["corner_image"].string
        model.corner_image_for_pad = json["corner_image_for_pad"].string
        
        model.image_200_300 = json["image_200_300"].string
        model.image_448_252 = json["image_448_252"].string
        model.image_726_289 = json["image_726_289"].string
        
        model.image_800_407 = json["image_800_407"].string
        model.image_800_450 = json["image_800_450"].string
        model.image_b_r_title = json["image_b_r_title"].string
        
        model.is_big_image = json["is_big_image"].number
        
        model.skip_inf = CoolPlaySlideSkipInf.parse(json["skip_inf"])
        
        model.sub_title = json["sub_title"].string
        model.title = json["title"].string
        
        return model
    }
}

class CoolPlaySlideSkipInf:NSObject {
    
    var playlist_code:String?
    var skip_type:String?
    var title:String?
    var video_id:String?
    
    class func parse(json:JSON) -> CoolPlaySlideSkipInf {
        
        let model = CoolPlaySlideSkipInf()
        model.playlist_code = json["playlist_code"].string
        model.skip_type = json["skip_type"].string
        model.title = json["title"].string
        model.video_id = json["video_id"].string
        
        return model
    }
    
}




