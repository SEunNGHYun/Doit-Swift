//
//  ViewController.swift
//  11_Navigation
//
//  Created by 윤승현 on 2022/08/10.
//

import UIKit

class ViewController: UIViewController, EditDelegate{

    
    let lampOn = UIImage(named: "lamp_on.png")
    let lampOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = false
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var ImgView: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ImgView.image = lampOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){

        let editViewController = segue.destination as! EditViewController
        
        
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue: use Button"
        }else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue: use Bar Button"
        }
        
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
        
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            ImgView.image = lampOn
            self.isOn = true
        }else{
            ImgView.image = lampOff
            self.isOn = false
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale: CGFloat = 2.0
        var newWidth:CGFloat, newHeight: CGFloat
        if isZoom {
            newWidth = ImgView.frame.width * scale
            newHeight = ImgView.frame.height * scale
            self.isZoom = true
        }else{
            newWidth = ImgView.frame.width / scale
            newHeight = ImgView.frame.height / scale
            self.isZoom = false
        }
        print(">>>>","isZoom", isZoom, self.isZoom)


        ImgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    
}

