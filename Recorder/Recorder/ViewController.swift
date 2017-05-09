//
//  ViewController.swift
//  Recorder
//
//  Created by RincLiu on 09/05/2017.
//  Copyright © 2017 Rinc Liu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    @IBOutlet weak var btnRecord: UIButton!
    
    var recorder : AVAudioRecorder!
    var player : AVAudioPlayer!
    
    let audioFileName = "rinc.m4a"

    override func viewDidLoad() {
        super.viewDidLoad()
        RecorderHolder.checkPermission(callback: initRecorder)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnRecordClicked(_ sender: Any) {
        if RecorderHolder.checkPermission() && recorder != nil {
            if recorder.isRecording {
                recorder.stop()
                btnRecord.setTitle("playing...", for: UIControlState.normal)
            } else {
                recorder.record()
                stopPlaying()
                btnRecord.setTitle("recording...", for: UIControlState.normal)
            }
        }
    }
    
    func initRecorder() {
        if recorder == nil {
            recorder = RecorderHolder.getRecorder(storeFile: audioFileName)
            recorder.delegate = self
        }
    }
    
    func play() {
        player = PlayerHolder.getPlayer(url: recorder.url, loop: false)
        if player != nil {
            player.play()
        }
        player.delegate = self
    }
    
    func stopPlaying() {
        if player != nil && player.isPlaying {
            player.stop()
        }
    }
    
    func finishRecording() {
        if recorder != nil {
            if recorder.isRecording {
                recorder.stop()
            }
        }
    }
    
    // AVAudioRecorderDelegate:
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording()
        } else {
            play()
        }
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        if error != nil {
            let err = error! as NSError
            print("audioRecorderEncodeErrorDidOccur:\(err.localizedDescription)\n")
        }
    }
    
    // AVAudioPlayerDelegate:
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully: Bool) {
        btnRecord.setTitle("Record", for: UIControlState.normal)
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        if error != nil {
            let err = error! as NSError
            print("audioPlayerDecodeErrorDidOccur:\(err.localizedDescription)\n")
        }
    }
}

