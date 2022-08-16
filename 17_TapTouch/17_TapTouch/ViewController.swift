//
//  ViewController.swift
//  17_TapTouch
//
//  Created by 윤승현 on 2022/08/16.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var tfLineWidth: UITextField!
    
    var lastPoint : CGPoint!
    var lineSize : CGFloat! = 2.0
    var lineColor = UIColor.red.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tfLineWidth.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lastPoint = touch.location(in: imgView)
        //터치된 위치를 저장
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imgView)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        lastPoint = currPoint
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imgView)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imgView.image = nil
        }
    }
    
    @IBAction func btnClearImgView(_ sender: UIButton) {
        imgView.image = nil
    }
    
    @IBAction func btnChageColorBlack(_ sender: Any) {
        lineColor = UIColor.black.cgColor
        
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
    }
    @IBAction func btnChangeColorYellow(_ sender: Any) {
        lineColor = UIColor.yellow.cgColor
 
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
    }
    @IBAction func btnChangeColotRed(_ sender: Any) {
        lineColor = UIColor.red.cgColor
        
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let width = Float(tfLineWidth.text!)
        lineSize = CGFloat(width!)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        return true
    }
    
}

