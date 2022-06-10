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
    @IBOutlet weak var countMemesDidFound: UILabel?
    @IBOutlet weak var ghostButton: UIButton!
    
    var totalFoundText = "" {
        didSet {
            countMemesDidFound?.text = " PISTAS \(didFoundMemes.count) / \(memes.count)"
        }
    }

    var isPlayingSong: Bool = false
    var didFoundMemes: [String] = UserDefaults().array(forKey: "memesFound") as? [String] ?? []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = ARImageTrackingConfiguration()
        
        if let imagesToTrack = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main) {
            configuration.trackingImages = imagesToTrack
            configuration.maximumNumberOfTrackedImages = 1
        }
        
        newArView?.session.delegate = self
        newArView?.session.run(configuration)
        
        countMemesDidFound?.text = " PISTAS \(didFoundMemes.count) / \(memes.count)"
        ghostButton.isHidden = true
        if didFoundMemes.count >= 30 {
            ghostButton.isHidden = false
        }
    }
    
    func countMemesFound(nameCard: String) {
        for i in 0..<didFoundMemes.count {
            if nameCard == didFoundMemes[i] {
                return
            }
        }
        didFoundMemes.append(nameCard)
        UserDefaults().set(didFoundMemes, forKey: "memesFound")
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
                    
                    if imageAnchor.name == "card09" {
                        playSound(file: "yesSir.mp3")
                    } else if imageAnchor.name == "card18"{
                        playSound(file: "ieIe.mp3")
                    } else if imageAnchor.name == "card29"{
                        playSound(file: "ieIe.mp3")
                    }
                    countMemesFound(nameCard: meme.imageNameAnchor)
                    DispatchQueue.main.async { [self] in
                        self.countMemesDidFound?.text = " PISTAS \(didFoundMemes.count) / \(memes.count)"
                        if didFoundMemes.count >= 35 {
                            ghostButton.isHidden = false
                        }
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

