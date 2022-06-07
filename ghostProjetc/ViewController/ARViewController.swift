//
//  ARViewController.swift
//  ghostProjetc
//
//  Created by Raphael Alkamim on 06/06/22.
//

import Foundation
import RealityKit
import ARKit

class ARViewController: ViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = ARImageTrackingConfiguration()
        
        if let imagesToTrack = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main) {
            configuration.trackingImages = imagesToTrack
            configuration.maximumNumberOfTrackedImages = 1
        }
        arView.session.delegate = self
        arView.session.run(configuration)
        
    }
}

let memes: [MemeModel] = [
    MemeModel(imageNameAnchor: "card01", imageNameMeme: "Anna"),
    MemeModel(imageNameAnchor: "card02", imageNameMeme: "Triz"),
    MemeModel(imageNameAnchor: "card03", imageNameMeme: "Bianca"),
    MemeModel(imageNameAnchor: "card04", imageNameMeme: "Ortega"),
    MemeModel(imageNameAnchor: "card05", imageNameMeme: "Taus"),
    MemeModel(imageNameAnchor: "card06", imageNameMeme: "Muza"),
    MemeModel(imageNameAnchor: "card07", imageNameMeme: "Claudinha"),
    MemeModel(imageNameAnchor: "card08", imageNameMeme: "Debs"),
    MemeModel(imageNameAnchor: "card09", imageNameMeme: "Felipe"),
    MemeModel(imageNameAnchor: "card10", imageNameMeme: "Fran"),
    MemeModel(imageNameAnchor: "card11", imageNameMeme: "Bahia"),
    MemeModel(imageNameAnchor: "card12", imageNameMeme: "Batista"),
    MemeModel(imageNameAnchor: "card13", imageNameMeme: "Namie"),
    MemeModel(imageNameAnchor: "card14", imageNameMeme: "Guilherme"),
    MemeModel(imageNameAnchor: "card15", imageNameMeme: "Pimenta"),
    MemeModel(imageNameAnchor: "card16", imageNameMeme: "Juliana"),
    MemeModel(imageNameAnchor: "card17", imageNameMeme: "Leticia"),
    MemeModel(imageNameAnchor: "card18", imageNameMeme: "Luca"),
    MemeModel(imageNameAnchor: "card19", imageNameMeme: "Pera"),
    MemeModel(imageNameAnchor: "card20", imageNameMeme: "Chevis"),
    MemeModel(imageNameAnchor: "card21", imageNameMeme: "Marcus"),
    MemeModel(imageNameAnchor: "card22", imageNameMeme: "Mari"),
    MemeModel(imageNameAnchor: "card23", imageNameMeme: "Nathy"),
    MemeModel(imageNameAnchor: "card24", imageNameMeme: "Rapha"),
    MemeModel(imageNameAnchor: "card25", imageNameMeme: "Becca"),
    MemeModel(imageNameAnchor: "card26", imageNameMeme: "Tali"),
    MemeModel(imageNameAnchor: "card27", imageNameMeme: "Thata"),
    MemeModel(imageNameAnchor: "card28", imageNameMeme: "Thallis"),
    MemeModel(imageNameAnchor: "card29", imageNameMeme: "GK"),
    MemeModel(imageNameAnchor: "card30", imageNameMeme: "Cheng"),
    MemeModel(imageNameAnchor: "card31", imageNameMeme: "Paulinha"),
    MemeModel(imageNameAnchor: "card32", imageNameMeme: "Cacique"),
    MemeModel(imageNameAnchor: "card33", imageNameMeme: "Joca"),
    MemeModel(imageNameAnchor: "card34", imageNameMeme: "Chevao"),
    MemeModel(imageNameAnchor: "card35", imageNameMeme: "Basile")
]

extension ARViewController: ARSessionDelegate {
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
                        arView.scene.addAnchor(entity)
                    }

                }

            }
        }
    }
}
