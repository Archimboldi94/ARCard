//
//  P5Config.swift
//  P5Card
//
//  Created by INnoVation on 2018/11/10.
//  Copyright © 2018 INnoVation. All rights reserved.
//

import Foundation
import UIKit

class P5Config: NSObject {
    
    //Icon
    var iconStr : String        =   "xdz"
    var iconW: CGFloat          =   0.12
    var iconH: CGFloat          =   0.16
    var iconX: Float            =   -0.18
    var iconY: Float            =   0.08
    
    
    //NickName
    var nickNameStr : String        =   "Queen"
    var nickNameX: Float            =   -0.27
    var nickNameY: Float            =   -0.15
    var nickNameScaleX: Float       =   -0.1
    var nickNameScaleY: Float       =   -0.1
    
    //Name
    var nameStr : String        =   "新岛真"
    var nameX: Float            =   -0.30
    var nameY: Float            =   0.08
    var nameScaleX: Float       =   -0.1
    var nameScaleY: Float       =   -0.1
    
    //Video
    var videoStr: String     =   "p5video"
    var videoType: String    =   "mp4"
    var videoX: Float           =   -0.4
    var videoY: Float           =   0.08
    var videoW: CGFloat         =   0.3
    var videoH: CGFloat         =   0.15
    
    //taobaoWeb
    var taobaoLink: String     = "https://item.taobao.com/item.htm?spm=a230r.1.14.1.48c3a359V1lZQs&id=548610360208&ns=1&abbucket=18#detail"
    var taobaoX: Float            =   -0.6
    var taobaoY: Float            =   0.08
    var taobaoW: CGFloat          =   0.2
    var taobaoH: CGFloat          =   0.6
    
    
    //ASK
    var authorNameStr: String     = "girl"
    var authorX: Float            =   0
    var authorY: Float            =   0
    var authorRadius: CGFloat     =   0.1
    var authorH: CGFloat          =   0.001
}
