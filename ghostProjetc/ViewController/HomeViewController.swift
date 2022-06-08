//
//  ARView.swift
//  ghostProjetc
//
//  Created by Raphael Alkamim on 06/06/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var logoView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(file: "opera.mp3")
        oscillation(image: logoView)
    }
    
    @IBAction func startGameAction(_ sender: Any) {
        backgroundSound()
        playSecondSound(file: "ieIe.mp3")    }
    
    
    func oscillation(image: UIImageView) {
            let posA = CGPoint(x: 20, y: 188)
            
            var newPos: CGPoint
            
            if(__CGPointEqualToPoint(image.center, posA)) {
                newPos = image.center
            } else {
                newPos = posA
            }
            
            UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat, .autoreverse], animations: {
                image.center = newPos
            })
            
        }
    
}
