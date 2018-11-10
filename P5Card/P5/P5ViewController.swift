//
//  P5ViewController.swift
//  P5Card
//
//  Created by INnoVation on 2018/11/10.
//  Copyright © 2018 INnoVation. All rights reserved.
//

import UIKit
import ARKit

class P5ViewController: UIViewController {
    
    var sceneView         : ARSCNView!
    var planeNode         = SCNNode()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetTrackingConfiguration()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView          = ARSCNView(frame: view.frame)
        sceneView.delegate = self
        view.addSubview(sceneView)
        
        configureLighting()
        addTapGestureToSceneView()
    }
    
    // MARK: 设置自动环境光.
    func configureLighting() {
        sceneView.autoenablesDefaultLighting   = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    func resetTrackingConfiguration() {
        
        if #available(iOS 12.0, *) {
            let configuration = ARImageTrackingConfiguration()
            guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
                fatalError("Missing expected asset catalog resources.")
            }
            
            configuration.trackingImages = referenceImages
            
            sceneView.session.run(configuration)
        }
    }
    
    
    func addTapGestureToSceneView() {
        
        let tapGestureRecognizer_Switch = UISwipeGestureRecognizer(target: self, action: #selector(makefadeAction(_:)))
        tapGestureRecognizer_Switch.numberOfTouchesRequired = 2 //手指数
        tapGestureRecognizer_Switch.direction               = .up
        
        sceneView.addGestureRecognizer(tapGestureRecognizer_Switch)
        
    }
    
    @objc func makefadeAction(_ recognizer: UISwipeGestureRecognizer) {
        sceneView.removeGestureRecognizer(recognizer)
        
        
        let fadeAction : SCNAction = .sequence([
                                     .fadeOpacity(to: 0.5, duration: 0.5),
                                     .moveBy(x: 0, y: -0.2, z: -0.02, duration: 0.5),
                                     .fadeOpacity(to: 0.0, duration: 0.3),
                                     .moveBy(x: 0, y: -3, z: -0, duration: 0.3)])
        
        
        for node in self.planeNode.childNodes{
            node.runAction(fadeAction)
        }
        
    }
    
    func addInfoNodes() {
        
        let node = self.planeNode
        
        node.addChildNode(P5NodeFactory.makeIconNode(node))
        node.addChildNode(P5NodeFactory.makeNameNode(node))
        node.addChildNode(P5NodeFactory.makeVideoNode(node))
        node.addChildNode(P5NodeFactory.makeWebNode(node))
        
    }
    
   
    
    
}


extension P5ViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        DispatchQueue.main.async {
            guard let imageAnchor = anchor as? ARImageAnchor,
                let imageName   = imageAnchor.referenceImage.name else { return }
    
            print("已经识别出了图片 imageName == \(imageName)")

            let image = imageAnchor.referenceImage
            let plane = SCNPlane(width : image.physicalSize.width,
                                 height: image.physicalSize.height)
            plane.firstMaterial?.diffuse.contents = UIColor.clear
            
            let planeNode_temp           = SCNNode(geometry: plane)
            planeNode_temp.eulerAngles.x = -.pi / 2
            self.planeNode = planeNode_temp
            
            node.addChildNode(self.planeNode)
            
            self.addInfoNodes()
        }
    }
    
}
