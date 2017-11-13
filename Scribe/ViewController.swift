//
//  ViewController.swift
//  Scribe
//
//  Created by Petr on 13.11.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit
import AVFoundation
import Speech


class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var transcriptTextField: UITextView!
    
    var audioPlayer: AVAudioPlayer!
    var togglePlayBtn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activitySpinner.isHidden = true
        
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
        activitySpinner.stopAnimating()
        activitySpinner.isHidden = true
    }
    
    func requestSpeechAuth() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        
                    } catch {
                        print("error")
                    }
                    
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) {
                        (result, error) in
                        if let error = error {
                            print("there was an error \(error)")
                        } else {
                            print()
                            
                        }
                    }
                }
                
                
            }
        }
        
    }
    
    @IBAction func playBtnPressed(_ sender: Any) {
        if togglePlayBtn == false {
            togglePlayBtn = true
            activitySpinner.isHidden = false
            activitySpinner.startAnimating()
            requestSpeechAuth()
            
        } else {
            togglePlayBtn = false
//            activitySpinner.isHidden = true
//            activitySpinner.stopAnimating()
            audioPlayer.stop()
            
        }
    }
    
    
}

