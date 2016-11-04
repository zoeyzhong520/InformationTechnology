//
//  AdDetailModel.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import SwiftyJSON

class AdDetailModel: NSObject {

    var body:AdDetailBody?
    var meta:AdDetailMeta?
    
    class func parseData(data:NSData) -> AdDetailModel {
        
        let json = JSON(data: data)
        let model = AdDetailModel()
        
        model.body = AdDetailBody.parse(json["body"])
        model.meta = AdDetailMeta.parse(json["meta"])
        
        return model
    }
    
}

class AdDetailBody:NSObject {
    
    var author:String?
    var commentsUrl:String?
    var documentId:String?
    
    var editorcode:String?
    var editTime:String?
    var recommend:Array<AdDetailBodyRecommend>?
    
    var shareurl:String?
    var slides:Array<AdDetailBodySlides>?
    var title:String?
    
    var updataTime:String?
    var wwwurl:String?
    
    class func parse(json:JSON) -> AdDetailBody {
        
        let model = AdDetailBody()
        model.author = json["author"].string
        model.commentsUrl = json["commentsUrl"].string
        model.documentId = json["documentId"].string
        model.editorcode = json["editorcode"].string
        model.editTime = json["editTime"].string
        
        var array = Array<AdDetailBodyRecommend>()
        for (_,subjson) in json["recommend"] {
            let recommendModel = AdDetailBodyRecommend.parse(subjson)
            array.append(recommendModel)
        }
        model.recommend = array
        
        model.shareurl = json["shareurl"].string
        
        var array1 = Array<AdDetailBodySlides>()
        for (_,subjson) in json["slides"] {
            let slidesModel = AdDetailBodySlides.parse(subjson)
            array1.append(slidesModel)
        }
        model.slides = array1
        
        model.title = json["title"].string
        model.updataTime = json["updataTime"].string
        model.wwwurl = json["wwwurl"].string
        
        return model
    }
}

class AdDetailBodyRecommend:NSObject {
    
    var id:String?
    var links:String?
    var thumbnail:String?
    var title:String?
    var type:String?
    
    class func parse(json:JSON) -> AdDetailBodyRecommend {
        
        let model = AdDetailBodyRecommend()
        model.id = json["id"].string
        model.links = json["links"].string
        model.thumbnail = json["thumbnail"].string
        model.title = json["title"].string
        model.type = json["type"].string
        
        return model
    }
}

class AdDetailBodySlides:NSObject {
    
    var description1:String?
    var image:String?
    var title:String?
    
    class func parse(json:JSON) -> AdDetailBodySlides {
        
        let model = AdDetailBodySlides()
        model.description1 = json["description"].string
        model.image = json["image"].string
        model.title = json["title"].string
        
        return model
    }
}

class AdDetailMeta:NSObject {
    
    var documentId:String?
    var id:String?
    var o:String?
    var type:String?
    
    class func parse(json:JSON) -> AdDetailMeta {
        
        let model = AdDetailMeta()
        model.documentId = json["documentId"].string
        model.id = json["id"].string
        model.o = json["o"].string
        model.type = json["type"].string
        
        return model
    }
}




