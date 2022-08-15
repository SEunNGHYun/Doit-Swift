//
//  ViewController.swift
//  15_carmera
//
//  Created by 윤승현 on 2022/08/14.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    let imagePicker : UIImagePickerController! = UIImagePickerController()
    var captureImage : UIImage!
    var videoURL: URL!
    var flagImageSave = false
    var numImage = 0
    
    @IBOutlet var imageView3: UIImageView!
    @IBOutlet var ImageView2: UIImageView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCaptureImageFromCarnera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            
            numImage = numImage + 1
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }else{
            myAlert("Camera inaccessable", message: "application cannot access the camera")
        }
    }
    @IBAction func btnLoadImageFromLibary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            
            numImage = numImage + 1
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated:true)
        }else{
            myAlert("photo album inaccessable", message: "application cannot access the photo album")
        }
    }
    
    @IBAction func btnRecoardVideoFromCarmera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }else{
            myAlert("Camera inaccessable", message: "application cannot access the camera")
        }
        
    }
    
    @IBAction func btnLoadVideoFromLibary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated:true)
        }else{
            myAlert("photo album inaccessable", message: "application cannot access the photo album")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        numImage = numImage - 1
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnEmpty(_ sender: Any) {
        imageView3.image = nil
        ImageView2.image = nil
        imageView.image = nil
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: "public.image" as String){
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            if numImage == 0{
                imageView.image = captureImage
            }else if numImage == 1 {
                ImageView2.image = captureImage
            }else{
                imageView3.image = captureImage
            }
        }else {
            if flagImageSave {
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
            }
            UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
        }
    }
    
    func myAlert(_ title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action  = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

