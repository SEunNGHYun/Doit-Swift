//
//  ViewController.swift
//  13_audio
//
//  Created by 윤승현 on 2022/08/12.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate{
    
    var audioPlayer : AVAudioPlayer!
    var audioFile : URL!
    let MAX_VOLUME : Float = 10.0
    
    var progressTimer : Timer!
    
    let timePlayerSelector: Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector : Selector = #selector(ViewController.updateRecordTime)
    
    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    @IBOutlet var lblRecordTime: UILabel!
    
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var btnRecord: UIButton!
    
    @IBOutlet var slVolume: UISlider!
    
    var audioRecorder : AVAudioRecorder!
    var isRecordMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectAudioFile()
        if !isRecordMode {
            initPlay()
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
        }else{
            initRecord()
        }
        //모드에 따라 초기설정이 다름
    }
    
    func selectAudioFile(){
        if !isRecordMode{
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        }else{
            let documentDirectory = FileManager.default.urls(for : .documentDirectory, in : .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
            //기록모드일 때 파일을 생성한다.
        }
    }
    
    func initRecord(){
        let recordSettings = [
            AVFormatIDKey : NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
            //음질은 최고
            AVEncoderBitRateKey : 320000, //비트율
            AVNumberOfChannelsKey : 2,//오디오 채널
            AVSampleRateKey : 44100.0] as [String : Any]
        //녹음에 대한 설정
        do {
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        }catch let err as NSError {
            print("Error - initRecord : ", err)
        }
        //audioRecorder 인스턴스를 생성
        audioRecorder.delegate = self
        
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lblEndTime.text = convertNSTimeInterval2String(0)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButton(false, pause: false, stop: false)
        let session = AVAudioSession.sharedInstance()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode : .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch  let err as NSError {
            print("Error- setCategory : ", err)
        }
        do {
            try session.setActive(true)
        } catch let err as NSError {
            print("Error-setActive : ", err)
        }
    }
    
    func initPlay(){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }catch let err as NSError {
            print("errer initPlay : ", err)
        }
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value //볼륨 값을 정함
        
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        //오디오 실행시간 00:00형식으로 나타냄
        lblCurrentTime.text = convertNSTimeInterval2String(0) //00:00로 시간 초기화
        setPlayButton(true, pause: false, stop: false)
    }
    
    func convertNSTimeInterval2String(_ time:TimeInterval)-> String {
        let min = Int(time/60) //초를 분으로 변경
        let sec = Int(time.truncatingRemainder(dividingBy: 60))//분으로 만들고 남은 초
        let strTime = String(format: "%02d:%02d", min, sec)//분과 초를 00:00형식으로 만듬
        return strTime
    }
    
    func setPlayButton(_ play:Bool, pause: Bool, stop:Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButton(false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
        //초 시작
    }
    
    @objc func updatePlayTime(){
        lblCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
        //노래의 진행률을 보여줌
    }
    
    @objc func updateRecordTime(){
        lblRecordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButton(true, pause: false, stop: false)
    }
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButton(true, pause: false, stop: false)
        progressTimer.invalidate()//타이머 무효화
    }
    
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        progressTimer.invalidate()
        setPlayButton(true, pause: false, stop: false)
    }//오디오 재생이 끝나면 맨 처음으로 돌아오는 기능을 가진 함수
    
    @IBAction func swRecordMode(_ sender: UISwitch) {
        if sender.isOn{
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblRecordTime!.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
        }else{
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = convertNSTimeInterval2String(0)
        }
        selectAudioFile()
        //모드에 따라 파일을 선택해서 재생할지 생성해서 녹음할지 결정해주는 함수
        if !isRecordMode {
            initPlay()
        }else{
            initRecord()
        }
    }
    
    @IBAction func btnRecord(_ sender: UIButton) {
        if (sender as AnyObject).titleLabel?.text == "Record" {
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State()) //버튼의 title을 변경하는 함수
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        }else{
            audioRecorder.stop()
            progressTimer.invalidate()
            (sender as AnyObject).setTitle("Record", for: UIControl.State()) //버튼의 title을 변경하는 함수
            btnPlay.isEnabled = true
            initPlay()
        }
    }
}

