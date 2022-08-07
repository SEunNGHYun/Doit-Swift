//
//  ViewController.swift
//  dojun
//
//  Created by 윤승현 on 2022/08/07.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    
    @IBOutlet var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        
        myWebView.load(myRequest)
        // Do any additional setup after loading the view.
    }
    
}

