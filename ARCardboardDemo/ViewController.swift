//
//  ViewController.swift
//  ARCardboardDemo
//
//  Created by Aleksey Bykhun on 24/01/21.
//  Copyright © 2021 Palle Klewitz. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import GVRKit
import GVRSCNRenderer

class ViewController: UIViewController, ARSCNViewDelegate {

//    @IBOutlet var sceneView: ARSCNView!
//
    func createRenderer() -> GVRRenderer {

//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        let scene = SCNScene(named: "art.scnassets/castle.usdz")!
        
//         For 6DOF Tracking:
        let renderer = GVRSCNARTrackingRenderer(scene: scene)
        renderer.showsTrackingFeatures = true
        
//        let renderer = GVRSCNRenderer(scene: scene)
        
        
        return renderer
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

//
//        // Create scene:
//        let scene: SCNScene = ...
//
//        // For SceneKit Rendering without world tracking:
//        let renderer = GVRSCNRenderer(scene: scene)
//
//        // For 6DOF Tracking:
//        let renderer = GVRSCNARTrackingRenderer(scene: scene)
//
//        // Create Cardboard view and pass renderer
//        let view = GVRRendererView(renderer: renderer)
//
//
//        // Set the view's delegate
//        sceneView.delegate = self
//
//        // Show statistics such as fps and timing information
//        sceneView.showsStatistics = true
//
        
        // Create Cardboard view and pass renderer
        let vc = GVRRendererViewController(renderer: self.createRenderer())!
        
        vc.delegate = self
        
        vc.view.frame = self.view.bounds
        vc.view.autoresizingMask = .flexibleWidth
        
        
        self.view.addSubview(vc.view)
        addChild(vc)
        
        vc.rendererView.renderer.vrModeEnabled = true
        
        // Set the scene to the view
//        sceneView.scene = scene
//        sceneView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//
//        // Create a session configuration
//        let configuration = ARWorldTrackingConfiguration()
//
//        // Run the view's session
//        sceneView.session.run(configuration)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
//        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
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


extension ViewController: GVRRendererViewControllerDelegate {
    
//    func glkViewControllerUpdate(_ controller: GLKViewController) {
//        print("glkView", controller)
//    }
//
    
    func renderer(for displayMode: GVRDisplayMode) -> GVRRenderer! {
        print("display mode", displayMode)
        
        return self.createRenderer()
    }
    
//    func glkView(_ view: GLKView, drawIn rect: CGRect) {
//        print("glkView", view, rect)
//    }

}

extension ViewController: GLKViewDelegate {
    
    func glkView(_ view: GLKView, drawIn rect: CGRect) {
        print("glkView", view, rect)
    }
}
