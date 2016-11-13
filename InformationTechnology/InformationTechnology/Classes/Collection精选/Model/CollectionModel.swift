//
//  CollectionModel.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/7.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import SwiftyJSON

class CollectionModel: NSObject {

    var bodyList:Array<CollectionBodyList>?
    var relate:String?
    var relateDes:String?
    var systemTime:String?
    var title:String?
    
    class func parseData(data:NSData) -> CollectionModel {
        
        let json = JSON(data: data)
        
        let model = CollectionModel()
        
        var array = Array<CollectionBodyList>()
        for (_,subjson) in json["bodyList"] {
            let blModel = CollectionBodyList.parse(subjson)
            array.append(blModel)
        }
        model.bodyList = array
        
        model.relate = json["relate"].string
        model.relateDes = json["relateDes"].string
        model.systemTime = json["systemTime"].string
        model.title = json["title"].string
        
        return model
    }
}

class CollectionBodyList:NSObject {
    
    var abstractDesc:String?
    var createDate:String?
    var imageList:Array<CollectionImageList>?
    
    var infoId:String?
    var itemId:String?
    var memberItem:CollectionMemberItem?
    
    var memberType:String?
    var showType:String?
    var tag:String?
    
    var title:String?
    var updateDate:String?
    var weMedia:CollectionweMedia?
    
    class func parse(json:JSON) -> CollectionBodyList {
        
        let model = CollectionBodyList()
        model.abstractDesc = json["abstractDesc"].string
        model.createDate = json["createDate"].string
        
        var array = Array<CollectionImageList>()
        for (_,subjson) in json["imageList"] {
            let imgModel = CollectionImageList.parse(subjson)
            array.append(imgModel)
        }
        model.imageList = array
        
        model.infoId = json["infoId"].string
        model.itemId = json["itemId"].string
        
        model.memberItem = CollectionMemberItem.parse(json["memberItem"])
        
        model.memberType = json["memberType"].string
        model.showType = json["showType"].string
        model.tag = json["tag"].string
        
        model.title = json["title"].string
        model.updateDate = json["updateDate"].string
        
        model.weMedia = CollectionweMedia.parse(json["weMedia"])
        
        return model
    }
}

class CollectionImageList:NSObject {
    
    var image:String?
    
    class func parse(json:JSON) -> CollectionImageList {
        
        let model = CollectionImageList()
        model.image = json["image"].string
        
        return model
    }
}

class CollectionMemberItem:NSObject {
    
    var commentNo:String?
    var copyright:String?
    var cpName:String?
    
    var duration:NSNumber?
    var guid:String?
    var image:String?
    
    var mUrl:String?
    var name:String?
    var pcUrl:String?
    
    var playTime:String?
    var searchPath:String?
    var videoFiles:Array<CollectionVideoFiles>?
    
    class func parse(json:JSON) -> CollectionMemberItem {
        
        let model = CollectionMemberItem()
        model.commentNo = json["commentNo"].string
        model.copyright = json["copyright"].string
        model.cpName = json["cpName"].string
        
        model.duration = json["duration"].number
        model.guid = json["guid"].string
        model.image = json["image"].string
        
        model.mUrl = json["mUrl"].string
        model.name = json["name"].string
        model.pcUrl = json["pcUrl"].string
        
        model.playTime = json["playTime"].string
        model.searchPath = json["searchPath"].string
        
        var array = Array<CollectionVideoFiles>()
        for (_,subjson) in json["videoFiles"] {
            let blModel = CollectionVideoFiles.parse(subjson)
            array.append(blModel)
        }
        model.videoFiles = array
        
        return model
    }
}

class CollectionVideoFiles:NSObject {
    
    var filesize:NSNumber?
    var isSplite:NSNumber?
    var mediaUrl:String?
    
    var spliteNo:NSNumber?
    var spliteTime:String?
    var useType:String?
    
    class func parse(json:JSON) -> CollectionVideoFiles {
        
        let model = CollectionVideoFiles()
        model.filesize = json["filesize"].number
        model.isSplite = json["isSplite"].number
        model.mediaUrl = json["mediaUrl"].string
        
        model.spliteNo = json["spliteNo"].number
        model.spliteTime = json["spliteTime"].string
        model.useType = json["useType"].string
        
        return model
    }
}

class CollectionweMedia:NSObject {
    
    var desc:String?
    var headPic:String?
    var id:String?
    var name:String?
    
    class func parse(json:JSON) -> CollectionweMedia {
        
        let model = CollectionweMedia()
        model.desc = json["desc"].string
        model.headPic = json["headPic"].string
        model.id = json["id"].string
        model.name = json["name"].string
        
        return model
    }
}





