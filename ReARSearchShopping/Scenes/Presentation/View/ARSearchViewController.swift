//
//  ARSearchViewController.swift
//  ReARSearchShopping
//
//  Created by 副島拓哉 on 2021/04/03.
//

import UIKit
import ARKit
import SceneKit
import FloatingPanel

class ARSearchViewController: UIViewController, ARSCNViewDelegate, FloatingPanelControllerDelegate {
    @IBOutlet weak var sceneView: ARSCNView!
    
    var xyz: float_t = 0.2
    var isFirst = true
    var times = true
    var fpc = FloatingPanelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // 特徴点を表示
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

        // ライト追加
        sceneView.autoenablesDefaultLighting = true;
        
        // タップした時のaction追加
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.sceneView.addGestureRecognizer(tapScreen)
        
        let arVC = ARFloatingViewController()
            fpc.delegate = self
            fpc.set(contentViewController: arVC)
            fpc.addPanel(toParent: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        //平面認識
        configuration.planeDetection = .horizontal

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        DispatchQueue.main.async {
            if self.isFirst {
                self.isFirst = false
            }
            else if self.isFirst == false && self.times == true{
        let BoxNode = SCNNode()
            BoxNode.geometry = SCNBox(width: CGFloat(self.xyz), height: CGFloat(self.xyz), length: CGFloat(self.xyz), chamferRadius: 0)
                BoxNode.position.y += Float(0.05)
                BoxNode.rotation = SCNVector4(0, 1, 0, 0)
                node.addChildNode(BoxNode)
                self.times = false
            }
        }
    }
    
    @objc func tapped(sender: UITapGestureRecognizer) {
        // タップされた位置のARアンカーを探す
        let tapLocation = sender.location(in: sceneView)
        let hitTest = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)

        // タップした箇所が取得できていればアンカーを追加
        if !hitTest.isEmpty {
            let anchor = ARAnchor(transform: hitTest.first!.worldTransform)
            sceneView.session.add(anchor: anchor)
        }
    }
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}


