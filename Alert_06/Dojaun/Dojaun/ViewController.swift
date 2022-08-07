//
//  ViewController.swift
//  Dojaun
//
//  Created by 윤승현 on 2022/08/06.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector : Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var isAlarm = false
    var currnetTime : String = "" , change : String = ""
    @IBOutlet var lb1currentTime: UILabel!
    @IBOutlet var lb1changeTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        
    }
    
    @objc func updateTime(){
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        lb1currentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        
       
    }

    @IBAction func dateChange(_ sender: UIDatePicker) {
        let datePicker = sender
        let date = NSDate()

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        change = formatter.string(from: datePicker.date)
        currnetTime = formatter.string(from: date as Date)
        
        lb1changeTime.text = "선택시간 : " + formatter.string(from: datePicker.date)
        
        if currnetTime == change {
            isAlarm = true
        }
        
        if isAlarm == true {
            let alarmAlert = UIAlertController(title: "알람", message: "알어날 시간", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "끄기", style: UIAlertAction.Style.default) {
                ACTION in self.isAlarm = false
            }
            
            alarmAlert.addAction(alertAction)
            present(alarmAlert, animated: true, completion: nil)
        }

    }
    
}

