//
//  RecommendModel.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/1.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import SwiftyJSON

class RecommendModel: NSObject {
    
    var RecommendValue0:RecommendValueZero?
    var RecommendValue1:RecommendValueOne?
    
    class func parseData(data:NSData) -> RecommendModel {
        
        let json = JSON(data: data)
        let model = RecommendModel()
        model.RecommendValue0 = RecommendValueZero.parse(json[0])
        model.RecommendValue1 = RecommendValueOne.parse(json[1])

        return model
    }
}

/*===================================================*/
/*================RecommendValue0====================*/

class RecommendValueZero:NSObject {
    
    var currentPage:NSNumber?
    var expiredTime:NSNumber?
    var item:Array<RecommendValueZeroItem>?
    var listLd:String?
    var totalPage:NSNumber?
    var type:String?
    
    class func parse(json:JSON) -> RecommendValueZero {
        
        let model = RecommendValueZero()
        model.currentPage = json["currentPage"].number
        model.expiredTime = json["expiredTime"].number
        
        var array = Array<RecommendValueZeroItem>()
        for (_,subjson) in json["item"] {
            let itemModel = RecommendValueZeroItem.parse(subjson)
            array.append(itemModel)
        }
        model.item = array
        
        model.listLd = json["listLd"].string
        model.totalPage = json["totalPage"].number
        model.type = json["type"].string
        
        return model
    }
}

class RecommendValueZeroItem:NSObject {
    
    var comments:String?
    var commentsall:String?
    var commentsUrl:String?
    var documentId:String?
    var id:String?
    
    var link:RecommendValueZeroLink?
    var online:String?
    var source:String?
    var thumbnail:String?
    var title:String?
    var type:String?
    var updateTime:String?
    
    class func parse(json:JSON) -> RecommendValueZeroItem {
        
        let model = RecommendValueZeroItem()
        model.comments = json["comments"].string
        model.commentsall = json["commentsall"].string
        model.commentsUrl = json["commentsUrl"].string
        model.documentId = json["documentId"].string
        model.id = json["id"].string
        
        model.link = RecommendValueZeroLink.parse(json["link"])
        
        model.online = json["online"].string
        model.source = json["source"].string
        model.thumbnail = json["thumbnail"].string
        model.title = json["title"].string
        model.type = json["type"].string
        model.updateTime = json["updateTime"].string

        return model
    }
}

class RecommendValueZeroLink:NSObject {
    
    var type:String?
    var url:String?
    
    class func parse(json:JSON) -> RecommendValueZeroLink {
        
        let model = RecommendValueZeroLink()
        model.type = json["type"].string
        model.url = json["url"].string
    
        return model
    }
    
}

/*===================================================*/
/*================RecommendValue1====================*/
class RecommendValueOne:NSObject {
    
    var currentPage:NSNumber?
    var expiredTime:NSNumber?
    var item:Array<RecommendValueOneItem>?
    var listLd:String?
    var totalPage:NSNumber?
    var type:String?
    
    class func parse(json:JSON) -> RecommendValueOne {
        
        let model = RecommendValueOne()
        model.currentPage = json["currentPage"].number
        model.expiredTime = json["expiredTime"].number
        
        var array = Array<RecommendValueOneItem>()
        for (_,subjson) in json["item"] {
            let itemModel = RecommendValueOneItem.parse(subjson)
            array.append(itemModel)
        }
        model.item = array
        
        model.listLd = json["listLd"].string
        model.totalPage = json["totalPage"].number
        model.type = json["type"].string
        
        return model
    }
}

class RecommendValueOneItem:NSObject {
    
    var comments:String?
    var commentsall:String?
    var commentsUrl:String?
    var documentId:String?
    var hasSlide:Bool? = true
    var id:String?
    var link:RecommendValueOneLink?
    var online:String?
    var source:String?
    var style:RecommendValueOneStyle?
    var thumbnail:String?
    var title:String?
    var type:String?
    var updateTime:String?
    
    class func parse(json:JSON) -> RecommendValueOneItem {
        
        let model = RecommendValueOneItem()
        model.comments = json["comments"].string
        model.commentsall = json["commentsall"].string
        model.commentsUrl = json["commentsUrl"].string
        model.documentId = json["documentId"].string
        model.id = json["id"].string
        
        model.link = RecommendValueOneLink.parse(json["link"])
        
        model.style = RecommendValueOneStyle.parse(json["style"])
        
        model.online = json["online"].string
        model.source = json["source"].string
        model.thumbnail = json["thumbnail"].string
        model.title = json["title"].string
        model.type = json["type"].string
        model.updateTime = json["updateTime"].string
        
        return model
    }
}

class RecommendValueOneLink:NSObject {
    
    var online:String?
    var source:String?
    
    class func parse(json:JSON) -> RecommendValueOneLink {
        
        let model = RecommendValueOneLink()
        model.online = json["online"].string
        model.source = json["source"].string
        
        return model
    }
    
}

class RecommendValueOneStyle:NSObject {
    
    var images:Array<String>?
    var slideCount:NSNumber?
    var type:String?
    
    class func parse(json:JSON) -> RecommendValueOneStyle {
        
        let model = RecommendValueOneStyle()
        
        model.images = json["images"].object as? Array<String>
        
        model.slideCount = json["slideCount"].number
        model.type = json["type"].string
        
        return model
    }
}









