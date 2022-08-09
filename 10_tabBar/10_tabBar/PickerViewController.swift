//
//  ViewController.swift
//  Dojaun
//
//  Created by 윤승현 on 2022/08/06.
//

import UIKit

class PickerViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var imageOn : UIImage?
    var imageOff :  UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: "lamp-on.png")
        
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        if sender.isOn {
                imageView.image = UIImage(named: "lamp-on.png")
            }else{
                imageView.image = UIImage(named: "lamp-off.png")
            }
    }
}

