//
//  ViewController.swift
//  testURL
//
//  Created by KaiChieh on 09/02/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
// https://alerts.ncdr.nat.gov.tw/RSS.aspx
// https://www.cnswift.org/working-with-json-in-swift.html

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    var entry: Entry?
    var synth: AVSpeechSynthesizer?


    // MARK: - IBOutlet
    @IBOutlet weak var outletTextView: UITextView!
    @IBOutlet weak var outletButton: UIButton!

    // MARK: - IBAction
    @IBAction func buttonClick(_ sender: UIButton) {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayback) // AVAudioSessionCategoryPlayAndRecord AVAudioSessionCategoryPlayback AVAudioSessionCategoryAmbient AVAudioSessionCategorySoloAmbient
            try AVAudioSession.sharedInstance().setActive(true)
            try audioSession.setMode(AVAudioSessionModeSpokenAudio) // AVAudioSessionModeSpokenAudio AVAudioSessionModeDefault AVAudioSessionCategoryPlayback
            
        }catch let error as NSError {
            print(error.code)
        }
        if let speakText = entry?.summary {
//            let utterance = AVSpeechUtterance(string: "特別是剛做過語")
            let utterance = AVSpeechUtterance(string: speakText)
            //        utterance = AVSpeechUtterance(string: "Unity")
            utterance.rate = AVSpeechUtteranceDefaultSpeechRate // AVSpeechUtteranceDefaultSpeechRate 0.1
            utterance.pitchMultiplier = 1.0 // 0.5 ~ 2.0
            utterance.preUtteranceDelay = 0.3
            utterance.postUtteranceDelay = 0.3
            utterance.volume = 1 // default 1 0.0 ~ 1.0
            utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW") //zh-TW en-US
            self.synth?.speak(utterance)
            //        synth?.delegate = self
        }

    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        outletTextView.text = entry?.summary
        outletButton.setTitle(entry?.title, for: .normal)
        
        synth = AVSpeechSynthesizer()

    }
    override func viewWillAppear(_ animated: Bool) {
    }


}
