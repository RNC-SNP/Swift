//
//  PlayerHolder.swift
//  Recorder
//
//  Created by RincLiu on 09/05/2017.
//  Copyright © 2017 Rinc Liu. All rights reserved.
//

import Foundation
import AVFoundation

class PlayerHolder {
    private static var player : AVAudioPlayer!
    
    public static func getPlayer(url: URL, loop: Bool) -> AVAudioPlayer {
        if player != nil && player.isPlaying {
            player.stop()
        }
        do {
            try player = AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = loop ? -1 : 0
            if player.prepareToPlay() {
                player.play()
            }
        } catch let error as NSError {
            print("Init AudioPlayer failed:\(error.localizedDescription)\n")
        }
        return player
    }
}
