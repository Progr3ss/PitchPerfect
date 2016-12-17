//
//  RecordingSoundsViewController.swift
//  PitchPerfect
//
//  Created by martin chibwe on 6/30/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import AVFoundation

class RecordingSoundsViewController: UIViewController, AVAudioRecorderDelegate {
	
	var audioRecorder:AVAudioRecorder!
	
	@IBOutlet weak var recordingButton: UIButton!
	@IBOutlet weak var stopRecordingButton: UIButton!
	@IBOutlet weak var recordingLabel: UILabel!
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		stopRecordingButton.isEnabled = false
		// Do any additional setup after loading the view, typically from a nib.
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		stopRecordingButton.isEnabled = false

	}


	
	//MARK: AudioRecordingDelegates
	func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {

		if (flag){
			performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
		}else{
			print("Saving of recording failed")
		}
		
	}

	@IBAction func RecordAudio(_ sender: AnyObject) {
		

		
		setUIStateForRecording(true)
		
		//create path to audio file
		let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
		
		let recordingName = "recordedVoice.mov"
		let pathArray = [dirPath,recordingName]
		let filePath = NSURL.fileURL(withPathComponents: pathArray)
		//let filePath = URL(
		//let filePath = URL(fileURLWithPath: pathArray)
		let session = AVAudioSession.sharedInstance()
		try!session.setCategory(AVAudioSessionCategoryPlayAndRecord)

		try! audioRecorder = AVAudioRecorder(url: filePath!,settings: [:])
		audioRecorder.delegate = self
		audioRecorder.isMeteringEnabled = true
		audioRecorder.prepareToRecord()
		audioRecorder.record()

		
		
	}
	
	
	func setUIStateForRecording(_ isRecording: Bool) {
		recordingLabel.text = isRecording ? "Recording in Progress" : "Tap to Record"
		recordingButton.isEnabled = !isRecording
		stopRecordingButton.isEnabled = isRecording
	}
	

	@IBAction func stopRecording(_ sender: AnyObject) {
		
		setUIStateForRecording(false)
		audioRecorder.stop()
		recordingLabel.text = "Tap to Record"
		let audioSession = AVAudioSession.sharedInstance()
		try! audioSession.setActive(false)
		

	}

	
	//MARK:PrepareForSegue
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "stopRecording" {
			let playSoundVC = segue.destination as! PlaySoundsViewController
		    let recordedAudioURL = sender as! URL
			
			playSoundVC.recordedAudioURL = recordedAudioURL
		
		}
	}
}


