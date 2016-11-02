//
//  Const.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit

/*
 一、首页资讯：(http://api.ithome.com/xml/newslist/%ld.xml?r=889969583
 http://api.ithome.com/xml/slide/%ld.xml?r=2097124909
 详情页http:www.ithome.com%ld  例如%ld = /html/it/266842.htm
 头部详情页http://api.ithome.com/rss/%ld.xml?r=274749486)
 最新－头部http://api.ithome.com/xml/slide/slide.xml?r=2097124909
 最新         http://api.ithome.com/xml/newslist/news.xml?r=284931039
 排行榜      http://api.ithome.com/xml/newslist/rank.xml?r=872894868
 苹果－头部http://api.ithome.com/xml/slide/ios.xml?r=111612075
 苹果         http://api.ithome.com/xml/newslist/ios.xml?r=425036401
 手机         http://api.ithome.com/xml/newslist/phone.xml?r=889969583
 数码         http://api.ithome.com/xml/newslist/digi.xml?r=1804774541
 评测室      http://api.ithome.com/xml/newslist/labs.xml?r=317030735
 极客学院   http://api.ithome.com/xml/newslist/geek.xml?r=518311908
 VR             http://api.ithome.com/xml/newslist/vr.xml?r=200510169
 智能汽车   http://api.ithome.com/xml/newslist/auto.xml?r=643910596
 电脑         http://api.ithome.com/xml/newslist/pc.xml?r=1703071846
 win－头部 http://api.ithome.com/xml/slide/windows.xml?r=505698709
 windows    http://api.ithome.com/xml/newslist/windows.xml?r=1037215794
 网络焦点   http://api.ithome.com/xml/newslist/internet.xml?r=1172464625
 行业前沿   http://api.ithome.com/xml/newslist/it.xml?r=1290366664
 游戏电竞   http://api.ithome.com/xml/newslist/game.xml?r=1875935436
 科普         http://api.ithome.com/xml/newslist/discovery.xml?r=650657290
 安卓－头部http://api.ithome.com/xml/slide/android.xml?r=1489632884
 安卓         http://api.ithome.com/xml/newslist/android.xml?r=1431108416
 
 二、精选页：（tags=%ld
 详情页  例如：Link="http://www.ifanr.com/735703?utm_source=rss&utm_medium=rss&utm_campaign="）
 我的新闻  http://apinews6-front.newsrep.cn/flow/GetItems?packageId=19&articleId=0&social=1&version=600&bottomArticleId=0&handsetName=iPhone9%2C2&premium=0&mood=-1&tags=1599145%2C1599000%2C1602467%2C1600432%2C3151157%2C4932681%2C1848733%2C2288544%2C3151154%2C3255056%2C3273985%2C2661121%2C2614883%2C1598960%2C3072617%2C1293375%2C1340227%2C4923298%2C1945369%2C2184485%2C-396&regionId=10&userId=103bc6e4-a202-4a53-ae95-17acb4f7cb6a&videoOnly=0&edito=1&sortBy=1&onefeed=1&pageSize=50
 头条新闻 http://apinews6-front.newsrep.cn/flow/GetItems?packageId=19&articleId=0&social=1&version=600&bottomArticleId=0&handsetName=iPhone9%2C2&premium=0&mood=-1&tags=-54&regionId=10&userId=103bc6e4-a202-4a53-ae95-17acb4f7cb6a&videoOnly=0&edito=1&sortBy=1&onefeed=0&pageSize=50
 新能源   http://apinews6-front.newsrep.cn/flow/GetItems?packageId=19&articleId=0&social=1&version=600&bottomArticleId=0&handsetName=iPhone9%2C2&premium=0&mood=-1&tags=3151157&regionId=10&userId=103bc6e4-a202-4a53-ae95-17acb4f7cb6a&videoOnly=0&edito=1&sortBy=1&onefeed=0&pageSize=50
 VR        http://apinews6-front.newsrep.cn/flow/GetItems?packageId=19&articleId=0&social=1&version=600&bottomArticleId=0&handsetName=iPhone9%2C2&premium=0&mood=-1&tags=4932681&regionId=10&userId=103bc6e4-a202-4a53-ae95-17acb4f7cb6a&videoOnly=0&edito=1&sortBy=1&onefeed=0&pageSize=50
 智能家居http://apinews6-front.newsrep.cn/flow/GetItems?packageId=19&articleId=0&social=1&version=600&bottomArticleId=0&handsetName=iPhone9%2C2&premium=0&mood=-1&tags=3072617&regionId=10&userId=103bc6e4-a202-4a53-ae95-17acb4f7cb6a&videoOnly=0&edito=1&sortBy=1&onefeed=0&pageSize=50
 可穿戴设备http://apinews6-front.newsrep.cn/flow/GetItems?packageId=19&articleId=0&social=1&version=600&bottomArticleId=0&handsetName=iPhone9%2C2&premium=0&mood=-1&tags=3151154&regionId=10&userId=103bc6e4-a202-4a53-ae95-17acb4f7cb6a&videoOnly=0&edito=1&sortBy=1&onefeed=0&pageSize=50
 科学      http://apinews6-front.newsrep.cn/flow/GetItems?packageId=19&articleId=0&social=1&version=600&bottomArticleId=0&handsetName=iPhone9%2C2&premium=0&mood=-1&tags=1602467&regionId=10&userId=103bc6e4-a202-4a53-ae95-17acb4f7cb6a&videoOnly=0&edito=1&sortBy=1&onefeed=0&pageSize=50
 无人机   http://apinews6-front.newsrep.cn/flow/GetItems?packageId=19&articleId=0&social=1&version=600&bottomArticleId=0&handsetName=iPhone9%2C2&premium=0&mood=-1&tags=2661121&regionId=10&userId=103bc6e4-a202-4a53-ae95-17acb4f7cb6a&videoOnly=0&edito=1&sortBy=1&onefeed=0&pageSize=50
 移动支付http://apinews6-front.newsrep.cn/flow/GetItems?packageId=19&articleId=0&social=1&version=600&bottomArticleId=0&handsetName=iPhone9%2C2&premium=0&mood=-1&tags=4923298&regionId=10&userId=103bc6e4-a202-4a53-ae95-17acb4f7cb6a&videoOnly=0&edito=1&sortBy=1&onefeed=0&pageSize=50
 游戏     http://apinews6-front.newsrep.cn/flow/GetItems?packageId=19&articleId=0&social=1&version=600&bottomArticleId=0&handsetName=iPhone9%2C2&premium=0&mood=-1&tags=1600432&regionId=10&userId=103bc6e4-a202-4a53-ae95-17acb4f7cb6a&videoOnly=0&edito=1&sortBy=1&onefeed=0&pageSize=50
 大数据  http://apinews6-front.newsrep.cn/flow/GetItems?packageId=19&articleId=0&social=1&version=600&bottomArticleId=0&handsetName=iPhone9%2C2&premium=0&mood=-1&tags=3273985&regionId=10&userId=103bc6e4-a202-4a53-ae95-17acb4f7cb6a&videoOnly=0&edito=1&sortBy=1&onefeed=0&pageSize=50
 
 三、发现页：
 科技    http://vcis.ifeng.com/api/homePageList?adapterNo=7.0.1&channelId=41&isNotModified=1&pageSize=20&platformType=iPhone&protocol=1.0.0&requireTime=
 

 */

//屏幕宽、高
public let screenW = UIScreen.mainScreen().bounds.size.width
public let screenH = UIScreen.mainScreen().bounds.size.height

/*
 =============================首页资讯===============================*/

//最新
let newestHeaderUrl = "http://api.ithome.com/xml/slide/slide.xml?r="
let newestUrl = "http://api.ithome.com/xml/newslist/news.xml?r="

//手机
let mobileUrl = "http://api.ithome.com/xml/newslist/phone.xml?r="

//VR
let vrUrl = "http://api.ithome.com/xml/newslist/vr.xml?r="

//Windows
let winHeaderUrl = "http://api.ithome.com/xml/slide/windows.xml?r="
let winUrl = "http://api.ithome.com/xml/newslist/windows.xml?r="

//智能汽车
let autoCarUrl = "http://api.ithome.com/xml/newslist/auto.xml?r="

//苹果
let appleUrl = "http://api.ithome.com/xml/newslist/ios.xml?r="
let appleHeaderUrl = "http://api.ithome.com/xml/slide/ios.xml?r="

//游戏电竞
let gameUrl = "http://api.ithome.com/xml/newslist/game.xml?r="

//安卓
let androidHeaderUrl = "http://api.ithome.com/xml/slide/android.xml?r="
let androidUrl = "http://api.ithome.com/xml/newslist/android.xml?r="

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
let scienceUrl = "http://api.iclient.ifeng.com/ClientNews?id=KJ123,FOCUSKJ123&gv=5.3.0&av=0&proid=ifengnews&os=ios_10.1&vt=%ld&screen=1242x2208&publishid=4002&uid=ce69499a577243aeb94eebf8a115f84b&nw=wifi"

//时尚
let fashionHeaderurl = "http://api.iclient.ifeng.com/ipadtestdoc?aid=cmpp_020210040182940&gv=5.3.0&av=0&proid=ifengnews&os=ios_10.1&vt=%ld&screen=1242x2208&publishid=4002&uid=ce69499a577243aeb94eebf8a115f84b&nw=wifi"

let fashionUrl = "http://api.iclient.ifeng.com/ClientNews?id=SS78,FOCUSSS78&gv=5.3.0&av=0&proid=ifengnews&os=ios_10.1&vt=%ld&screen=1242x2208&publishid=4002&uid=ce69499a577243aeb94eebf8a115f84b&nw=wifi"







