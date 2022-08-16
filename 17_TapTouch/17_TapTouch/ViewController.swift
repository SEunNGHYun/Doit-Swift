//
//  ViewController.swift
//  17_TapTouch
//
//  Created by 윤승현 on 2022/08/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtMessage: UILabel!
    @IBOutlet var txtTapCount: UILabel!
    @IBOutlet var txtTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch//현재 발생한 이벤트를 가져온다.
        
        txtMessage.text = "Touches Began"
        txtTapCount.text = String(touch.tapCount)
        //짜르게 연속하여 터치한 수
        txtTouchCount.text = String(touches.count)
        //터치한 손가락의 갯수
    }//터치가 시작이 됭 때 호출
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Moves"
        txtTapCount.text  = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }//손가락이 움직일 때 실행
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touched Ended"
        txtTapCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }//손가락을 때었을 때 실행


}

