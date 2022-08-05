//
//  ViewController.swift
//  Picker
//
//  Created by 윤승현 on 2022/08/05.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector : Selector = #selector(ViewController.updateTime)
    var currentTime : String? ,choiceTime : String?
    let interval = 1.0
    
    
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
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        currentTime = formatter.string(from: date as Date)
        print(currentTime)
        if (currentTime == choiceTime){
            view.backgroundColor = UIColor.red
        }else{
            view.backgroundColor = UIColor.white
        }
    }
    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        choiceTime = formatter.string(from: datePickerView.date)
        print(choiceTime)

    }
    
}

