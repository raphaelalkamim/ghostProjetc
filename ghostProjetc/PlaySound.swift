//
//  PlaySound.swift
//  ghostProjetc
//
//  Created by Gabriel Batista on 08/06/22.
//

import Foundation
import AVFoundation

public var FirstsoundEffect: AVAudioPlayer?
public var SecondsoundEffect: AVAudioPlayer?

public func playSound(file: String) {
    let path = Bundle.main.path(forResource: file, ofType: nil)
    let url = URL(fileURLWithPath: path!)
    
    do{
        FirstsoundEffect = try AVAudioPlayer(contentsOf: url)
        FirstsoundEffect?.play()
    } catch {
        fatalError("Couldn't load file")
    }
}

public func stopSound() {
    FirstsoundEffect?.stop()
    SecondsoundEffect?.stop()
}

public func backgroundSound() {
    FirstsoundEffect?.setVolume(0.1, fadeDuration: .zero)
    SecondsoundEffect?.setVolume(1, fadeDuration: .zero)
}

public func playSecondSound(file: String) {
    let path = Bundle.main.path(forResource: file, ofType: nil)
    let url = URL(fileURLWithPath: path!)
    
    do{
        SecondsoundEffect = try AVAudioPlayer(contentsOf: url)
        SecondsoundEffect?.play()
    } catch {
        fatalError("Couldn't load file")
    }
}
