//
//  Recorder.swift
//  Recorder
//
//  Created by RincLiu on 09/05/2017.
//  Copyright © 2017 Rinc Liu. All rights reserved.
//

import Foundation
import AVFoundation

class RecorderHolder {
    
    private static let recordSettings = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
        AVSampleRateKey: 44100,
        AVNumberOfChannelsKey: 2,
        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
    ]
    
    private static var recorder : AVAudioRecorder!
    
    public static func checkPermission(callback: @escaping () -> Void) {
        if !checkPermission() {
            AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool) -> Void in
                if granted {
                    callback()
                } else {
                    print("Record permission is not granted\n")
                }
            })
        } else {
            callback()
        }
    }
    
    public static func checkPermission() -> Bool {
        return AVAudioSession.sharedInstance().recordPermission() == AVAudioSessionRecordPermission.granted
    }
    
    public static func getRecorder(storeFile: String) -> AVAudioRecorder {
        if recorder == nil {
            do {
                let session = AVAudioSession.sharedInstance()
                try session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
                try session.setActive(true)
                let audioUrl = getDocumentsUrl().appendingPathComponent(storeFile)
                recorder = try AVAudioRecorder(url: audioUrl, settings: recordSettings)
                recorder.prepareToRecord()
            } catch let error as NSError {
                print("Init AudioRecorder failed:\(error.localizedDescription)\n")
            }
        }
        return recorder
    }
    
    private static func getDocumentsUrl() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0]
    }
}
