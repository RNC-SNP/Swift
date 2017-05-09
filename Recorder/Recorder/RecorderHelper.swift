//
//  Recorder.swift
//  Recorder
//
//  Created by RincLiu on 09/05/2017.
//  Copyright © 2017 Rinc Liu. All rights reserved.
//

import Foundation
import AVFoundation

class RecorderHelper {
    
    private static let recordSettings = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
        AVSampleRateKey: 12000,
        AVNumberOfChannelsKey: 1,
        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
    ]
    
    private static var recorder : AVAudioRecorder!
    
    public static func checkPermission(callback : @escaping () -> Void) {
        if !checkPermission() {
            AVAudioSession.sharedInstance().requestRecordPermission() {
                [] allowed in
                if allowed {
                    callback()
                } else {
                    print("Record permission is not granted\n")
                }
            }
        } else {
            callback()
        }
    }
    
    public static func checkPermission() -> Bool {
        return AVAudioSession.sharedInstance().recordPermission() == AVAudioSessionRecordPermission.granted
    }
    
    public static func getRecorder(file : String) -> AVAudioRecorder {
        if recorder == nil {
            do {
                let session = AVAudioSession.sharedInstance()
                try session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
                try session.setActive(true)
                let audioUrl = getDocumentsUrl().appendingPathComponent(file)
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
