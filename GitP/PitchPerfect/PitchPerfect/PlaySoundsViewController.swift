//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by martin chibwe on 7/1/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
	
	@IBOutlet weak var snailButton: UIButton!
	@IBOutlet weak var rabbitButton: UIButton!
	@IBOutlet weak var chipmunkButton: UIButton!
	@IBOutlet weak var vaderButton: UIButton!
	@IBOutlet weak var echoButton: UIButton!
	@IBOutlet weak var reverbButton: UIButton!
	@IBOutlet weak var stopButton: UIButton!
	
	
	var recordedAudioURL:URL!
	var audioFile:AVAudioFile!
	var audioEngine:AVAudioEngine!
	var audioPlayerNode: AVAudioPlayerNode!
	var stopTimer: Timer!
	
	enum ButtonType : Int{case slow = 0, fast, chipmunk, vader, echo, reverb}
	
	

    override func viewDidLoad() {
        super.viewDidLoad()
		setupAudio()
		setupScaleAspectFit()


    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		configureUI(.notPlaying)
	}
	
	
	func setupScaleAspectFit() {
		
		snailButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
		rabbitButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
		chipmunkButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
		vaderButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
		echoButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
		reverbButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
		stopButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
	}
	
	
	
	@IBAction func playSoundForButton(_ sender:AnyObject) {
		switch(ButtonType(rawValue: sender.tag)! ){
		case.slow:
			playSound(rate:0.5)
		case.fast:
			playSound(pitch:1.5)
		case.chipmunk:
			playSound(pitch:1000)
		case.vader:
			playSound(pitch: -1000)
		case.echo:
			playSound(echo:true)
		case.reverb:
			playSound(reverb:true)
		
			
		}
		configureUI(.playing)

		
		
	}
	
	@IBAction func stopButton(_ sender: AnyObject) {
		stopAudio()
	}

    



}
