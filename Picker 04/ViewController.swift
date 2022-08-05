//
//  ViewController.swift
//  Picker
//
//  Created by 윤승현 on 2022/08/05.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector : Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0

    @IBOutlet var Ib1CurrentTime: UILabel!
    @IBOutlet var Ib1PickerTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @objc func updateTime(){
    
        let date = NSDate()
        //현재 시간을 NSDate 함수를 사용하여 가져오기
            
        let formatter = DateFormatter() //날짜를 출력할 수 있도록 하는 클래스선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        Ib1CurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    }
    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        Ib1PickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
    }
    
}

