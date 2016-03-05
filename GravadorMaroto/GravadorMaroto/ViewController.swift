//
//  ViewController.swift
//  GravadorSonoro
//
//  Created by Nicole Okabe on 05/03.
//  Copyright © 2016 NHO. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    //MARK: - Properties
    private var audioRecorder : AVAudioRecorder!
    private var audioPlayer : AVAudioPlayer!
    private let recordSettings = [AVSampleRateKey : NSNumber(float: Float(44100.0)),
        AVFormatIDKey : NSNumber(int: Int32(kAudioFormatMPEG4AAC)),
        AVNumberOfChannelsKey : NSNumber(int: 1),
        AVEncoderAudioQualityKey : NSNumber(int: Int32(AVAudioQuality.Medium.rawValue))]

    
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var tbPlayer: UIToolbar!
    
    
    //MARK: - Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.status.text = ""
        
        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try audioRecorder = AVAudioRecorder(directoryURL(), settings: recordSettings)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IBActions
    
    
    
    //MARK: - Methods
    private func directoryURL(){
        do{
        let urls = try NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        }catch{
            print("Errooo!!")
        }
        
        let documentDirectory = urls[0]
    }
}