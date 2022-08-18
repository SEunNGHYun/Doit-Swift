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
    let imgs = ["peing11.png", "peingu1.jpeg", "peing2.jpeg", "peing5.jpeg", "peing6.jpeg", "peingu4.jpeg"]
    let ping = [UIImage]()
    
    var imgIndex = 0
    var initalFontSize : CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgPinch.image = UIImage(named: imgs[0])
        imgIndex = 0
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ : )))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.doSwipeRight(_ : )))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.doSwipeLeft(_ : )))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        
        self.view.addGestureRecognizer(pinch)
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
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
    
    @objc func doSwipeRight(_ swipe: UISwipeGestureRecognizer){
        if imgIndex < imgs.count - 1 {
            imgIndex = imgIndex + 1
        }
        imgPinch.image = UIImage(named: imgs[imgIndex])
    }
    
    @objc func doSwipeLeft(_ swipe: UISwipeGestureRecognizer){
        if imgIndex > 0{
            imgIndex = imgIndex - 1
        }
        imgPinch.image = UIImage(named: imgs[imgIndex])
    }
}

