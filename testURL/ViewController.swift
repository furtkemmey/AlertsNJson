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
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUpdated: UILabel!
    
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
            let utterance = AVSpeechUtterance(string: speakText)
            utterance.rate = AVSpeechUtteranceDefaultSpeechRate // AVSpeechUtteranceDefaultSpeechRate 0.1
            utterance.pitchMultiplier = 1.0 // 0.5 ~ 2.0
            utterance.preUtteranceDelay = 0.3
            utterance.postUtteranceDelay = 0.3
            utterance.volume = 1 // default 1 0.0 ~ 1.0
            utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW") //zh-TW en-US
            self.synth?.speak(utterance)
        }

    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        outletTextView.text = entry?.summary
//        outletButton.setTitle("Speak", for: .normal)
        lblTitle.text = entry?.title
        lblName.text = entry?.author
        lblUpdated.text = entry?.updated

        outletTextView.translatesAutoresizingMaskIntoConstraints = true
        outletTextView.sizeToFit()
        outletTextView.isScrollEnabled = false
//        outletTextView.layoutManager.allowsNonContiguousLayout = false

        
        
        synth = AVSpeechSynthesizer()

    }
    override func viewWillAppear(_ animated: Bool) {
    }
    // MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "showMAP":
                if  let seguedToMVC = segue.destination as? ViewControllerMapView {
                        seguedToMVC.entry = entry
                }
            default: break
            }
        }
    }


}
