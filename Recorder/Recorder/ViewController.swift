//
//  ViewController.swift
//  Recorder
//
//  Created by RincLiu on 09/05/2017.
//  Copyright © 2017 Rinc Liu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {
    @IBOutlet weak var btnRecord: UIButton!
    
    var isRecording : Bool!
    var isPlaying : Bool!
    var recorder : AVAudioRecorder!
    var player : AVAudioPlayer!
    
    let audioFileName = "rinc.m4a"

    override func viewDidLoad() {
        super.viewDidLoad()
        isRecording = false;
        isPlaying = false;
        prepare();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnRecordClicked(_ sender: Any) {
        if RecorderHelper.checkPermission() && recorder != nil {
            if recorder.isRecording {
                recorder.stop()
                play()
            } else {
                recorder.record()
                if player != nil {
                    player.stop()
                }
            }
        }
    }
    
    func prepare() {
        RecorderHelper.checkPermission(callback : initRecorder)
    }
    
    func initRecorder() {
        if recorder == nil {
            recorder = RecorderHelper.getRecorder(file : audioFileName)
            recorder.delegate = self
        }
    }
    
    func play() {
        do {
            try player = AVAudioPlayer(contentsOf : recorder.url)
            player.play()
        } catch let error as NSError {
            print("Init AudioPlayer failed:\(error.localizedDescription)\n")
        }
    }
    
    func finishRecording() {
        if recorder != nil {
            if recorder.isRecording {
                recorder.stop()
            }
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording()
        }
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: NSError!) {
        print("audioRecorderEncodeErrorDidOccur:\(error.localizedDescription)\n")
    }
}

