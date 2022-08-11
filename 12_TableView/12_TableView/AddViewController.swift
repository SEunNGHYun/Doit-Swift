//
//  AddViewController.swift
//  12_TableView
//
//  Created by 윤승현 on 2022/08/11.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let PICKER_VIEW_COLUMN = 1
    var iconImages = [UIImage?]()
    var choiceImageFile : String = ""
    
    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var pkImages: UIPickerView!
    @IBOutlet var AddImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddImage.image = UIImage(named: itemsImageFile[0])
        choiceImageFile = itemsImageFile[0]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(choiceImageFile)
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    
    //picker 열 갯수 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsImageFile.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return itemsImageFile[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        choiceImageFile = itemsImageFile[row]
        AddImage.image = UIImage(named: itemsImageFile[row])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
