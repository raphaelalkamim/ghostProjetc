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
    var isPlayingSong: Bool = false
    //var playSong: Bool = false
    
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
        var count = CheckAllMemes.shared.counter
        return String(count)
    }
    
}

extension NewARView: ARSessionDelegate {
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        guard let scene = try? Experience.loadBox() else { return }
        for anchor in anchors {
            CheckAllMemes.shared.counter += 1
            guard let imageAnchor = anchor as? ARImageAnchor,
                  let imageName = imageAnchor.name else {return}
            
            for meme in memes {
                if imageName == meme.imageNameAnchor {
                    let entity = AnchorEntity(anchor: imageAnchor)
                    
                    if let object = scene.findEntity(named: meme.imageNameMeme) {
                        entity.addChild(object)
                        newArView?.scene.addAnchor(entity)
                    }
                    
                    if imageAnchor.name == "card01" {
                        playSound(file: "yesSir.mp3")
                    } else if imageAnchor.name == "card02"{
                        playSound(file: "ieIe.mp3")
                    }
                }
            }
        }
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let imageAnchor = anchor as? ARImageAnchor else {return}
            if !imageAnchor.isTracked {
                newArView?.session.remove(anchor: imageAnchor)
            }
        }
    }
    
    func session(_ session: ARSession, didRemove anchors: [ARAnchor]) {
        stopSound()
    }
    
}

