//
//  ARView.swift
//  ghostProjetc
//
//  Created by Raphael Alkamim on 06/06/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(file: "opera.mp3")
    }
    
    @IBAction func startGameAction(_ sender: Any) {
        stopSound()
    }
    
}
