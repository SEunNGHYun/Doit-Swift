//
//  ViewController.swift
//  10_tabBar
//
//  Created by 윤승현 on 2022/08/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImage(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMoveAlert(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

