//
//  CellDetailModel.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import SwiftyJSON

class CellDetailModel: NSObject {

    var body:CellDetailBody?
    var meta:CellDetailMeta?
    
    class func parseData(data:NSData) -> CellDetailModel {
        
        let json = JSON(data: data)
        let model = CellDetailModel()
        
        model.body = CellDetailBody.parse(json["body"])
        model.meta = CellDetailMeta.parse(json["meta"])
        
        return model
    }
}

class  CellDetailBody:NSObject {
    
    var author:String?
    var commentCount:NSNumber?
    var commentsUrl:String?
    
    var commentType:String?
    var docAdClose:NSNumber?
    var documentId:String?
    
    var slides:Array<CellDetailBodySlides>?
    var content:CellDetailBodyContent?
    
    var editorcode:String?
    var editTime:String?
    var img:Array<CellDetailImg>?
    
    var introduction:String?
    var likeCount:NSNumber?
    var shareurl:String?
    
    var source:String?
    var text:String?
    var thumbnail_doc:CellDetailDoc?
    
    var title:String?
    var updateTime:String?
    var wapurl:String?
    var wwwurl:String?
    
    class func parse(json:JSON) -> CellDetailBody {
        
        let model = CellDetailBody()
        model.author = json["author"].string
        model.commentCount = json["commentCount"].number
        model.commentsUrl = json["commentsUrl"].string
        
        model.commentType = json["commentType"].string
        model.docAdClose = json["docAdClose"].number
        model.documentId = json["documentId"].string
        
        var array1 = Array<CellDetailBodySlides>()
        for (_,subjson) in json["slides"] {
            let slidesModel = CellDetailBodySlides.parse(subjson)
            array1.append(slidesModel)
        }
        model.slides = array1
        
        model.content = CellDetailBodyContent.parse(json["content"])
        
        model.editorcode = json["editorcode"].string
        model.editTime = json["editTime"].string
        
        var array = Array<CellDetailImg>()
        for (_,subjson) in json["img"] {
            let imgModel = CellDetailImg.parse(subjson)
            array.append(imgModel)
        }
        model.img = array
        
        model.introduction = json["introduction"].string
        model.likeCount = json["likeCount"].number
        model.shareurl = json["shareurl"].string
        model.source = json["source"].string
        model.text = json["text"].string
        model.thumbnail_doc = CellDetailDoc.parse(json["thumbnail_doc"])
        model.title = json["title"].string
        model.updateTime = json["updateTime"].string
        model.wapurl = json["wapurl"].string
        model.wwwurl = json["wwwurl"].string
        
        return model
    }
}

class CellDetailBodySlides:NSObject {
    
    var description1:String?
    var image:String?
    var title:String?
    
    class func parse(json:JSON) -> CellDetailBodySlides {
        
        let model = CellDetailBodySlides()
        model.description1 = json["description"].string
        model.image = json["image"].string
        model.title = json["title"].string
        
        return model
    }
}

class CellDetailBodyContent:NSObject {
    
    var color:String?
    var createTime:NSNumber?
    var nightColor:String?
    
    var shareurl:String?
    var slideAdId:String?
    var style:String?
    var wwwUrl:String?
    
    class func parse(json:JSON) -> CellDetailBodyContent {
        
        let model = CellDetailBodyContent()
        model.color = json["color"].string
        model.createTime = json["createTime"].number
        model.nightColor = json["nightColor"].string
        
        model.shareurl = json["shareurl"].string
        model.slideAdId = json["slideAdId"].string
        model.style = json["style"].string
        model.wwwUrl = json["wwwUrl"].string
        
        return model
    }
    
    
}

class CellDetailImg:NSObject {
    
    var size:CellDetailSize?
    var url:String?
    
    class func parse(json:JSON) -> CellDetailImg {
        
        let model = CellDetailImg()
        model.size = CellDetailSize.parse(json["size"])
        model.url = json["url"].string
        
        return model
    }
}

class CellDetailSize:NSObject {
    
    var height:String?
    var width:String?
    
    class func parse(json:JSON) -> CellDetailSize {
        
        let model = CellDetailSize()
        model.height = json["height"].string
        model.width = json["width"].string
        
        return model
    }
}

class CellDetailDoc:NSObject {

    var height:String?
    var width:String?
    
    class func parse(json:JSON) -> CellDetailDoc {
        
        let model = CellDetailDoc()
        model.height = json["height"].string
        model.width = json["width"].string
        
        return model
    }
}

class CellDetailMeta:NSObject {
    
    var documentId:String?
    var id:String?
    var o:String?
    var type:String?
    
    class func parse(json:JSON) -> CellDetailMeta {
        
        let model = CellDetailMeta()
        model.documentId = json["documentId"].string
        model.id = json["id"].string
        model.o = json["o"].string
        model.type = json["type"].string
        
        return model
    }
}





