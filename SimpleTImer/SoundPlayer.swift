//
//  SoundPlayer.swift
//  AlertView
//
//  Created by tony giaccone on 7/29/23.
//

import Foundation


import AVFoundation

class SoundPlayer {
    
    static var audioPlayer : AVPlayer!

    static func playAlarm() {
        // need to declare local path as url soundfile: ".mp3"
        let url = Bundle.main.url(forResource: "Electronic_Chime", withExtension: "mp3")
        // now use declared path 'url' to initialize the player
        if let soundUrl =  url {
            audioPlayer = AVPlayer.init(url: soundUrl)
            // after initialization play audio its just like click on play button
            audioPlayer.play()
        }
    }

}
