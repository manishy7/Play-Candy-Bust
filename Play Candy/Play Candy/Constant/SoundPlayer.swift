//
//  SoundPlayer.swift
//  GoodList
//
//  Created by Manish Yadav on 19/09/21.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch {
            print("Could not find and play the sound file. ")
        }
    }
}
