//
//  PlaySound.swift
//  ghostProjetc
//
//  Created by Gabriel Batista on 08/06/22.
//

import Foundation
import AVFoundation

public var soundEffect: AVAudioPlayer?

public func playSound(file: String) {
    let path = Bundle.main.path(forResource: file, ofType: nil)
    let url = URL(fileURLWithPath: path!)
    
    do{
        soundEffect = try AVAudioPlayer(contentsOf: url)
        soundEffect?.play()
    } catch {
        fatalError("Couldn't load file")
    }
}
