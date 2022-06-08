//
//  NewARView.swift
//  ghostProjetc
//
//  Created by Raphael Alkamim on 08/06/22.
//

import Foundation
import RealityKit
import ARKit

class NewARView: ViewController {
    
    @IBOutlet var newArView: ARView?
    @IBOutlet var countMemesDidFound: UILabel?
    
    var totalMemes: String {
        let value: Int = memes.count
        return String(value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = ARImageTrackingConfiguration()
        
        if let imagesToTrack = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main) {
            configuration.trackingImages = imagesToTrack
            configuration.maximumNumberOfTrackedImages = 1
        }
        newArView?.session.delegate = self
        newArView?.session.run(configuration)
        
        updateCountLabel()
        
    }
    
    func updateCountLabel() {
        let memesFound: String  = didFoundMemeNumb()
        let pistasText: String = " PISTAS"
        countMemesDidFound?.text = memesFound + "/" + totalMemes + pistasText
    }
    
    func didFoundMemeNumb() -> String {
        return "20"
    }
}

extension NewARView: ARSessionDelegate {
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        guard let scene = try? Experience.loadBox() else { return }
        for anchor in anchors {
            guard let imageAnchor = anchor as? ARImageAnchor,
                  let imageName = imageAnchor.name else {return}

            for meme in memes {
                if imageName == meme.imageNameAnchor {
                    let entity = AnchorEntity(anchor: imageAnchor)

                    if let object = scene.findEntity(named: meme.imageNameMeme) {
                        entity.addChild(object)
                        newArView?.scene.addAnchor(entity)
                    }
                }
            }
        }
    }
}
