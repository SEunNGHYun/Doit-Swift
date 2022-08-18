//
//  ViewController.swift
//  19_Pinch
//
//  Created by 윤승현 on 2022/08/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgPinch: UIImageView!
    @IBOutlet var txtPinch: UILabel!
    
    var initalFontSize : CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ : )))
        
        self.view.addGestureRecognizer(pinch)
        //뷰에 제스쳐를 등록
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
//        if (pinch.state == UIGestureRecognizer.State.began){
//            initalFontSize = txtPinch.font.pointSize
//            //제스쳐가 시작이 될 때 기존의 폰트 값을 저장
//        }else{
//            txtPinch.font = txtPinch.font.withSize(initalFontSize * pinch.scale)
//            //핀치 제스쳐가 진행 중일때 기존의 폰트보다 커진다.
//        }
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
}

