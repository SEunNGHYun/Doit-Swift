//
//  ViewController.swift
//  PageMove_09
//
//  Created by 윤승현 on 2022/08/09.
//

import UIKit

class ViewController: UIViewController {
    
    var numbers = [1,2,3,4,5,6,7,8,9,10]

    @IBOutlet var lblNumbers: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = numbers.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.gray
        
        lblNumbers.text = String(numbers[0])
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        
        lblNumbers.text = String(numbers[pageControl.currentPage])
    }
    
}

