//
//  Const.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit

//屏幕宽、高
public let screenW = UIScreen.mainScreen().bounds.size.width
public let screenH = UIScreen.mainScreen().bounds.size.height

/*
 =============================首页资讯===============================*/

//最新
let newestHeaderUrl = "http://api.ithome.com/xml/slide/slide.xml?r="
let newestUrl = "http://api.ithome.com/xml/newslist/news.xml?r="
let newestHeaderDetail = "http://www.ithome.com/html/it/%ld.htm"

//手机
let mobileUrl = "http://api.ithome.com/xml/newslist/phone.xml?r="

//VR
let vrUrl = "http://api.ithome.com/xml/newslist/vr.xml?r="

//Windows
let winHeaderUrl = "http://api.ithome.com/xml/slide/windows.xml?r="
let winUrl = "http://api.ithome.com/xml/newslist/windows.xml?r="
let winHeaderDertail = "http://www.ithome.com/html/win10/%ld.htm"

//智能汽车
let autoCarUrl = "http://api.ithome.com/xml/newslist/auto.xml?r="

//苹果
let appleUrl = "http://api.ithome.com/xml/newslist/ios.xml?r="
let appleHeaderUrl = "http://api.ithome.com/xml/slide/ios.xml?r="
let appHeaderDetail = "http://www.ithome.com/html/mac/%ld.htm"

//游戏电竞
let gameUrl = "http://api.ithome.com/xml/newslist/game.xml?r="

//安卓
let androidHeaderUrl = "http://api.ithome.com/xml/slide/android.xml?r="
let androidUrl = "http://api.ithome.com/xml/newslist/android.xml?r="
let androidHeaderDetail = "http://www.ithome.com/html/digi/%ld.htm"

//电脑
let pcUrl = "http://api.ithome.com/xml/newslist/pc.xml?r="

//数码
let digiUrl = "http://api.ithome.com/xml/newslist/digi.xml?r="

//评测室
let labsUrl = "http://api.ithome.com/xml/newslist/labs.xml?r="

//行业前沿
let industryUrl = "http://api.ithome.com/xml/newslist/it.xml?r="

//科普
let discoveryUrl = "http://api.ithome.com/xml/newslist/discovery.xml?r="

//网络焦点
let internetUrl = "http://api.ithome.com/xml/newslist/internet.xml?r="

//头部详情
let headerDetailUrl = "http://api.ithome.com/rss/%ld.xml?r=274749486"

//界面详情
let cellDetailUrl = "http:www.ithome.com"

/*
 =============================推荐===============================*/

//科技
let scienceUrl = "http://api.iclient.ifeng.com/ClientNews?id=KJ123,FOCUSKJ123&page=%ld&gv=5.3.1&av=0&proid=ifengnews&os=ios_10.1&vt=5&screen=1242x2208&publishid=4002&uid=ce69499a577243aeb94eebf8a115f84b&nw=wifi"

//FUN
let funUrl = "http://api.iclient.ifeng.com/ClientNews?id=DZPD,FOCUSDZPD&page=%ld&gv=5.3.1&av=0&proid=ifengnews&os=ios_10.1&vt=5&screen=1242x2208&publishid=4002&uid=ce69499a577243aeb94eebf8a115f84b&nw=wifi"

//详情页面 "id"+"documentId"
/*例如id ＝ http://api.iclient.ifeng.com/ipadtestdoc?aid=cmpp_040620044484900&channelKey=Y21wcF8xNzAwN183MTlfOSA=
 documentId = cmpp_040620044484900
*/
//详情页
let scienceDetailUrl = "http://api.iclient.ifeng.com/ipadtestdoc?aid=cmpp_040620044484900&channelKey=Y21wcF8xNzAwN183MTlfOSA="

/*
 =============================精选===============================*/

let collectPlayUrl = "http://api.3g.tudou.com/v5/channel/home?pid=35a871d7c541ba6b&network=WIFI&operator=CMCC_46002&cid=21"

//详情页面 
//http://www.tudou.com/programs/view/%ld


let collectDiscoverUrl = "http://vcis.ifeng.com/api/homePageList?adapterNo=7.0.1&channelId=41&isNotModified=1&pageSize=20&platformType=iPhone&protocol=1.0.0&requireTime=%ld"

//http://vcis.ifeng.com/api/homePageList?adapterNo=7.0.1&channelId=41&isNotModified=1&pageSize=20&platformType=iPhone&positionId=40&protocol=1.0.0

//http://vcis.ifeng.com/api/homePageList?adapterNo=7.0.1&channelId=41&isNotModified=1&pageSize=20&platformType=iPhone&positionId=60&protocol=1.0.0











