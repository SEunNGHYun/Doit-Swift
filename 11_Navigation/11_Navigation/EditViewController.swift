//
//  EditViewController.swift
//  11_Navigation
//
//  Created by 윤승현 on 2022/08/10.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller : EditViewController, message : String)
    func didImageOnOffDone(_ controller : EditViewController, isOn : Bool)
    func didImageZoomDone(_ controller : EditViewController, isZoom : Bool)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn: Bool = false
    var isZoom: Bool = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swLamp: UISwitch!
    @IBOutlet var btnZoomInOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        txMessage.text = textMessage
        swLamp.isOn = isOn
        print("????", isZoom)
        if isZoom {
            btnZoomInOut.setTitle("축소", for: UIControl.State.normal)
        }else{
            btnZoomInOut.setTitle("확대", for: UIControl.State.normal)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func switchOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        }else{
            isOn = false
        }
    }
    
    
    @IBAction func btnZoom(_ sender: UIButton) {
        print(isZoom)
        if isZoom {
            print("축소 ㄲ")
            isZoom = false
            btnZoomInOut.setTitle("확대", for: UIControl.State.normal)
            //이미지가 확대되어있는 상태
        }else{
            print("확대 ㄲ")
            //이미지가 축소되어있는 상태
            isZoom = true
            btnZoomInOut.setTitle("축소", for: UIControl.State.normal)
        }
    }
}
