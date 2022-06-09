//
//  FaceGhostView.swift
//  ghostProjetc
//
//  Created by Raphael Alkamim on 09/06/22.
//

import Foundation
import SceneKit
import ARKit

class FaceGhostView: ViewController {
    
    @IBOutlet var sceneView: ARSCNView!
    
    let ghostOption = ["👻"]
    let features = ["testa"]
    let featureIndices = [[8], [1064], [42]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("Face tracking is not supported on this device.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARFaceTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}


extension FaceGhostView: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let device = sceneView.device else { return nil }
       
        let faceGeometry = ARSCNFaceGeometry(device: device)
        let node = SCNNode(geometry: faceGeometry)
        node.geometry?.firstMaterial?.fillMode = .lines
        node.geometry?.firstMaterial?.transparency = 0.0
        
        let testa = ImageNode(with: ghostOption)
        testa.name = "testa"
        testa.rotation = SCNVector4(0, 5, 0, GLKMathDegreesToRadians(180.0))
        node.addChildNode(testa)
        
        return node
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor, let faceGeometry = node.geometry as? ARSCNFaceGeometry else { return }
        
        faceGeometry.update(from: faceAnchor.geometry)

    }
}
