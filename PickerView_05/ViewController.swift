//
//  ViewController.swift
//  PickerView_05
//
//  Created by 윤승현 on 2022/08/05.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 2
    let PICKER_VIEW_HIGH: CGFloat = 80
    var imageFileName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg","6.jpg", "7.jpg", "8.jpg","9.jpg" , "10.jpg"]
    var imageArray = [UIImage?]()

    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var Ib1ImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        //imageArray에 imageFileName에 이름을 가진 이미지들을 널어주는 함수
        //view가 로드되었을 때 실행이된다.
        
        Ib1ImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
        //매열에 첫번째 이미지의 이름과 이미지를 화면에 출력
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    //Picker의 열의 갯수를 지정해주는 함수
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image : imageArray[row])
        imageView.frame = CGRect(x:0, y:0, width: 100, height: 150)
        
        return imageView
    }
    //선택된 picker의 이미지를 크기에 맞게 보여줌
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HIGH
    }//picker의 세로길이를 지정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }//picker에 출력되는 이름들을 정해주는 함수
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            Ib1ImageFileName.text = imageFileName[row]
        }else{
            imageView.image = imageArray[row]
        }
    }//Picker가 변함에 따라 실행할 함수 선언
    
    
    //UIPickerViewDataSource에 포함된 함수둘 같은 이름을 가지더라도 인수가 다르기에 기능에 맞는 인수를 골라 사용가능하다.
  
    
}

