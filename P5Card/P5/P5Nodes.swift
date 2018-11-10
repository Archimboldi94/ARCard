//
//  P5Nodes.swift
//  P5Card
//
//  Created by INnoVation on 2018/11/10.
//  Copyright © 2018 INnoVation. All rights reserved.
//

import Foundation
import ARKit

enum P5NodeFactory {
    
   static func makeIconNode(_ rootNode: SCNNode) -> SCNNode {
        let image = SCNBox(width: P5Config().iconW, height: P5Config().iconH, length: 0.005, chamferRadius: 0)
        image.firstMaterial?.diffuse.contents = UIImage.init(named: P5Config().iconStr)
        
        let iconNode = SCNNode(geometry: image)
        iconNode.position   = rootNode.position
        iconNode.position.x = P5Config().iconX
        iconNode.position.y = P5Config().iconY
        return iconNode
    }
    
   static func makeNameNode(_ rootNode: SCNNode) -> SCNNode {
        let text = SCNText(string: P5Config().nickNameStr, extrusionDepth: 0.01)
        text.font = UIFont.systemFont(ofSize: 0.4)
        text.flatness = 0.01
        text.alignmentMode = CATextLayerAlignmentMode.left.rawValue;
    
        let oneTextMaterial = SCNMaterial()
        oneTextMaterial.diffuse.contents = UIColor.red
        text.materials = [oneTextMaterial]
    
        let textNode = SCNNode(geometry: text)
        textNode.position = rootNode.position
        textNode.position.x = P5Config().nickNameX
        textNode.position.y = P5Config().nickNameY
        textNode.scale   = rootNode.scale
        textNode.scale.x = P5Config().nickNameScaleX
        textNode.scale.y = P5Config().nickNameScaleY
        textNode.eulerAngles.z = -.pi
        return textNode
    }
    
    static func makeVideoNode(_ rootNode: SCNNode) -> SCNNode {
        let plane = SCNPlane(width: P5Config().videoW, height: P5Config().videoH)
        // plane.firstMaterial?.diffuse.contents = UIColor.red
        plane.firstMaterial?.isDoubleSided = true
        
        let boxNode        = SCNNode(geometry: plane)
        boxNode.position   = rootNode.position
        boxNode.position.x = P5Config().videoX
        boxNode.position.y = P5Config().videoY
        boxNode.eulerAngles.y = -.pi
        
       
        guard  let filePath = Bundle.main.path(forResource: P5Config().videoStr, ofType: P5Config().videoType)
             else{
            print("没找到本地视频地址,试着打开build Phases中的 copy Bundle Resources点击下面的+把你需求的文件添加进去,或者播放网络视频")
            return SCNNode()
        }
        let videoURL = URL(fileURLWithPath: filePath)
        let avplayer = AVPlayer(url: videoURL)
        avplayer.volume = 0.0
        
        let videoNode       = SKVideoNode(avPlayer: avplayer)
        //    NotificationCenter.default.addObserver(self, selector: #selector(playEnd(notify:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        videoNode.size      = CGSize(width: 300, height: 150)
        videoNode.position  = CGPoint(x: videoNode.size.width/2, y: videoNode.size.height/2)
        videoNode.zRotation = CGFloat(Float.pi)
        
        let skScene         = SKScene()
        skScene.addChild(videoNode)
        skScene.size        = videoNode.size
        skScene.scaleMode   = .aspectFit
        plane.firstMaterial?.diffuse.contents = skScene
        videoNode.play()
        
        
        return boxNode
    }
    
    static func makeWebNode(_ rootNode: SCNNode) -> SCNNode {
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
        webView.loadRequest(NSURLRequest(url:NSURL.init(string:P5Config().taobaoLink)! as URL) as URLRequest)
        let node = SCNNode()
        node.geometry   = SCNPlane(width: P5Config().taobaoW, height: P5Config().taobaoH)
        node.geometry?.firstMaterial?.diffuse.contents = webView
        node.position   = rootNode.position
        node.position.x = P5Config().taobaoX
        node.position.y = P5Config().taobaoY
        node.position.z = node.position.z + 0.04
        
        return node
    }
    
}
